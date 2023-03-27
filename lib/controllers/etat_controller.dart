<<<<<<< HEAD
import 'package:adawati_admin_panel/models/etat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
=======
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/etat.dart';

>>>>>>> 69ff65da0a1c551c12a863a67a4454a0907d7aa1

final CollectionReference _etat = FirebaseFirestore.instance.collection("etats");
class EtatController {
  Future add_etat(EtatModel etat) async {
    await  _etat.doc().set(etat.add_data());
  }
  Future update_etat(EtatModel etat) async
{
  await _etat.doc(etat.id).update(etat.add_data()); 
}   Future delete_etat(EtatModel etat) async{
    await _etat.doc(etat.id).delete();

   }
}