import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';

import '../../constants.dart';

class EditDon extends StatelessWidget {
 EditDon(this.data, {Key? key}) {
  _titleController = TextEditingController(text: data['title']);
_descriptionController = TextEditingController(text: data['description']);
 _categorieController=TextEditingController(text: data['categorie']);
 _etatController = TextEditingController(text: data['etat']);
  //_adresseController = TextEditingController(text: _shoppingItem['name']);
 // _phoneController = TextEditingController(text: _shoppingItem['name']);

    _reference = FirebaseFirestore.instance.collection('dons').doc(data['id']);
  }
 Map data;
  late DocumentReference _reference;

  late TextEditingController   _titleController;
  late TextEditingController _descriptionController ;
  late TextEditingController  _categorieController;
  late TextEditingController _etatController ;
  GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: kontColor,
        iconTheme: IconThemeData(color: Colors.white),
        title: const Text(
          'Adawati Dashboard',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _key,
          child: Column(
            children: [
              TextFormField(
                controller:   _titleController,
                decoration:
                    InputDecoration(hintText: 'Enter the title'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the name';
                  }

                  return null;
                },
              ),
              TextFormField(
               controller: _descriptionController,
                decoration:
                   InputDecoration(hintText: 'Enter the description '),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the descriptionController';
                  }

                  return null;
                },
             ),
              TextFormField(
                controller:   _categorieController,
                decoration:
                    InputDecoration(hintText: 'Enter the name cat'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the item name';
                  }

                  return null;
                },
              ),
              TextFormField(
               controller: _etatController,
                decoration:
                   InputDecoration(hintText: 'Enter the description '),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the descriptionController';
                  }

                  return null;
                },
             ),
              ElevatedButton(
                  onPressed: () async {
                    if (_key.currentState!.validate()) {
                      String title =   _titleController.text;
                      //String quantity = _controllerQuantity.text;

                      //Create the Map of data
                      Map<String,String> dataToUpdate={
                        'title':title,
                        //'quantity':quantity
                      };

                      //Call update()
                      _reference.update(dataToUpdate);
                    }
                  },
                  child: Text('Modifier'))
            ],
          ),
        ),
      ),
    );
  }
}