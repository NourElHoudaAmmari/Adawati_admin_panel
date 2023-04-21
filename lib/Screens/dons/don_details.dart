import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../services/sidebar.dart';
import 'editdon.dart';


class DonDetails extends StatefulWidget {
  DonDetails(this.itemId, {Key? key}) : super(key: key) {
    _reference = FirebaseFirestore.instance.collection('dons').doc(itemId);
    _futureData = _reference.get();
  }

  String itemId;
  late DocumentReference _reference;
  late Future<DocumentSnapshot> _futureData;

  @override
  State<DonDetails> createState() => _DonDetailsState();
}

class _DonDetailsState extends State<DonDetails> {
  late Map data;
  
  late String itemId;

  @override
  Widget build(BuildContext context) {
    SideBarWidget _sideBar = SideBarWidget();
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        bool isMobile = constraints.maxWidth < 768; // Vérifier si l'écran est de taille mobile (largeur < 768)
        return Scaffold(
          appBar: AppBar(
            backgroundColor: kontColor,
            iconTheme: IconThemeData(color: Colors.white),
            title: const Text(
              'Adawati Dashboard',
              style: TextStyle(color: Colors.white),
            ),
          ),
          //sideBar: _sideBar.sideBarMenus(context, DonDetails),
          body: FutureBuilder<DocumentSnapshot>(
            
            future: widget._futureData,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                return Center(
                    child: Text('Some error occurred ${snapshot.error}'));
              }

              if (snapshot.hasData) {
                //Get the data
                DocumentSnapshot documentSnapshot = snapshot.data;
                data = documentSnapshot.data() as Map;

                //display the data in a table
                return Padding(
                  padding: EdgeInsets.only(
                      left: isMobile ? 20.0 : 100.0,
                      right: isMobile ? 20.0 : 100.0),
                  child: Align(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Container(
                          
                          height: 270.0,
                          width: 400.0,
                          decoration:
                              BoxDecoration(border: Border.all(color: Colors.white)),
                          padding: EdgeInsets.all(5.0),
                          child: data.containsKey('image')
                              ? Image.network('${data['image']}')
                              : Container(),
                        ),
                        SizedBox(height: 10),
                        //padding: const EdgeInsets.only(left: 20.0),
                        Padding(
                         padding: const EdgeInsets.only(right: 20.0),
                          child: IconButton(
                          icon: Icon(Icons.edit),
                          color: Colors.blue, // Icône de modification
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditDon(data),
                              ),
                            );
                          },
                        ),
                        ),

                        Text(
                          "Titre :  " '${data['title']}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: kontColor,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 13),
                        Text(
                          "Informations :",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 8),
                        Table(
                          columnWidths: const {
                            0: FlexColumnWidth(1),
                            1: FlexColumnWidth(3),
                          },
                          children: [
                            TableRow(
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 16.0),
                                    child: Text(
                                      "Categorie :",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 16.0),
                                    child: Text(
                                      "${data['categorie']}",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            
                            TableRow(
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 16.0),
                                    child: Text(
                                      "Etat :",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 16.0),
                                    child: Text(
                                      "${data['etat']}",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 16.0),
                                    child: Text(
                                      "Description :",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 16.0),
                                    child: Text(
                                      "${data['description']}",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 16.0),
                                    child: Text(
                                      "Contact :",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 16.0),
                                    child: Text(
                                      "${data['phone']}",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            ],
                        ),
                      ],
                      
                    ),
                  ),
                );
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        );
      },
    );
  }
}

