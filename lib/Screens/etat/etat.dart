import 'package:adawati_admin_panel/Screens/etat/add_edit_etat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';

import '../../constants.dart';
import '../../controllers/etat_controller.dart';
import '../../models/etat.dart';
import '../../services/sidebar.dart';

class Etat extends StatefulWidget {
  const Etat({Key? key}) : super(key: key);
  static const String id = 'etat-screen';
  @override
  State<Etat> createState() => _EtatState();
}

class _EtatState extends State<Etat> {
  final CollectionReference _etat =
      FirebaseFirestore.instance.collection("etats");
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
                EtatController().delete_etat(EtatModel(id: id));
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
       sideBar: _sideBar.sideBarMenus(context,Etat.id),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(10),
          child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             
               const Text(
                'Liste des états',
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
    width: 150,
    height: 28,
    child: ElevatedButton.icon(
              onPressed: () {
                  Navigator.push(context,
                     MaterialPageRoute(builder: (context) => AddEditEtat()));
              },
      icon: Icon(Icons.add),
      label: Text('Ajouter etat'),
      style: ElevatedButton.styleFrom(
        primary: kontColor,// couleur de fond
        onPrimary: Colors.white, // couleur du texte
      ),
    ),
  ),
),
  ],
),
                
                 StreamBuilder<QuerySnapshot>(
                  stream: _etat.snapshots(),
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
                             final etat = EtatModel(
                                id: records.id,
                                libelle: records["libelle"],
                              );
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => AddEditEtat(
                                            etat: etat,
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
