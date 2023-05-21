/*import 'package:adawati_admin_panel/constants.dart';
import 'package:adawati_admin_panel/models/categorie_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoriesServices {
  String collection = "categories";

  Future<List<Categorie>> getAll() async =>
      firebaseFiretore.collection(collection).get().then((result) {
        List<Categorie> categories = [];
        for (DocumentSnapshot category in result.docs) {
          categories.add(Categorie.fromSnapshot(category));
        }
        return categories;
      });

      Future<void> addCategory(String id, String name) async {
  await firebaseFiretore.collection(collection).doc(id).set({
    "id": id,
    "name": name,
  });
}
}*/