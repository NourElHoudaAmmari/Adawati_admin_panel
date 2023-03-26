// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:adawati_admin_panel/constants.dart';
import 'package:adawati_admin_panel/services/sidebar.dart';
import 'package:adawati_admin_panel/widgets/user_datatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});
static const String id = 'user-screen';
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
      sideBar: _sideBar.sideBarMenus(context,UserScreen.id),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Utilisateurs',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 36,
                  color: kontColor,
                ),
              ),
              Divider(thickness: 2,),
              SizedBox(height: 18,),
                            ClientsTable(),
            ],
          ),

        ),
      ),
    );
  }
}