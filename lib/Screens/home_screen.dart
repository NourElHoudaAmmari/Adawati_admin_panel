// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:async';
import 'package:adawati_admin_panel/constants.dart';
import 'package:adawati_admin_panel/services/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home-screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String timeText = "";
  String dateText = "";
  String formatCurrentLiveTime(DateTime time){
    return DateFormat("hh:mm:ss a").format(time);
  }

    String formatCurrentDate(DateTime date){
    return DateFormat("dd MMMM, yyyy").format(date);
  }

  getCurrentLiveTime(){
    final DateTime timeNow = DateTime.now();
    final String liveTime = formatCurrentLiveTime(timeNow);
    final String liveDate = formatCurrentDate(timeNow);

    if(this.mounted){
      setState(() {
        timeText = liveTime;
        dateText = liveDate;
      });
    }
  }

  @override
  void get initState{
    super.initState;

   timeText= formatCurrentLiveTime(DateTime.now());

   dateText= formatCurrentDate(DateTime.now());
   Timer.periodic(const Duration(seconds: 1), (timer) { 
    getCurrentLiveTime();
   });
  }
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
          // ignore: prefer_const_constructors
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
Center(
  child: Padding(
    padding: const EdgeInsets.all(12.0),
    child: Text(
      timeText + "\n"+ dateText,
      style: const TextStyle(
        fontSize: 20,
        color: Colors.black,
        letterSpacing: 3,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
),

            ],
          ),
          
        ),
      ),
    );
  }
}
