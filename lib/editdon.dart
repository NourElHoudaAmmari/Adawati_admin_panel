import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:adawati_admin_panel/Screens/dons/don_details.dart';
import 'package:adawati_admin_panel/Screens/dons/dons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';

import 'constants.dart';

class EditDon extends StatefulWidget {
 EditDon(this.data, {Key? key}) {
  Uint8List? _imageData;
 _imageController = TextEditingController(text: data['image']); 

  _titleController = TextEditingController(text: data['title']);
  _categorieController=TextEditingController(text: data['categorie']);
 _etatController = TextEditingController(text: data['etat']);
_descriptionController = TextEditingController(text: data['description']);

  //_adresseController = TextEditingController(text: _shoppingItem['name']);
 // _phoneController = TextEditingController(text: _shoppingItem['name']);

    _reference = FirebaseFirestore.instance.collection('dons').doc(data['id']);
    
  }
   Map data;
  late DocumentReference _reference;
  late TextEditingController _imageController; 
  late TextEditingController   _titleController;
  late TextEditingController  _categorieController;
  late TextEditingController _etatController ;
  late TextEditingController _descriptionController ;
  GlobalKey<FormState> _key = GlobalKey();

  @override
  State<EditDon> createState() => _EditDonState();
}
 
  
 Uint8List? _imageData;

class _EditDonState extends State<EditDon> {
  late Map data;
  late DocumentReference _reference;
  late TextEditingController _imageController; 
  late TextEditingController   _titleController;
  late TextEditingController  _categorieController;
  late TextEditingController _etatController ;
  late TextEditingController _descriptionController ;
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
             
              Image.network(_imageController.text,width: 200,height: 200,),
              TextFormField(
                controller:   _titleController,
                decoration:
                    InputDecoration(hintText: 'Titre'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return '***champ obligatoire';
                  }

                  return null;
                },
              ),
              TextFormField(
                controller:   _categorieController,
                decoration:
                    InputDecoration(hintText: 'Categorie'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return '***champ obligatoire';
                  }

                  return null;
                },
              ),
              TextFormField(
               controller: _etatController,
                decoration:
                   InputDecoration(hintText: 'Etat '),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return '***champ obligatoire';
                  }

                  return null;
                },
             ),
              TextFormField(
               controller: _descriptionController,
                decoration:
                   InputDecoration(hintText: 'Description '),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return '***champ obligatoire';
                  }

                  return null;
                },
             ),
              
              ElevatedButton(
                  onPressed: () async {
                    if (_key.currentState!.validate()) {
                      String title =   _titleController.text;
                      String categorie = _categorieController.text;
                       String etat = _etatController.text;
                        String description = _descriptionController.text;
                         String image = _imageController.text;

                      //Create the Map of data
                      Map<String,String> dataToUpdate={
                        'title':title,
                        'categorie':categorie,
                        'etat':etat,
                        'description':description,
                        'image': image,
                      };
                      //Call update()
                      _reference.update(dataToUpdate);
                Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DonDetails(data['id']), // Passer l'identifiant de l'élément à afficher
                      ),
                    );

                    }
                  },
                  child: Text('Modifier'))
            ],
          ),
        ),
      ),
    );
  }
  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}