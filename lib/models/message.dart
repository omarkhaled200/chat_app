import 'package:chat_app1/constants.dart';

class Message {
  final String message;
  final String id;

  Message(this.message, this.id);
  factory Message.fromJson(jsondata) {
    return Message(jsondata[kmessage],jsondata[Kid]);
  }
}
