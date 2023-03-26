import 'package:cloud_firestore/cloud_firestore.dart';

class Categorie {
  String? id;
  String? name;
 

  Categorie(
      {this.id,
      this.name,
      });

  Categorie.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
  
    return data;
  }
   factory Categorie.fromSnapshot(DocumentSnapshot snapshot) {
    return Categorie(
      name: snapshot['name'],
      id: snapshot['id'],
    );
  }
}