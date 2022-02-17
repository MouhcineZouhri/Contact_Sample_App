import 'package:contact_app/model/message.model.dart';

abstract class MessageAction<T>{
  T payload ;
  MessageAction({required this.payload});
}

class InitMessageAction extends MessageAction<int>{
  InitMessageAction() : super(payload: 0);

}

class GetContactMessages extends MessageAction<int>{
  GetContactMessages(int payload) : super(payload : payload);
}

class AddMessage extends MessageAction<Message>{
  AddMessage(Message message) : super(payload: message);
}

class DeleteMessage extends MessageAction<int>{
  DeleteMessage() : super(payload: 0);
}


class SelectMessage extends MessageAction{
  SelectMessage(Message message) : super(payload: message);
}