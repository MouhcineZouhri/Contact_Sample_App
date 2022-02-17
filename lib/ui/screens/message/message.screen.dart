import 'package:contact_app/bloc/message/message.action.dart';
import 'package:contact_app/bloc/message/message.bloc.dart';
import 'package:contact_app/bloc/message/message.state.dart';
import 'package:contact_app/enum/RequestState.dart';
import 'package:contact_app/model/contact.model.dart';
import 'package:contact_app/model/message.model.dart';
import 'package:contact_app/share/error.message.widget.dart';
import 'package:contact_app/ui/screens/message/widgets/message.form.dart';
import 'package:contact_app/ui/screens/message/widgets/message.list.widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessageScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context)?.settings.arguments as Contact;

    context.read<MessageBloc>().add(GetContactMessages(arguments.id));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Message"),
        actions: [
          BlocBuilder<MessageBloc , MessageState>(
            builder: (context, state) {
              List<Message> selectedMessage = state.messages.where((element) => element.selected == true).toList();
              if(selectedMessage.isNotEmpty){
                return IconButton(onPressed: () {
                  context.read<MessageBloc>().add(DeleteMessage());
                }, icon: const Icon(Icons.delete));
              }
              return Container();
            }
          )
        ],
      ),
      body:Column(
        children: [
          BlocBuilder<MessageBloc, MessageState>(
            builder: (context, state){
              switch(state.requestState){
                case RequestState.LOADING:
                  return Expanded(child:
                    const Center(
                      child: CircularProgressIndicator(),
                    )
                  );
                case RequestState.ERROR:
                  return Expanded(
                      child:Center(
                        child: ErrorMessageWidget(
                          title: state.messageError,
                          onPressed:()=>context.read<MessageBloc>().add(state.event),
                        ),
                      )
                  );
                case RequestState.LOADED:
                  return MessageListWidget();
                default:
                  return Container();
              }
            },
          ),
          MessageFormWidgets(contact: arguments,),
        ],
      ),
    );
  }
}
