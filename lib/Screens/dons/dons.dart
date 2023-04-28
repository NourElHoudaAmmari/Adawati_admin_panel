import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import '../../constants.dart';
import '../../services/sidebar.dart';
import 'don_details.dart';



class Don extends StatefulWidget {
  const Don({Key? key}) : super(key: key);
  static const String id = 'don-screen';

  @override
  _DonState createState() => _DonState();
}

class _DonState extends State<Don> {
    final _pageController = PageController();
  void _deleteDonation(String id) async {
  try {
    await _reference.doc(id).delete();
    // Show a success message
    ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
          content: Text('Don supprimé avec succès'),
          duration: Duration(seconds: 2),
        ),
    );
  } catch (e) {
    // Show an error message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Echec de supprimer ce don: $e'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}

  final db = FirebaseFirestore.instance;
  late String id;
  late Stream<QuerySnapshot> _stream;
  CollectionReference _reference =
      FirebaseFirestore.instance.collection('dons');
  @override
  void get  initState{
    super.initState;
    _stream = _reference.snapshots();
    _stream = _reference.orderBy('createdAt', descending: true).snapshots();
  }

  @override
  Widget build(BuildContext context) {
    SideBarWidget _sideBar = SideBarWidget();
    return AdminScaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: kontColor,
        iconTheme: IconThemeData(color: Colors.white),
        title: const Text(
          'Adawati Dashboard',
          style: TextStyle(color: Colors.white),
        ),
      ),
      sideBar: _sideBar.sideBarMenus(context, Don.id),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Text(
                       'Liste des dons',
                style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 36,
                      color: kontColor,
                ),
                      ),
                      
                    ],
                  ),
            
                ],
              ),
            ),
            StreamBuilder<QuerySnapshot>(
              stream: _stream,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                //Check error
                if (snapshot.hasError) {
                  return Center(
                      child: Text('Some error occurred ${snapshot.error}'));
                }

                //Check if data arrived
                if (snapshot.hasData) {
                  //get the data
                  QuerySnapshot querySnapshot = snapshot.data!;
                  List<QueryDocumentSnapshot> documents = querySnapshot.docs;

                  //Convert the documents to Maps
                  List<Map> items = documents
                      .map((e) => {
                            'id': e.id,
                            'title': e['title'],
                            'image': e['image'],
                            'createdAt': e['createdAt'],
                          })
                      .toList();

                  //Display the grid
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5, //Number of columns
                      childAspectRatio: 1, //Ratio of height to width of each grid item
                    ),
                    itemCount: items.length,
                    itemBuilder: (BuildContext context, int index) {
                      //Get the item at this index
                      Map thisItem = items[index];
                      //Return the widget for the grid item
                      return Card(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DonDetails(thisItem['id']),
                              ),
                            );
                          },
       
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                child: thisItem.containsKey('image')
? Image.network(
thisItem['image'],
fit: BoxFit.contain,
)
: Image.asset(
'assets/images/default_image.png',
fit: BoxFit.cover,
),
),
Padding(
padding: const EdgeInsets.all(8.0),
child: Text(
thisItem['title'],
style: TextStyle(
fontSize: 16,
fontWeight: FontWeight.bold,
),
maxLines: 2,
overflow: TextOverflow.ellipsis,
),
),
Padding(
padding: const EdgeInsets.all(8.0),
child: Text(
thisItem["createdAt"].toDate().toString(),
style: TextStyle(
fontSize: 14,
),
maxLines: 2,
overflow: TextOverflow.ellipsis,
),
),
IconButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Confirmation'),
                content:
                    Text('Êtes-vous sûr de vouloir supprimer ce don ?'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Annuler',style: TextStyle(
                  color: Colors.red,
                ),),
                  ),
                  TextButton(
                    onPressed: () {
                      _deleteDonation(thisItem['id']);
                      Navigator.pop(context);
                    },
                    child: Text('Supprimer'),
                  ),
                  
                ],
              );
            },
          );
        },
        padding: const EdgeInsets.only(left: 20.0),
         icon: Icon(Icons.delete),
         color: Colors.red,// icône de suppression
         // couleur de l'icône
        ),
      
    
],
),
),
);
},
);
}
return Center(
              child: Text('No data found'),
            );
          },
        ),
      ],
    ),
  ),
);
}


}

