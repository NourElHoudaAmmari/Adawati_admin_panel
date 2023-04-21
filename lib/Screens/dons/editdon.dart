import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EditDon extends StatelessWidget {
 EditDon(this.data, {Key? key}) {
  _titleController = TextEditingController(text: data['title']);
 //_descriptionController = TextEditingController(text: _shoppingItem['name']);
 //_categorieController=TextEditingController(text: _shoppingItem['name']);
  //_adresseController = TextEditingController(text: _shoppingItem['name']);
   //_etatController = TextEditingController(text: _shoppingItem['name']);
 // _phoneController = TextEditingController(text: _shoppingItem['name']);
 

    _reference = FirebaseFirestore.instance.collection('dons').doc(data['id']);
  }
 Map data;
  late DocumentReference _reference;

  late TextEditingController   _titleController;
  //late TextEditingController _controllerQuantity;
  GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modifier un don'),
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
                    InputDecoration(hintText: 'Enter the name of the item'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the item name';
                  }

                  return null;
                },
              ),
             // TextFormField(
              //  controller: _controllerQuantity,
                //decoration:
                  //  InputDecoration(hintText: 'Enter the quantity of the item'),
                //validator: (String? value) {
                  //if (value == null || value.isEmpty) {
                    //return 'Please enter the item quantity';
                  //}

                  //return null;
               // },
             // ),
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
                  child: Text('Submit'))
            ],
          ),
        ),
      ),
    );
  }
}