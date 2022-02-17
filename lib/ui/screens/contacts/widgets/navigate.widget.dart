import 'package:contact_app/bloc/contact/contact.action.dart';
import 'package:contact_app/bloc/contact/contact.bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigateContactWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                context.read<ContactBloc>().add(GetAllContacts());
              },
              child: Text("All", style: TextStyle(
                fontSize: 18
              ),),
            ),
          ),
          SizedBox(width: 10,),
          Expanded(
            child: ElevatedButton(onPressed: () {
              context.read<ContactBloc>().add(GetFilterContact("family"));
            },
              child: Text("Family" ,
                  style: TextStyle(
                      fontSize: 18
                  )),
            ),
          ),
          SizedBox(width: 10,),
          Expanded(
            child: ElevatedButton(onPressed: () {
              context.read<ContactBloc>().add(GetFilterContact("friend"));
            },
              child: Text("Friend" , style: TextStyle(
                  fontSize: 18
              )),
            ),
          )
        ],
      ),
    );
  }
}
