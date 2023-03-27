<<<<<<< HEAD
import 'package:adawati_admin_panel/models/matiere_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
=======
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/matiere_model.dart';
>>>>>>> 69ff65da0a1c551c12a863a67a4454a0907d7aa1

final CollectionReference _matiere = FirebaseFirestore.instance.collection("matieres");
class MatiereController {
  Future add_matiere(MatiereModel matiere) async {
    await _matiere.doc().set(matiere.add_data());
  }
  Future update_matiere(MatiereModel matiere) async
{
  await _matiere.doc(matiere.id).update(matiere.add_data()); 
}   Future delete_matiere(MatiereModel matiere) async{
    await _matiere.doc(matiere.id).delete();

   }
}