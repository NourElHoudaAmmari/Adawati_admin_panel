import 'package:adawati_admin_panel/Screens/categorie_screen.dart';
import 'package:adawati_admin_panel/Screens/etat_screen.dart';
import 'package:adawati_admin_panel/Screens/matiere_screen.dart';
import 'package:adawati_admin_panel/Screens/niveau_screen.dart';
import 'package:adawati_admin_panel/Screens/user_screen.dart';
import 'package:adawati_admin_panel/constants.dart';
import 'package:adawati_admin_panel/services/sidebar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';

class HomeScreen extends StatelessWidget {
  static const String id = 'home-screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SideBarWidget _sideBar = SideBarWidget();
    return AdminScaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: kontColor,
        iconTheme: IconThemeData(color: Colors.white),
        title: const Text('Adawati Dashboard',style: TextStyle(color:Colors.white),),
      ),
      sideBar: _sideBar.sideBarMenus(context,HomeScreen.id),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(10),
          child: const Text(
            'Dashboard',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 36,
            ),
          ),
        ),
      ),
    );
  }
  }
