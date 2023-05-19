
import 'package:adawati_admin_panel/models/user.dart';
import 'package:adawati_admin_panel/services/user_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';


class UserController extends GetxController {
  var users = <User>[].obs;
  var isLoading = true.obs;

void fetchUser() async {
  try {
    isLoading(true);
    var userList = await UserServices().getAll();
    if (userList.isNotEmpty) {
      users.assignAll(userList);
    }
  } catch (e) {
    print(e);
  } finally {
    isLoading(false);
  }
}
   Future<void> blockUser(String userId) async {
    // Perform necessary operations to block the user
    // For example, update the user's blocked status in the database
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .update({'isBlocked': true});
         // Notify listeners about the changes in the user object
  
  }
   Future<void> unblockUser(String userId) async {
    // Perform necessary operations to block the user
    // For example, update the user's blocked status in the database
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .update({'isBlocked': false});
  }
}