import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import '../../constants.dart';
import '../../controllers/demande.dart';
import '../../models/demande.dart';
import '../../services/sidebar.dart';
import 'add_edit_dem.dart';

class Demande extends StatefulWidget {
  const Demande({super.key});
    static const String id = 'demande-screen';

  @override
  State<Demande> createState() => _DemandeState();
}

class _DemandeState extends State<Demande> {
   final CollectionReference _demande =
      FirebaseFirestore.instance.collection("demande");
      void _showDeleteConfirmationDialog(String id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmation'),
          content: Text('Voulez-vous vraiment supprimer cette demande?'),
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
                DemandeController().delete_demande(DemandeModel(id: id));
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
       sideBar: _sideBar.sideBarMenus(context,Demande.id),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(10),
          child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             
               const Text(
                'Liste des demandes',
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
                
                 StreamBuilder<QuerySnapshot>(
                  stream: _demande.snapshots(),
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
                          DataCell(Text(records["description"])),
                           DataCell(Text(records["userName"])),
                             DataCell(Row(children: [
                            IconButton(
                              onPressed: () {
                             final demande = DemandeModel(
                                id: records.id,
                                description: records["description"],
                              );
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => AddEditDemande(
                                            demande: demande,
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
                        columnSpacing: 100.0,
                        // ignore: prefer_const_literals_to_create_immutables
                        columns: [
                           DataColumn(
                            label: Text('Description'),
                            numeric: false,
                          ),
                            DataColumn(
                            label: Text('Utilisateur'),
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
