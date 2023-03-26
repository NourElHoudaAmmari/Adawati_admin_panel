import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseServices{
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference categories = FirebaseFirestore.instance.collection('categories');
  
  Future<QuerySnapshot> getAdminCredentials(){
var result = FirebaseFirestore.instance.collection('Admin').get();
return result;
  }
}