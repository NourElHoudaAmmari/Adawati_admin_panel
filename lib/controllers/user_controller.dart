
import 'package:adawati_admin_panel/models/user.dart';
import 'package:adawati_admin_panel/services/user_service.dart';
import 'package:get/get.dart';


class UserController extends GetxController {
  var users = <User>[].obs;
  var isLoading = true.obs;

  void fetchUser() async {
    try {
      isLoading(true);
      var users = await UserServices().getAll();
      if (users.isNotEmpty) {
        this.users.assignAll(users);
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    } finally {
      isLoading(false);
    }
  }
}