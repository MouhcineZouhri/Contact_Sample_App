import 'dart:ffi';

import 'package:contact_app/bloc/message/message.action.dart';
import 'package:contact_app/bloc/message/message.bloc.dart';
import 'package:contact_app/model/contact.model.dart';
import 'package:contact_app/model/message.model.dart';
import 'package:contact_app/repository/message.repos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessageFormWidgets extends StatelessWidget {
  TextEditingController _textEditingController= new TextEditingController();

  Contact contact;

  MessageFormWidgets({required this.contact});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TextFormField(
              controller:_textEditingController,
              maxLines: null,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          IconButton(onPressed:() {
            Message message = Message(id: null,contactID: contact.id,
                content: _textEditingController.text,
                type: MessageType.SENT, selected: false
            );
            context.read<MessageBloc>().add(AddMessage(message));

            Message answerMessage = Message(id: null,contactID: contact.id,
                content:"answer ${_textEditingController.text}",
                type: MessageType.RECEIVER, selected: false
            );
            context.read<MessageBloc>().add(AddMessage(answerMessage));

            _textEditingController.text = "";
          }, icon: Icon(Icons.send),
          )
        ],
      ),
    );
  }
}
