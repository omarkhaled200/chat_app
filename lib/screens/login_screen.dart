
import 'package:chat_app1/constants.dart';
import 'package:chat_app1/helper/show_snack_bar.dart';
import 'package:chat_app1/screens/chat_screen.dart';
import 'package:chat_app1/screens/sign_up.dart';
import 'package:chat_app1/widget.dart/custom_button.dart';
import 'package:chat_app1/widget.dart/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  static  String id = 'loginscreen';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? email;

  String? password;

  GlobalKey<FormState> formkey = GlobalKey();

  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Form(
          key: formkey,
          child: ListView(
            children: [
              SizedBox(
                height: 250,
              ),
              Image.asset(
                'assets/images/scholar.png',
                height: 100,
              ),
              Center(
                child: Text(
                  'Scholar Chat',
                  style: TextStyle(
                    fontFamily: 'Pacifico-Regular',
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 150,
              ),
              Container(
                padding: EdgeInsets.all(8),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sign In',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    CustomTextField(
                      hinttext: 'Enter your Email',
                      labeltext: 'Email',
                      onchanged: (data) {
                        email = data;
                      },
                    ),
                    CustomTextField(
                      obscuretext: true,
                      hinttext: 'Enter your password',
                      labeltext: 'Password',
                      onchanged: (data) {
                        password = data;
                      },
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    CustomButton(
                        text: 'Sign In',
                        onpressed: () async {
                          if (formkey.currentState!.validate()) {
                            isloading = true;
                            setState(() {});
                            try {
                              await loginuser();
                              Navigator.pushNamed(context, ChatScreen.id,arguments: email);
                            } on FirebaseAuthException catch (ex) {
                              if (ex.code == 'user-not-found') {
                                showSnackbar(
                                    context, 'No user found for that email');
                              } else if (ex.code == 'wrong-password') {
                                showSnackbar(context,
                                    'Wrong password provided for that user.');
                              }
                            } catch (ex) {
                              showSnackbar(context, "there was an error");
                            }
                            isloading = false;
                            setState(() {});
                          } else {}
                        }),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'don\'t have an account?  ',
                            style: TextStyle(color: Colors.white),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 4.0),
                            child: InkWell(
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(color: Color(0xffC6E8E8)),
                                ),
                                onTap: () {
                                  Navigator.pushNamed(context, SignUp.id);
                                }),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> loginuser() async {
    UserCredential user =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
