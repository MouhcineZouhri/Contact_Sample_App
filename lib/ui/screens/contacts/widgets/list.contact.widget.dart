import 'package:contact_app/bloc/contact/contact.action.dart';
import 'package:contact_app/bloc/contact/contact.bloc.dart';
import 'package:contact_app/model/contact.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListContactWidget extends StatelessWidget {
  List<Contact> contacts;

  ListContactWidget({required this.contacts});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (_, index) {
          return ListTile(
            selected:contacts[index].selected,
            selectedTileColor: Colors.amber,
            onTap: (){
              Navigator.pushNamed(context, "/message", arguments: contacts[index]);
            },
            onLongPress: (){
              context.read<ContactBloc>().add(SelectContact(payload: contacts[index]));
            },
            leading: CircleAvatar(
              radius: 30,
              child: Text(contacts[index].profile ,),
            ),
            title: Text(contacts[index].name,
              style: TextStyle(
                  fontSize: 18
              ),),
            trailing: CircleAvatar(
              child: Text("${contacts[index].score}"),
            ),
          );
        },
        separatorBuilder:(context, index) {
          return Divider(color: Colors.deepOrange, height: 10,);
        } ,
        itemCount: contacts.length
    );
  }
}
