import 'package:adawati_admin_panel/models/niveau_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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