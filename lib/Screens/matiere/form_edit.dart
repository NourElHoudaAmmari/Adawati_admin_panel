import 'dart:html';

import 'package:adawati_admin_panel/constants.dart';
import 'package:flutter/material.dart';
class FormEdit extends StatelessWidget {
  final labledText;
  final TextEditingController mycontroller;

FormEdit({
  required this.labledText,
  required this.mycontroller
}); 

  // ignore: empty_constructor_bodies
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.grey[600]),
      controller: mycontroller,
      validator: (value){
        if(value!.isEmpty){
          return "the $labledText is required";
          
        }
      },
      decoration:InputDecoration(
        labelText: labledText,
       enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(width: 3,color: kontColor,)
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 3,color: kontColor)),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 3,color: Colors.red)),
            focusedErrorBorder: const OutlineInputBorder(borderSide: BorderSide(width: 3,color: Colors.red))
      ),
     
              
    );
  }
}
