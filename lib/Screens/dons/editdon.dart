import 'dart:io';
import 'dart:typed_data';
import 'package:adawati_admin_panel/Screens/dons/don_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import '../../constants.dart';

class EditDon extends StatefulWidget {
  Map data;
  EditDon(this.data, {Key? key}) : super(key: key);


  @override
  _EditDonState createState() => _EditDonState();
}

class _EditDonState extends State<EditDon> {
  late Map data;
   String _imageURL = '';
  Uint8List? _imageBytes;
  late DocumentReference _reference;
  late TextEditingController _imageController;
  late TextEditingController _titleController;
  late TextEditingController _categorieController;
  late TextEditingController _etatController;
  late TextEditingController _descriptionController;
  GlobalKey<FormState> _key = GlobalKey();

  @override
  void get initState {
    
    super.initState;
    data = widget.data;
    _imageURL = data['image'];
    _imageController = TextEditingController(text: widget.data['image']);
    _titleController = TextEditingController(text: widget.data['title']);
    _categorieController = TextEditingController(text: widget.data['categorie']);
    _etatController = TextEditingController(text: widget.data['etat']);
    _descriptionController = TextEditingController(text: widget.data['description']);
    _reference = FirebaseFirestore.instance.collection('dons').doc(widget.data['id']);
  }

 

  @override
  void dispose() {
    _imageController.dispose();
    _titleController.dispose();
    _categorieController.dispose();
    _etatController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

void _updateImage() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.image,
  );
  if (result != null && result.files.isNotEmpty) {
    // Récupérer le fichier sélectionné
    File file = File(result.files.single.path!);
    String imageURL = await uploadImageToFirebaseStorage(file);
    setState(() {
      _imageURL = imageURL; 
    });
  }
}
Future<String> uploadImageToFirebaseStorage(File file) async {
 final reference = FirebaseStorage.instance.ref().child('don_images');
  final  uploadTask =reference.putFile(file);
     final snapshot = await uploadTask;
  //String imageURL = await snapshot.ref.getDownloadURL();
    return  snapshot.ref.getDownloadURL();
}

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
               InkWell(
  onTap: _updateImage,
  child: Container(
    height: 250,
    width: 250,
    decoration: BoxDecoration(
      border: Border.all(),
    ),
    child: _imageURL.isEmpty
        ? Center(
            child: Text('Tap to add image'),
          )
        : Image.network(
            _imageURL,
            fit: BoxFit.cover,
          ),
  ),
),
SizedBox(height: 10,),

                ElevatedButton(
  onPressed: _updateImage,
  child: Text('Modifier l\'image'),
  style: ElevatedButton.styleFrom(primary: kontColor),
),

                    
              Container(
                 width: 700,
                child: TextFormField(
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
              ),
              SizedBox(height: 10,),
              Container(
                width: 700,
                child: TextFormField(
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
              ),
              SizedBox(height: 8),
              Container(
                width: 700,
                child: TextFormField(
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
              ),
              SizedBox(height: 8),
              Container(
                width: 700,
                child: TextFormField(
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
              ),
              SizedBox(height: 12),
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
                  child: Text('Modifier'),
                  style: ElevatedButton.styleFrom(primary: kontColor),
                  )
            ],
          ),
        ),
      ),
    );
  }
}