import 'package:contact_app/bloc/message/message.action.dart';
import 'package:contact_app/bloc/message/message.bloc.dart';
import 'package:contact_app/bloc/message/message.state.dart';
import 'package:contact_app/repository/message.repos.dart';
import 'package:contact_app/ui/screens/message/widgets/message.list.item.widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessageListWidget extends StatelessWidget {
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<MessageBloc , MessageState>(
        builder: (context, state) {
          WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
            if(_scrollController.hasClients){
              _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
            }
          });
          return ListView.separated(
            controller: _scrollController,
            itemCount: state.messages.length,
            separatorBuilder: (context, index) => Divider(color: Colors.orangeAccent ,height:4,),
            itemBuilder: (context, index) {
              return MessageListItemWidgets(message: state.messages[index]);
            },
          );
        },
      ),
    );
  }
}
