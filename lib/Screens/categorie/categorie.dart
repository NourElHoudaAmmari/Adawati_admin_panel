import 'package:adawati_admin_panel/Screens/categorie/add_edit_categorie.dart';
import 'package:adawati_admin_panel/constants.dart';
import 'package:adawati_admin_panel/controllers/categorie_controller.dart';
import 'package:adawati_admin_panel/models/categorie_model.dart';
import 'package:adawati_admin_panel/services/sidebar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';

class Categorie extends StatefulWidget {
   static const String id = 'categorie-screen';
  const Categorie({super.key});

  @override
  State<Categorie> createState() => _CategorieState();
}

class _CategorieState extends State<Categorie> {
   final CollectionReference _categorie =
      FirebaseFirestore.instance.collection("categories");
      void _showDeleteConfirmationDialog(String id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmation'),
          content: Text('Voulez-vous vraiment supprimer cet etat?'),
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
                CategorieController().delete_categorie(CategorieModel(id: id));
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
       sideBar: _sideBar.sideBarMenus(context,Categorie.id),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(10),
          child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             
               const Text(
                'Liste des catégories',
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
                  Navigator.push(context,
                     MaterialPageRoute(builder: (context) => AddEditCategorie()));
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
                  stream: _categorie.snapshots(),
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
                             final categorie= CategorieModel(
                                id: records.id,
                                libelle: records["libelle"],
                              );
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => AddEditCategorie(
                                            categorie: categorie,
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