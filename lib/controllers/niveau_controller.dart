<<<<<<< HEAD
import 'package:adawati_admin_panel/models/niveau_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
=======
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/niveau_model.dart';

>>>>>>> 69ff65da0a1c551c12a863a67a4454a0907d7aa1

final CollectionReference _niveau = FirebaseFirestore.instance.collection("niveau");
class NiveauController {
  Future add_niveau(NiveauModel niveau) async {
    await  _niveau.doc().set(niveau.add_data());
  }
  Future update_niveau(NiveauModel niveau) async
{
  await _niveau.doc(niveau.id).update(niveau.add_data()); 
}   Future delete_niveau(NiveauModel niveau) async{
    await _niveau.doc(niveau.id).delete();

   }
}