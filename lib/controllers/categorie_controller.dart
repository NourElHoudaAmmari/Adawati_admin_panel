import 'package:adawati_admin_panel/models/categorie.dart';
import 'package:adawati_admin_panel/services/categorie_service.dart';
import 'package:get/get.dart';


class CategorieController extends GetxController {
  var categories = <Categorie >[].obs;
  var isLoading = true.obs;

  void fetchCategorie() async {
    try {
      isLoading(true);
      var categories = await CategoriesServices().getAll();
      if (categories.isNotEmpty) {
        this.categories.assignAll(categories);
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    } finally {
      isLoading(false);
    }
  }
 void addCategory(int id, String name) async {
  try {
    int? categoryId = int.tryParse(id.toString());
    if (categoryId != null) {
      await CategoriesServices().addCategory(categoryId, name);
      fetchCategorie();
    } else {
      print('Invalid category id: $id');
    }
  } catch (e) {
    print(e);
  }
}
}
