import 'package:adawati_admin_panel/models/categorie_model.dart';
import 'package:adawati_admin_panel/services/categorie_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';


final CollectionReference _categorie = FirebaseFirestore.instance.collection("categories");
class CategorieController {
  Future add_categorie(CategorieModel categorie) async {
    await  _categorie.doc().set(categorie.add_data());
  }
  Future update_categorie(CategorieModel categorie) async
{
  await _categorie.doc(categorie.id).update(categorie.add_data()); 
}   Future delete_categorie(CategorieModel categorie) async{
    await _categorie.doc(categorie.id).delete();

   }
}
