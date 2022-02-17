import 'package:contact_app/enum/RequestState.dart';
import 'package:contact_app/model/contact.model.dart';

import 'contact.action.dart';


class ContactState{
  RequestState requestState;
  String messageError;
  List<Contact> contacts;
  ContactAction event;

  ContactState({required this.contacts , required this.requestState
    , required this.messageError ,required this.event});

  ContactState copyWith({
    String? messageError , List<Contact>? contacts
    , ContactAction? event, RequestState? requestState , bool? selected})
  {
    return ContactState(contacts: contacts ?? this.contacts, requestState: requestState ?? this.requestState ,
        messageError: messageError ?? this.messageError, event: event ?? this.event
    );
  }
}