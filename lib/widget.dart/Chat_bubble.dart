import 'package:chat_app1/constants.dart';
import 'package:chat_app1/models/message.dart';
import 'package:flutter/material.dart';

class Chatbubble extends StatelessWidget {
  const Chatbubble({
    super.key, required this.message,
  });
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
                bottomRight: Radius.circular(32))),
        child: Text(
          message.message,
          style: TextStyle(color: Colors.white, fontSize: 17),
        ),
      ),
    );
  }
}

class Chatbubbleforfreinds extends StatelessWidget {
  const Chatbubbleforfreinds({
    super.key, required this.message,
  });
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: ksecondColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
                bottomLeft: Radius.circular(32))),
        child: Text(
          message.message,
          style: TextStyle(color: Colors.white, fontSize: 17),
        ),
      ),
    );
  }
}