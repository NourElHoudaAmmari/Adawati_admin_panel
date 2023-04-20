import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import '../../constants.dart';
import '../../services/sidebar.dart';


class Don extends StatefulWidget {
  const Don({super.key});
    static const String id = 'don-screen';

  @override
  State<Don> createState() => _DonState();
}

class _DonState extends State<Don> {

  final db = FirebaseFirestore.instance;
  late String id;
  late Stream<QuerySnapshot> _stream;
  CollectionReference _reference = FirebaseFirestore.instance.collection('dons');

  @override
  void get initState{
    super.initState;
       _stream = _reference.snapshots();
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
       sideBar: _sideBar.sideBarMenus(context,Don.id), 
       body: SafeArea(
       child: SingleChildScrollView(
          child: Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(10),
          child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             
               const Text(
                'Liste des dons',
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
      label: Text('Ajouter'),
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
                  stream:  _stream,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasError) {
          return Center(
              child: Text('Some error occurred ${snapshot.error}'));
        }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(color: Colors.blue),
                      );
                    }
                    if (snapshot.hasData) {
                       QuerySnapshot querySnapshot = snapshot.data!;
          List<QueryDocumentSnapshot> documents = querySnapshot.docs;

                      List<DataRow> rows = [];
                       List<Map> items =
              documents.map((e) => e.data() as Map).toList();

                      for (int i = 0; i < snapshot.data.docs.length; i++) {
                        final DocumentSnapshot records = snapshot.data.docs[i];
                        rows.add(DataRow(cells: [
                          DataCell(Text(records["title"])),
                          DataCell(Image.network(records['image'],width: 200,height: 200,)),
                          DataCell( Text(records["createdAt"].toDate().toString()),),
                          DataCell(Text(records["description"])),
                          DataCell(Row(children: [
                            IconButton(
                              onPressed: () {
                             },
                            icon: Icon(Icons.edit),
                            color: Colors.blue,
                            ),
                            IconButton(
  onPressed: () {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmation',
                style: TextStyle(
                  color: Colors.red,
                ),),
          content: const Text('Êtes-vous sûr de vouloir supprimer ce don ?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fermer la boîte de dialogue
              },
              child: const Text('Annuler'),
            ),
            TextButton(
              onPressed: () async {
                await _reference.doc(records.id).delete(); // Supprimer le document dans Firestore
                Navigator.of(context).pop(); // Fermer la boîte de dialogue
              },
              child: const Text('Supprimer',
                style: TextStyle(
                  color: Colors.red,
                )),
            ),
          ],
        );
      },
    );
  },
  icon: const Icon(Icons.delete),
  color: Colors.red,
),
                          ],
                          ),
                          ),
                        ]
                        ));
                      }
                      return DataTable(
                        columnSpacing:50.0,
                        columns: [
                           DataColumn(
                            label: Text('Titre'),
                            numeric: false,
                          ),
                           DataColumn(
                            label: Text('Images'),
                            numeric: false,
                          ),
                             DataColumn(
                            label: Text('Date'),
                            numeric: false,
                          ),
                          DataColumn(
                            label: Text('Description'),
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
              
            
            ] 
        ),
          ),
       ),
       ),
    );
        
}
}
