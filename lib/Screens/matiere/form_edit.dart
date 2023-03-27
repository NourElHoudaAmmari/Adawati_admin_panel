<<<<<<< HEAD
import 'dart:html';

import 'package:adawati_admin_panel/constants.dart';
=======
>>>>>>> 69ff65da0a1c551c12a863a67a4454a0907d7aa1
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
<<<<<<< HEAD
      style: TextStyle(color: Colors.grey[400]),
=======
      
>>>>>>> 69ff65da0a1c551c12a863a67a4454a0907d7aa1
      controller: mycontroller,
      validator: (value){
        if(value!.isEmpty){
          return "the $labledText is required";
<<<<<<< HEAD
          
=======
>>>>>>> 69ff65da0a1c551c12a863a67a4454a0907d7aa1
        }
      },
      decoration:InputDecoration(
        labelText: labledText,
       enabledBorder: const OutlineInputBorder(
<<<<<<< HEAD
        borderSide: BorderSide(width: 3,color: kontColor,)
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 3,color: kontColor)),
=======
        borderSide: BorderSide(width: 3,color: Colors.blue,)
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 3,color: Colors.blue)),
>>>>>>> 69ff65da0a1c551c12a863a67a4454a0907d7aa1
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 3,color: Colors.red)),
            focusedErrorBorder: const OutlineInputBorder(borderSide: BorderSide(width: 3,color: Colors.red))
      ),
     
              
    );
  }
<<<<<<< HEAD
}
=======
}
>>>>>>> 69ff65da0a1c551c12a863a67a4454a0907d7aa1
