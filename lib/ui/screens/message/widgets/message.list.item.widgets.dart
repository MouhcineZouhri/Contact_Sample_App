import 'package:contact_app/bloc/message/message.action.dart';
import 'package:contact_app/bloc/message/message.bloc.dart';
import 'package:contact_app/model/message.model.dart';
import 'package:contact_app/repository/message.repos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessageListItemWidgets extends StatelessWidget {
  Message message;

  MessageListItemWidgets({required this.message});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {
        context.read<MessageBloc>().add(SelectMessage(message));
      },
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          decoration: BoxDecoration(
              color: message.selected ?Colors.grey :Colors.white,
              borderRadius: BorderRadius.circular(10)
          ),
          child: Row(
            mainAxisAlignment: message.type == MessageType.RECEIVER
                ? MainAxisAlignment.start : MainAxisAlignment.end,
            children: [
              Flexible(
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color:
                    message.selected ? Colors.grey :
                    message.type == MessageType.RECEIVER ? Colors.orange :
                    Colors.greenAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(message.content,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
