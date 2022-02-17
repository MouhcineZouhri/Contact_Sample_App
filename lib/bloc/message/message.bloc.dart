import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:contact_app/bloc/contact/contact.action.dart';
import 'package:contact_app/bloc/message/message.action.dart';
import 'package:contact_app/bloc/message/message.state.dart';
import 'package:contact_app/enum/RequestState.dart';
import 'package:contact_app/model/message.model.dart';
import 'package:contact_app/repository/message.repos.dart';

class MessageBloc extends Bloc<MessageAction , MessageState>{
  final MessageRepos messageRepos;

  MessageBloc({required this.messageRepos}) : super(
      MessageState(messages: [], requestState: RequestState.NONE
          , event:InitMessageAction(), messageError: "")){
    on<GetContactMessages>(_getContactMessages);
    on<AddMessage>(_addMessage);
    on<DeleteMessage>(_deleteMessage);
    on<SelectMessage>(_selectMessage);
  }

  FutureOr<void> _getContactMessages(GetContactMessages event, Emitter<MessageState> emit) async {
    emit(state.copyWith(requestState: RequestState.LOADING , event: event));
    try{
      List<Message> messages = await messageRepos.contactMessage(event.payload);
      emit(state.copyWith(messages: messages , requestState: RequestState.LOADED));
    }catch(e){
      emit(state.copyWith(messageError: e.toString() , requestState: RequestState.ERROR));
    }
  }

  FutureOr<void> _addMessage(AddMessage event, Emitter<MessageState> emit) async {
    try{
      Message message = await messageRepos.addMessage(event.payload);
      emit(state.copyWith(messages: [...state.messages , message] , requestState: RequestState.LOADED));
    }catch(e){
      emit(state.copyWith(messageError: e.toString() , requestState: RequestState.ERROR));
    }
  }

  FutureOr<void> _deleteMessage(DeleteMessage event, Emitter<MessageState> emit) async {
    try{
      List<Message> selectedMessages = state.messages.where((element) => element.selected == true).toList();
      await messageRepos.deleteMessages(selectedMessages);
      List<Message> unselectedMessages = state.messages.where((element) => element.selected != true).toList();
      emit(state.copyWith(messages: unselectedMessages , requestState: RequestState.LOADED));
    }catch(e){
      emit(state.copyWith(messageError: e.toString() , requestState: RequestState.ERROR));
    }
  }

  FutureOr<void> _selectMessage(SelectMessage event, Emitter<MessageState> emit) {
    var list = state.messages.map((e){
      if(e.id == event.payload.id){
        e.selected = !e.selected;
      }
      return e;
    }).toList();
    emit(state.copyWith(messages: list));
  }
}