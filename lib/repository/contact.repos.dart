import 'dart:math';

import 'package:contact_app/model/contact.model.dart';

class ContactRepos {
  Map<int , Contact> data = {
    1 : Contact(id: 1 ,name:  'mohsin' ,profile:  "Mo" ,score:  10,type:  "family",selected: false),
    2 : Contact(id: 2 ,name:  'omar' ,profile:  "Mo" ,score:  60,type:  "friend",selected: false),
    3 : Contact(id: 3 ,name:  'reda' ,profile:  "Mo" ,score:  50,type:  "friend",selected: false),
    4 : Contact(id: 4 ,name:  'hasna' ,profile:  "Mo" ,score:  40,type:  "friend",selected: false),
    5 : Contact(id: 5 ,name:  'fatah' ,profile:  "Mo" ,score:  30,type:  "family",selected: false),
    6 : Contact(id: 6 ,name:  'mohammed' ,profile:  "Mo" ,score:  20,type:  "family",selected: false)
  };

  Future<List<Contact>> all() async {
    await Future.delayed(Duration(seconds: 1));
    int rn = Random().nextInt(10);
      if(rn < 3) {
      throw Exception("internet Error");
    }
    return data.values.toList();
  }


  Future<List<Contact>> filterContact(String type) async {
    await Future.delayed(Duration(seconds: 1));

    int rn = Random().nextInt(10);
    if(rn < 3) {
      throw Exception("internet Error");
    }
    return data.values.where((element) => element.type == type).toList();
  }


  Future<Contact> save(Contact contact) async {
    await Future.delayed(Duration(seconds: 1));
    int rn = Random().nextInt(10);
    if(rn < 3){
      throw Exception("internet Error");
    }
    data[data.keys.length] = contact;
    return contact;
  }

  Future<void> delete(Contact contact) async {
    await Future.delayed(Duration(seconds: 1));
    int rn = Random().nextInt(10);
    if(rn < 3){
      throw Exception("internet Error");
    }
    data.remove(contact.id);
  }

  Future<void> deleteAll(List<Contact> contacts) async {
    await Future.delayed(Duration(seconds: 1));
    int rn = Random().nextInt(10);
    if(rn < 0){
      throw Exception("internet Error");
    }
    for(Contact contact in contacts){
      data.remove(contact.id);
    }
  }

}