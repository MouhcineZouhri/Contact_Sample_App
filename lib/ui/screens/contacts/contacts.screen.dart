import 'package:contact_app/bloc/contact/contact.action.dart';
import 'package:contact_app/bloc/contact/contact.bloc.dart';
import 'package:contact_app/bloc/contact/contact.state.dart';
import 'package:contact_app/enum/RequestState.dart';
import 'package:contact_app/share/error.message.widget.dart';
import 'package:contact_app/ui/screens/contacts/widgets/list.contact.widget.dart';
import 'package:contact_app/ui/screens/contacts/widgets/navigate.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    context.read<ContactBloc>().add(GetAllContacts());
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
        actions: [
            BlocBuilder<ContactBloc , ContactState>(
                builder:(_, state) {
                  if(state.contacts.where((e) =>e.selected == true).toList().length > 0){
                    return Row(
                      children: [
                        IconButton(
                            onPressed: (){
                                  context.read<ContactBloc>().add(DeleteSelectedContact());
                            },
                            icon: Icon(Icons.delete, color: Colors.white,)
                        ),
                        IconButton(onPressed: (){
                          Navigator.pushNamed(context, "/contact");
                        },
                            icon: Icon(Icons.favorite))
                      ]
                    );
                  }
                  return Container();
                },
            )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            NavigateContactWidget()
            ,Expanded(
              child: BlocBuilder<ContactBloc , ContactState>(
              builder: (context, state) {
                switch(state.requestState){
                  case RequestState.LOADING:
                    return Center(child: CircularProgressIndicator());
                  case RequestState.ERROR:
                    return ErrorMessageWidget(
                      onPressed: (){
                        context.read<ContactBloc>().add(state.event);
                      },
                      title: state.messageError,
                    );
                  case RequestState.LOADED:
                    return ListContactWidget(contacts: state.contacts);
                    default:
                      return Container();
                }
              }
          ),
            ),]
        ),
      ),
    );
  }
}
