import 'package:cloud_firestore/cloud_firestore.dart';

class EtatModel {
  final id,libelle;

  EtatModel({this.id,  this.libelle} );
  
  Map<String, dynamic>add_data(){
  return { 
   "id": FirebaseFirestore.instance.collection('etats').doc().id,
  "libelle":libelle
  };
 
}
}