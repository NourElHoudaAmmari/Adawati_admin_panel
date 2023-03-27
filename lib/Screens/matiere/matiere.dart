import 'package:adawati_admin_panel/Screens/matiere/add_edit_matiere.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../constants.dart';
import '../../controllers/matiere_controller.dart';
import '../../models/matiere_model.dart';
import '../../services/sidebar.dart';


class Matiere extends StatefulWidget {
  const Matiere({Key? key}) : super(key: key);
  static const String id = 'matiere-screen';

  @override
  State<Matiere> createState() => _MatiereState();
}
class _MatiereState extends State<Matiere> {
  final CollectionReference _matiere =
      FirebaseFirestore.instance.collection("matieres");
      void _showDeleteConfirmationDialog(String id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmation'),
          content: Text('Voulez-vous vraiment supprimer cette matière?'),
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
                MatiereController().delete_matiere(MatiereModel(id: id));
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
       sideBar: _sideBar.sideBarMenus(context,Matiere.id),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(10),
          child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             
               const Text(
                'Liste des matieres',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 36,
                  color: kontColor,
                ),
              ),
<<<<<<< HEAD
       Divider(thickness: 2,),
 Row(
  mainAxisAlignment: MainAxisAlignment.end,
  children: [
   Padding(
  padding: EdgeInsets.only(right: 16.0), // ajuster la valeur de left selon votre besoin
  child: SizedBox(
    width: 200,
    height: 28,
    child: ElevatedButton.icon(
              onPressed: () {
                   Navigator.push(context,
                     MaterialPageRoute(builder: (context) => AddEdirMatiere()));
              },
      icon: Icon(Icons.add),
      label: Text('Ajouter matiere'),
      style: ElevatedButton.styleFrom(
        primary: kontColor,// couleur de fond
        onPrimary: Colors.white, // couleur du texte
      ),
    ),
  ),
),
  ],
),
            
=======
                ElevatedButton(
                  onPressed:() {
                     Navigator.push(context,
                     MaterialPageRoute(builder: (context) => AddEdirMatiere()));
        },
      
        child: Icon(Icons.add),),
>>>>>>> 69ff65da0a1c551c12a863a67a4454a0907d7aa1
                 StreamBuilder<QuerySnapshot>(
                  stream: _matiere.snapshots(),
                  builder: (context, AsyncSnapshot snapshots) {
                    if (snapshots.connectionState == ConnectionState.waiting) {
                      return Center(
<<<<<<< HEAD
                        child: CircularProgressIndicator(color: Colors.blue),
=======
                        child: CircularProgressIndicator(color: Colors.green),
>>>>>>> 69ff65da0a1c551c12a863a67a4454a0907d7aa1
                      );
                    }
                    if (snapshots.hasData) {
                      List<DataRow> rows = [];
                      for (int i = 0; i < snapshots.data.docs.length; i++) {
                        final DocumentSnapshot records = snapshots.data.docs[i];
                        rows.add(DataRow(cells: [
<<<<<<< HEAD
                              
                          DataCell(Text(records["libelle"])),
                             DataCell(Row(children: [
                            IconButton(
                              onPressed: () {
                             final matiere = MatiereModel(
                                id: records.id,
                               
=======
                          DataCell(Text(records["libelle"])),
                          DataCell(IconButton(
                            onPressed: () {
                              final matiere = MatiereModel(
                                id: records.id,
>>>>>>> 69ff65da0a1c551c12a863a67a4454a0907d7aa1
                                libelle: records["libelle"],
                              );
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => AddEdirMatiere(
                                            matiere: matiere,
                                            index: i,
                                          ))));
                            },
<<<<<<< HEAD
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
=======
                            icon: Icon(Icons.edit_note),
                            color: Colors.blue,
                          )),
                          DataCell(IconButton(
                            onPressed: () {
                               _showDeleteConfirmationDialog(records.id);
                            },
                            icon: Icon(Icons.delete_outline),
                            color: Colors.red,
                          )),
>>>>>>> 69ff65da0a1c551c12a863a67a4454a0907d7aa1
                        ]
                        ));
                      }
                      return DataTable(
                        // ignore: prefer_const_literals_to_create_immutables
                        columns: [
<<<<<<< HEAD
                         
=======
>>>>>>> 69ff65da0a1c551c12a863a67a4454a0907d7aa1
                           DataColumn(
                            label: Text('Libelle'),
                            numeric: false,
                          ),
                          DataColumn(
<<<<<<< HEAD
                            label: Text('Actions'),
                            numeric: false,
                          ),
                         
=======
                            label: Text('Modifier'),
                            numeric: false,
                          ),
                          DataColumn(
                            label: Text('Supprimer'),
                            numeric: false,
                          ),
>>>>>>> 69ff65da0a1c551c12a863a67a4454a0907d7aa1
                        ],
                        rows: rows,
                      );
                    } else {
                      return Center(
<<<<<<< HEAD
                        child: CircularProgressIndicator(color: Colors.blue),
=======
                        child: CircularProgressIndicator(color: Colors.red),
>>>>>>> 69ff65da0a1c551c12a863a67a4454a0907d7aa1
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
<<<<<<< HEAD
}
=======
}
>>>>>>> 69ff65da0a1c551c12a863a67a4454a0907d7aa1
