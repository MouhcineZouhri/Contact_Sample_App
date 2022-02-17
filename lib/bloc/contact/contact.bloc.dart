import 'package:bloc/bloc.dart';
import 'package:contact_app/enum/RequestState.dart';
import 'package:contact_app/model/contact.model.dart';
import 'package:contact_app/repository/contact.repos.dart';

import 'contact.action.dart';
import 'contact.state.dart';

class ContactBloc extends Bloc<ContactAction , ContactState>{
  ContactRepos contactRepos;
  ContactBloc({required this.contactRepos}) : super(ContactState(
      contacts:[],requestState: RequestState.NONE, messageError: "",event: GetAllContacts())){
    on<GetAllContacts>(_getAllContact);
    on<GetFilterContact>(_getFilterContact);
    on<SelectContact>(_selectContact);
    on<DeleteSelectedContact>(_deleteSelectedContact);
  }

  void _getAllContact(GetAllContacts event, Emitter<ContactState> emit) async {
    try {
      emit(state.copyWith(event: event , requestState: RequestState.LOADING));
      List<Contact> contacts = await contactRepos.all();
      emit(state.copyWith(contacts: contacts,requestState: RequestState.LOADED));
    }catch (e) {
      emit(state.copyWith(messageError: e.toString(),requestState: RequestState.ERROR));
    }
  }

  void _getFilterContact(GetFilterContact event, Emitter<ContactState> emit) async {
    try {
      emit(state.copyWith(event: event , requestState: RequestState.LOADING));
      List<Contact> contacts = await contactRepos.filterContact(event.payload);
      emit(state.copyWith(contacts: contacts,requestState: RequestState.LOADED));
    }catch (e) {
      emit(state.copyWith(messageError: e.toString(),requestState: RequestState.ERROR));
    } 
  }

  void _selectContact(SelectContact event, Emitter<ContactState> emit) {
    List<Contact> contacts = state.contacts.map((e){
      if(e.id == event.payload.id){
        e.selected = !e.selected;
      }
      return e;
      }).toList();

    emit(state.copyWith(contacts: contacts));
  }

  void _deleteSelectedContact(DeleteSelectedContact event, Emitter<ContactState> emit) async {
    var removeContacts = state.contacts.where((element) => element.selected == true).toList();
    await contactRepos.deleteAll(removeContacts);
    var contacts = state.contacts.where((element) => element.selected != true).toList();
    emit(state.copyWith(contacts: contacts));
  }
}



