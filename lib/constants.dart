import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

const kPrimaryColor = Color(0xFFFF7043);
const kontColor = Color(0xFF5C6BC0);
const kPrimaryLightColor = Color(0xFFF5F5F5);
const primaryColor = Color(0xFF2697FF);
const secondaryColor = Color(0xFF2A2D3E);
const bgColor = Color(0xFF212332);
Color light =  const Color(0xFFFF7043);
Color lightGray = const Color(0xFFA4A6B3);
Color dark = const Color(0xFF363740);
Color active = const Color(0xFF5C6BC0);
  
const double defaultPadding = 16.0;
final Future<FirebaseApp> initialization = Firebase.initializeApp();

FirebaseFirestore firebaseFiretore = FirebaseFirestore.instance;
FirebaseAuth auth = FirebaseAuth.instance;