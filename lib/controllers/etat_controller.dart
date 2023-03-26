import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/etat.dart';


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