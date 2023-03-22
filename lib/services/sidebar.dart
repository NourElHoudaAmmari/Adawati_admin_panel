

import 'dart:js';

import 'package:adawati_admin_panel/Screens/categorie_screen.dart';
import 'package:adawati_admin_panel/Screens/etat_screen.dart';
import 'package:adawati_admin_panel/Screens/home_screen.dart';
import 'package:adawati_admin_panel/Screens/matiere_screen.dart';
import 'package:adawati_admin_panel/Screens/niveau_screen.dart';
import 'package:adawati_admin_panel/Screens/user_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';

class SideBarWidget{
  sideBarMenus(context, selectedRoute){
    return SideBar(
        items: const [
          AdminMenuItem(
            title: 'Dashboard',
            route: HomeScreen.id,
            icon: Icons.dashboard,
          ),
            AdminMenuItem(
            title: 'Categorie',
            route: CategorieScreen.id,
            icon: Icons.category,
          ),
            AdminMenuItem(
            title: 'Niveau',
            route: NiveauScreen.id,
            icon: CupertinoIcons.create,
          ),
            AdminMenuItem(
            title: 'Matiere',
            route: MatiereScreen.id,
            icon: Icons.book,
          ),
            AdminMenuItem(
            title: 'Etat',
            route: EtatScreen.id,
            icon: Icons.check_box,
          ),
            AdminMenuItem(
            title: 'Utilisateurs',
            route: UserScreen.id,
            icon: Icons.person,
          ),
             AdminMenuItem(
            title: 'Déconnexion',
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
          color: const Color(0xff444444),
          child: const Center(
            child: Text(
              'MENU',
              style: TextStyle(letterSpacing: 2,
                color: Colors.white,
              ),
            ),
          ),
        ),
        footer: Container(
          height: 50,
          width: double.infinity,
          color: const Color(0xff444444),
          child:  Center(
              child: Image.asset('assets/images/logo.png'),
           
          ),
        ),
      );
  }
}