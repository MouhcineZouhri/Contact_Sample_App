
import 'package:contact_app/model/contact.model.dart';

abstract class ContactAction{}

class GetAllContacts extends ContactAction{}

class GetFilterContact extends ContactAction{
  String payload="";

  GetFilterContact(String payload){
    this.payload= payload;
  }
}

class SelectContact extends ContactAction{
    Contact payload;

    SelectContact({required this.payload});
}

class DeleteSelectedContact extends ContactAction{

}


class AddContact extends ContactAction{
  Contact paylaod;
  AddContact({required this.paylaod});
}

class DeleteContact extends ContactAction{
  Contact paylaod;
  DeleteContact({required this.paylaod});
}