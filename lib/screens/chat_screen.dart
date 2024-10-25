import 'package:chat_app1/constants.dart';
import 'package:chat_app1/models/message.dart';
import 'package:chat_app1/widget.dart/Chat_bubble.dart';
import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});
  static String id = 'Chatscreen';
  final controllerscroll = ScrollController();
  CollectionReference messages =
      FirebaseFirestore.instance.collection(kmessagecontrollar);
  TextEditingController controllar = TextEditingController();
  @override
  Widget build(BuildContext context) {
  var email =  ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy(kcreatedAt, descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Message> messageslist = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messageslist.add(Message.fromJson(snapshot.data!.docs[i]));
          }

          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: kPrimaryColor,
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    kloge,
                    width: 90,
                    height: 70,
                  ),
                  Text(
                    'Chat',
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      reverse: true,
                      controller: controllerscroll,
                      itemCount: messageslist.length,
                      itemBuilder: (context, index) {
                         if( messageslist[index].id == email){
                        return  Chatbubble(message: messageslist[index]);
                        }else{
                        return  Chatbubbleforfreinds(message: messageslist[index],);
                        }
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    controller: controllar,
                    onSubmitted: (data) {
                      messages.add({
                        kmessage: data,
                        kcreatedAt: DateTime.now(),
                        Kid:email,
                      });
                      controllar.clear();
                      controllerscroll.animateTo(
                        0,
                        duration: Duration(seconds: 1),
                        curve: Curves.easeIn,
                      );
                    },
                    decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.send,
                          color: kPrimaryColor,
                        ),
                        hintText: 'Send message',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: kPrimaryColor))),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Text('loading....');
        }
      },
    );
  }
}
