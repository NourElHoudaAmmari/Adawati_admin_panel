import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseServices{
  User? user = FirebaseAuth.instance.currentUser;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference categories = FirebaseFirestore.instance.collection('categories');
    CollectionReference users = FirebaseFirestore.instance.collection('users');
  CollectionReference matieres = FirebaseFirestore.instance.collection('matieres');
  CollectionReference etats = FirebaseFirestore.instance.collection('etats');
  CollectionReference dons = FirebaseFirestore.instance.collection('dons');
    CollectionReference demande = FirebaseFirestore.instance.collection('demande');
      CollectionReference niveau = FirebaseFirestore.instance.collection('niveau');
  
  Future<QuerySnapshot> getAdminCredentials(){
var result = FirebaseFirestore.instance.collection('Admin').get();
return result;
  }
}