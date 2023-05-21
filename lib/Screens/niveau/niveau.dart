import 'package:adawati_admin_panel/Screens/niveau/add_edit_niveau.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';

import '../../constants.dart';
import '../../controllers/niveau_controller.dart';
import '../../models/niveau_model.dart';
import '../../services/sidebar.dart';

class Niveau extends StatefulWidget {
 const Niveau({Key? key}) : super(key: key);
  static const String id = 'niveau-screen';

  @override
  State<Niveau> createState() => _NiveauState();
}

class _NiveauState extends State<Niveau> {
 final CollectionReference _niveau =
      FirebaseFirestore.instance.collection("niveau");
      
  int _rowsPerPage = 10; // number of rows to display per page
  int _currentPage = 1; // current page number
  int _totalRows = 0; // total number of rows
  int _totalPages = 0;
      void _showDeleteConfirmationDialog(String id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmation'),
          content: Text('Voulez-vous vraiment supprimer cet niveau?'),
          actions: <Widget>[
            TextButton(
              child: Text('ANNULER'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(
                'SUPPRIMER',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
              onPressed: () {
                NiveauController().delete_niveau(NiveauModel(id: id));
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
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
       sideBar: _sideBar.sideBarMenus(context,Niveau.id),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(10),
          child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             
               const Text(
                'Liste des niveaux',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 36,
                  color: kontColor,
                ),
              ),
       Divider(thickness: 2,),
 Row(
  mainAxisAlignment: MainAxisAlignment.end,
  children: [
   Padding(
  padding: EdgeInsets.only(right: 18.0), // ajuster la valeur de left selon votre besoin
  child: SizedBox(
    width: 120,
    height: 28,
    child: ElevatedButton.icon(
              onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AddEditNiveau()));
              },
      icon: Icon(Icons.add),
      label: Text('Ajouter '),
      style: ElevatedButton.styleFrom(
        primary: kontColor,// couleur de fond
        onPrimary: Colors.white, // couleur du texte
      ),
    ),
  ),
),
  ],
),
SizedBox(height: 8,),
                 StreamBuilder<QuerySnapshot>(
                  stream: _niveau.snapshots(),
                  builder: (context, AsyncSnapshot snapshots) {
                    if (snapshots.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(color: Colors.blue),
                      );
                    }
                    if (snapshots.hasData) {
                      List<DataRow> rows = [];
                      for (int i = 0; i < snapshots.data.docs.length; i++) {
                        final DocumentSnapshot records = snapshots.data.docs[i];
                        rows.add(DataRow(cells: [
                    
                          DataCell(Text(records["libelle"])),
                          DataCell(Row(children: [
                            IconButton(
                              onPressed: () {
                              final niveau = NiveauModel(
                                id: records.id,
                                libelle: records["libelle"],
                              );
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => AddEditNiveau(
                                            niveau: niveau,
                                            index: i,
                                          ))));
                            },
                            icon: Icon(Icons.edit),
                            color: Colors.blue,
                            ),
                            IconButton(
                                onPressed: () {
                               _showDeleteConfirmationDialog(records.id);
                            },
                            icon: Icon(Icons.delete),
                            color: Colors.red,
                            ),
                          ],
                          ),
                          ),

                        ]
                        ));
                      }
                      return DataTable(
                         columnSpacing: 950.0,
                        // ignore: prefer_const_literals_to_create_immutables
                        columns: [
                           DataColumn(
                            label: Text('Libelle'),
                            numeric: false,
                          ),
                          DataColumn(
                            label: Text('Actions'),
                            numeric: false,
                          ),
                       
                        ],
                        rows: rows,
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(color: Colors.blue),
                       );
                    }
                  },
                ),
              
            ],
          ),
       
      ),
      )
      )
    );
  }
}
