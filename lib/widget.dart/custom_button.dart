import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({required this.text,this.onpressed});
  String text;
  VoidCallback? onpressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
            minimumSize: Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              
            )),
        onPressed:onpressed,
        child: Text(
          text,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
        ));
  }
}
