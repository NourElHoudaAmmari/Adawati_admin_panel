import 'package:adawati_admin_panel/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:adawati_admin_panel/models/user.dart';

class UserServices {
  String collection = "users";

  Future<List<User>> getAll() async =>
      firebaseFiretore.collection(collection).get().then((result) {
        List<User> users = [];
        for (DocumentSnapshot user in result.docs) {
         users.add(User.fromSnapshot(user));
        }
        return users;
      });
}