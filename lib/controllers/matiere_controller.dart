import 'package:adawati_admin_panel/models/matiere_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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