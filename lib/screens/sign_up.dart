import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:chat_app1/constants.dart';
import 'package:chat_app1/helper/show_snack_bar.dart';
import 'package:chat_app1/screens/login_screen.dart';
import 'package:chat_app1/widget.dart/custom_button.dart';
import 'package:chat_app1/widget.dart/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUp extends StatefulWidget {
  SignUp({super.key});
  static String id = 'Sign_Up';

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String? firstname;

  String? lastname;

  String? email;

  String? password;

  GlobalKey<FormState> formkey = GlobalKey();

  bool isloading = false;

  CollectionReference users = FirebaseFirestore.instance.collection(kusercontorllar);

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
                height: 220,
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
                height: 100,
              ),
              Container(
                padding: EdgeInsets.all(8),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'REGISTER',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    CustomTextField(
                      hinttext: 'your First name',
                      labeltext: 'First name',
                      onchanged: (data) {
                        firstname = data;
                      },
                    ),
                    CustomTextField(
                      hinttext: 'your Last name',
                      labeltext: 'Last name',
                      onchanged: (data) {
                        lastname = data;
                      },
                    ),
                    CustomTextField(
                      hinttext: 'Enter your Email',
                      labeltext: 'Email',
                      onchanged: (data) {
                        email = data;
                      },
                    ),
                    CustomTextField(
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
                        text: 'Register',
                        onpressed: () async {
                          if (formkey.currentState!.validate()) {
                            isloading = true;
                            setState(() {});
                            try {
                              await registeruser();

                              showSnackbar(context, 'Created Successfully');
                              Navigator.pushNamed(context, LoginScreen.id);
                            } on FirebaseAuthException catch (ex) {
                              print(ex.code);
                              if (ex.code == 'weak-password') {
                                showSnackbar(context, 'The password is Weak');
                              } else if (ex.code == 'email-already-in-use') {
                                showSnackbar(context, 'email already exists');
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
                            'Already have an account? ',
                            style: TextStyle(color: Colors.white),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 4.0),
                            child: InkWell(
                                child: Text(
                                  'Sign In',
                                  style: TextStyle(color: Color(0xffC6E8E8)),
                                ),
                                onTap: () {
                                  Navigator.pop(context);
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

  Future<void> registeruser() async {
    UserCredential user =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
    users.add({
      'First name': firstname,
      'Last name': lastname,
      'email': email,
      'password': password,
    });
  }
}
