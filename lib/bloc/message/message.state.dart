import 'package:contact_app/bloc/contact/contact.action.dart';
import 'package:contact_app/bloc/message/message.action.dart';
import 'package:contact_app/enum/RequestState.dart';
import 'package:contact_app/model/message.model.dart';


class MessageState{

  MessageState({required this.messages , required this.requestState , required this.event ,required this.messageError});

  RequestState requestState;
  String messageError;
  List<Message> messages;
  MessageAction event;

  MessageState copyWith({
    String? messageError , List<Message>? messages
    , MessageAction? event, RequestState? requestState , bool? selected})
  {
    return MessageState(messages: messages ?? this.messages,
        requestState: requestState ?? this.requestState,
        event: event ?? this.event, messageError: messageError ?? this.messageError);
  }


}