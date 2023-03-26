
import 'package:adawati_admin_panel/Screens/categorie_screen.dart';
import 'package:adawati_admin_panel/Screens/etat/etat.dart';
import 'package:adawati_admin_panel/Screens/etat_screen.dart';
import 'package:adawati_admin_panel/Screens/home_screen.dart';
import 'package:adawati_admin_panel/Screens/login_screen.dart';
import 'package:adawati_admin_panel/Screens/niveau_screen.dart';
import 'package:adawati_admin_panel/Screens/user_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Screens/matiere/matiere.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'Screens/niveau/niveau.dart';

void main() async {

WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
  options: FirebaseOptions(
 apiKey: "AIzaSyCkMtHeRa5qvup24yPS7-NL7BO9uY4QHlc",
    appId: "1:556775697133:web:5305a4060247df2b56bae4",
    messagingSenderId: "556775697133",
      projectId: "adawati-7f36f")
);
FirebaseFirestore.instance.settings =
  const Settings(cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);
runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //close dialog
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
 
      theme: ThemeData(
        primaryColor: Color(0xFFFF7043),
        backgroundColor: Color(0xFFFF7043),
        textTheme: TextTheme(
          headline6: TextStyle(
            color: Color(0xFFFF7043),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home:  LoginScreen(),
      routes: {
        HomeScreen.id:(context)=>  HomeScreen(),
        CategorieScreen.id:(context)=>CategorieScreen(),
       Etat.id:(context)=> Etat(),
         Matiere.id:(context)=> Matiere(),
          UserScreen.id:(context)=> UserScreen(),
          Niveau.id:(context)=>Niveau(),

      },
    );
  }
}

