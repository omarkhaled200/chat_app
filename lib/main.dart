import 'package:chat_app1/screens/chat_screen.dart';
import 'package:chat_app1/screens/login_screen.dart';
import 'package:chat_app1/screens/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(Chat_App());
}
class Chat_App extends StatelessWidget {
  const Chat_App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        LoginScreen.id:(context)=> LoginScreen(),
         SignUp.id : (context)=>  SignUp(),
         ChatScreen.id:(context)=>ChatScreen(),
      },
      initialRoute: LoginScreen.id,
    );
  }
}
