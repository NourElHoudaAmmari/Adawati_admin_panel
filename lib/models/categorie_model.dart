import 'package:cloud_firestore/cloud_firestore.dart';

class CategorieModel {
  final id,libelle;

  CategorieModel({this.id,  this.libelle} );
  
  Map<String, dynamic>add_data(){
  return { 
   "id": FirebaseFirestore.instance.collection('categories').doc().id,
  "libelle":libelle
  };
 
}
}