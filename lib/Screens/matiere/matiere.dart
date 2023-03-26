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
                ElevatedButton(
                  onPressed:() {
                     Navigator.push(context,
                     MaterialPageRoute(builder: (context) => AddEdirMatiere()));
        },
      
        child: Icon(Icons.add),),
                 StreamBuilder<QuerySnapshot>(
                  stream: _matiere.snapshots(),
                  builder: (context, AsyncSnapshot snapshots) {
                    if (snapshots.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(color: Colors.green),
                      );
                    }
                    if (snapshots.hasData) {
                      List<DataRow> rows = [];
                      for (int i = 0; i < snapshots.data.docs.length; i++) {
                        final DocumentSnapshot records = snapshots.data.docs[i];
                        rows.add(DataRow(cells: [
                          DataCell(Text(records["libelle"])),
                          DataCell(IconButton(
                            onPressed: () {
                              final matiere = MatiereModel(
                                id: records.id,
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
                        ]
                        ));
                      }
                      return DataTable(
                        // ignore: prefer_const_literals_to_create_immutables
                        columns: [
                           DataColumn(
                            label: Text('Libelle'),
                            numeric: false,
                          ),
                          DataColumn(
                            label: Text('Modifier'),
                            numeric: false,
                          ),
                          DataColumn(
                            label: Text('Supprimer'),
                            numeric: false,
                          ),
                        ],
                        rows: rows,
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(color: Colors.red),
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
