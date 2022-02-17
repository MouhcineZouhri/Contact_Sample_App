import 'dart:math';

import 'package:contact_app/model/message.model.dart';

enum MessageType{
  SENT , RECEIVER
}

class MessageRepos{
  Map<int , Message> data = {
    1 : Message(id: 1 ,contactID: 1 ,type: MessageType.SENT , content: "hi mohsin!" , selected: false),
    2 : Message(id: 2 ,contactID: 2 ,type:  MessageType.RECEIVER  , content: "hi mohsin!" , selected: false),
    3 : Message(id: 3 ,contactID: 1 ,type:  MessageType.RECEIVER, content: "hi mohsin!" , selected: false),
    4 : Message(id: 4 ,contactID: 3 ,type:  MessageType.SENT  , content: "hi mohsin!" , selected: false),
    5 : Message(id: 5 ,contactID: 4 ,type:  MessageType.RECEIVER  , content: "hi mohsin!" , selected: false),
    6 : Message(id: 6 ,contactID: 5 ,type:  MessageType.SENT  , content: "hi mohsin!" , selected: false),
    7 : Message(id: 7 ,contactID: 6 ,type:  MessageType.SENT  , content: "hi mohsin!" , selected: false),
    8 : Message(id: 8 ,contactID: 1 ,type:  MessageType.SENT  , content: "nice to meet you! qsdsqdsdd dddddddddd dddddddddddd ddddddddddddd dddddddddddd ddd" , selected: false),

  };

  Future<List<Message>> contactMessage(int contactID) async {
    int rn = Random().nextInt(10);
    await Future.delayed(Duration(seconds: 1));
    if(rn < 3) throw Exception("internet Error");
    return data.values.where((e) =>e.contactID == contactID).toList();
  }

  Future<Message> addMessage(Message message) async {
    int rn = Random().nextInt(10);
    await Future.delayed(Duration(seconds: 1));
    if(rn < 3) throw Exception("internet Error");
    message.id = data.keys.length + 1;
    data[data.keys.length + 1] = message;
    return message;
  }

  Future<void> deleteMessages(List<Message> messages) async {
    int rn = Random().nextInt(10);
    await Future.delayed(Duration(seconds: 1));
    if(rn < 3) throw Exception("internet Error");
    for(Message message in messages){
      data.remove(message.id);
    }
  }

}