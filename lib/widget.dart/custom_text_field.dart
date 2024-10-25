import 'dart:ffi';

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {required this.hinttext, required this.labeltext, this.onchanged,this.obscuretext=false});
  String? hinttext;
  String? labeltext;
  bool? obscuretext;
  Function(String)? onchanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: TextFormField(
        obscureText:obscuretext! ,
          validator: (data) {
            if (data!.isEmpty) {
              return 'Field is required';
            }
          },
          onChanged: onchanged,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.white),
            ),
            hintText: hinttext,
            labelText: labeltext,
            labelStyle:
                TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
            hintStyle: TextStyle(color: Colors.white, fontSize: 13),
          )),
    );
  }
}
