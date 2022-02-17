import 'package:contact_app/repository/message.repos.dart';

class Message{

  Message({this.id  ,required this.contactID, required this.content , required this.type , required this.selected});

  int? id;
  final int contactID;
  final String content;
  final MessageType type;
  bool selected ;
}