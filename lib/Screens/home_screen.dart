// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:async';
import 'package:adawati_admin_panel/constants.dart';
import 'package:adawati_admin_panel/services/firebase_services.dart';
import 'package:adawati_admin_panel/services/sidebar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
  void  initState(){
    super.initState;

   /*timeText= formatCurrentLiveTime(DateTime.now());

   dateText= formatCurrentDate(DateTime.now());
   Timer.periodic(const Duration(seconds: 1), (timer) { 
    getCurrentLiveTime();
   });*/
  }
  FirebaseServices _services = FirebaseServices();
  @override
  Widget build(BuildContext context) {
    Widget analyticWidget(String title, String value){
      return  Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              height: 100,
              width: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueGrey),
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue,
              ),
              child:  Padding(
                padding:  EdgeInsets.all(18.0),
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(value),
                        Icon(Icons.show_chart),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
    }
    SideBarWidget _sideBar = SideBarWidget();
    return AdminScaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: kontColor,
        iconTheme: IconThemeData(color: Colors.white),
        title: const Text('Adawati Dashboard',style: TextStyle(color:Colors.white),),
      ),
      sideBar: _sideBar.sideBarMenus(context,HomeScreen.id),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
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
        'Welcome to Adawati Dashboard',
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
        Column(
          children: [
            Wrap(
              spacing: 20,
              runSpacing: 20,
                children: [
                  StreamBuilder<QuerySnapshot>(
      stream: _services.users.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  height: 100,
                  width: 200,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueGrey),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                  ),
                  child: Center(child: CircularProgressIndicator(color: Colors.white),),
                ),
              );
            }
            if(snapshot.hasData){
            return  analyticWidget("Total Utilisateur",snapshot.data!.size.toString());
            }
            return SizedBox();

      },
    ),
               StreamBuilder<QuerySnapshot>(
      stream: _services.categories.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  height: 100,
                  width: 200,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueGrey),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                  ),
                  child: Center(child: CircularProgressIndicator(color: Colors.white),),
                ),
              );
            }
            if(snapshot.hasData){
            return  analyticWidget("Total Categories",snapshot.data!.size.toString());
            }
            return SizedBox();

      },
    ),
                       StreamBuilder<QuerySnapshot>(
      stream: _services.dons.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  height: 100,
                  width: 200,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueGrey),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                  ),
                  child: Center(child: CircularProgressIndicator(color: Colors.white),),
                ),
              );
            }
            if(snapshot.hasData){
            return  analyticWidget("Total Dons",snapshot.data!.size.toString());
            }
            return SizedBox();

      },
    ),
              StreamBuilder<QuerySnapshot>(
      stream: _services.demande.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  height: 100,
                  width: 200,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueGrey),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                  ),
                  child: Center(child: CircularProgressIndicator(color: Colors.white),),
                ),
              );
            }
            if(snapshot.hasData){
            return  analyticWidget("Total Demandes",snapshot.data!.size.toString());
            }
            return SizedBox();

      },
    ),
                    StreamBuilder<QuerySnapshot>(
      stream: _services.matieres.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  height: 100,
                  width: 200,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueGrey),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                  ),
                  child: Center(child: CircularProgressIndicator(color: Colors.white),),
                ),
              );
            }
            if(snapshot.hasData){
            return  analyticWidget("Total Matieres",snapshot.data!.size.toString());
            }
            return SizedBox();

      },
    ),
              StreamBuilder<QuerySnapshot>(
      stream: _services.niveau.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  height: 100,
                  width: 200,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueGrey),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                  ),
                  child: Center(child: CircularProgressIndicator(color: Colors.white),),
                ),
              );
            }
            if(snapshot.hasData){
            return  analyticWidget("Total Niveaux",snapshot.data!.size.toString());
            }
            return SizedBox();

      },
    ),
                     StreamBuilder<QuerySnapshot>(
      stream: _services.etats.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  height: 100,
                  width: 200,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueGrey),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                  ),
                  child: Center(child: CircularProgressIndicator(color: Colors.white),),
                ),
              );
            }
            if(snapshot.hasData){
            return  analyticWidget("Total Etats",snapshot.data!.size.toString());
            }
            return SizedBox();

      },
    ),
               

                ],
              ),
          ],
        ),
        
         
        ],
      ),
    );
  }
}
