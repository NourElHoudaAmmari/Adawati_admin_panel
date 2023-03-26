import 'package:adawati_admin_panel/constants.dart';
import 'package:adawati_admin_panel/services/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';

class NiveauScreen extends StatelessWidget {
  const NiveauScreen({super.key});
static const String id = 'niveau-screen';
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
      sideBar: _sideBar.sideBarMenus(context,NiveauScreen.id),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(10),
          child: const Text(
            'Niveau',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 36,
              color: kontColor,
            ),
          ),
        ),
      ),
    );
  }
}