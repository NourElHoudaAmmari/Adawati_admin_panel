import 'dart:js';
import 'package:adawati_admin_panel/Screens/categorie/categorie.dart';
import 'package:adawati_admin_panel/Screens/categorie_screen.dart';
import 'package:adawati_admin_panel/Screens/demande/demande.dart';
import 'package:adawati_admin_panel/Screens/dons/dons.dart';
import 'package:adawati_admin_panel/Screens/etat/etat.dart';
import 'package:adawati_admin_panel/Screens/home_screen.dart';
import 'package:adawati_admin_panel/Screens/matiere/matiere.dart';
import 'package:adawati_admin_panel/Screens/niveau/niveau.dart';
import 'package:adawati_admin_panel/Screens/user_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';


class SideBarWidget{
  sideBarMenus(context, selectedRoute){
    return SideBar(
      activeBackgroundColor: Colors.black54,
      activeIconColor: Colors.white,
      activeTextStyle: TextStyle(color:Colors.white),
        items: const [
          AdminMenuItem(
            title: 'Dashboard',
            route: HomeScreen.id,
            icon: Icons.dashboard,
          ),
          AdminMenuItem(title: 'Parametrage',
          icon: Icons.settings,
          children: [
           AdminMenuItem(
            title: 'Categorie',
            route: Categorie.id,
            icon: Icons.category,
          ),
            AdminMenuItem(
            title: 'Niveau',
            route: Niveau.id,
            icon: CupertinoIcons.create,
          ),
            AdminMenuItem(
            title: 'Matiere',
            route:  Matiere.id,
            icon: Icons.book,
          ),
            AdminMenuItem(
            title: 'Etat',
            route:  Etat.id,
            icon: Icons.check_box,
          ),
           ]),
             AdminMenuItem(
            title: 'Dons',
            route: Don.id,
            icon: Icons.post_add,
          ),
            AdminMenuItem(
            title: 'Demande',
            route: Demande.id,
            icon: Icons.add_task,
          ),
            AdminMenuItem(
            title: 'Utilisateurs',
            route: UserScreen.id,
            icon: Icons.person,
          ),
             AdminMenuItem(
            title: 'Deconnexion',
            route: '/',
            icon: Icons.exit_to_app,
          ),
          
        ],
        selectedRoute: selectedRoute,
        onSelected: (item) {
          if (item.route != null) {
            Navigator.of(context).pushNamed(item.route!);
          }
        },
        header: Container(
          height: 50,
          width: double.infinity,
          color: Color.fromARGB(255, 155, 154, 154),
          child: const Center(
            child: Text(
              'MENU',
              style: TextStyle(letterSpacing: 2,
                color: Colors.white,fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
        footer: Container(
          height: 50,
          width: double.infinity,
          color: Color.fromARGB(255, 250, 249, 249),
          child:  Center(
              child: Image.asset('assets/images/logo.png'),
           
          ),
        ),
      );
  }
}