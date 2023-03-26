// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:adawati_admin_panel/controllers/categorie_controller.dart';
import 'package:adawati_admin_panel/services/sidebar.dart';
import 'package:adawati_admin_panel/widgets/categorie_datatable_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:get/get.dart';

import '../constants.dart';

class CategorieScreen extends StatefulWidget {
  const CategorieScreen({super.key});
static const String id = 'categorie-screen';
  @override
  State<CategorieScreen> createState() => _CategorieScreenState();
}

class _CategorieScreenState extends State<CategorieScreen> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
   SideBarWidget _sideBar = SideBarWidget();
    return AdminScaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: kontColor,
        iconTheme: IconThemeData(color: Colors.white),
        title: const Text('Adawati Dashboard',style: TextStyle(color:Colors.white),),
      ),
      sideBar: _sideBar.sideBarMenus(context,CategorieScreen.id),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Text(
                'Categories',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 36,
                  color: kontColor,
                ),
              ),
               
              Divider(thickness: 2,),
          Row(
  mainAxisAlignment: MainAxisAlignment.end,
  children: [
   Padding(
  padding: EdgeInsets.only(right: 20.0), // ajuster la valeur de left selon votre besoin
  child: SizedBox(
    width: 120,
    height: 28,
    child: ElevatedButton.icon(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Ajouter une catégorie",style: TextStyle(color: kPrimaryColor,fontSize: 18,fontStyle: FontStyle.italic),),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        
                        children: [
                           TextFormField(
           controller:_idController,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            cursorColor: kontColor,
            decoration: InputDecoration(
              hintText: "id",
            ),
          ),
                          TextFormField(
                            cursorColor: kontColor,
                            controller: _nameController,
                            decoration: InputDecoration(labelText: "Nom"),
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            // Action à effectuer lors du clic sur le bouton "Cancel"
                            Navigator.of(context).pop();
                          },
                          child: Text("Cancel"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Action à effectuer lors du clic sur le bouton "Submit"
                            int id = int.parse(_idController.text);
                          // int id = int.tryParse(_idController.text) ?? 0;
                            String name = _nameController.text;
                            // Ajouter la catégorie à la liste
                           CategorieController categorieController = Get.find();
    categorieController.addCategory(id, name);
    Navigator.of(context).pop();
                          },
                          child: Text("Submit"),
                        ),
                      ],
                    );
                  },
                );
              },
      icon: Icon(Icons.add),
      label: Text('Ajouter'),
      style: ElevatedButton.styleFrom(
        primary: kontColor,// couleur de fond
        onPrimary: Colors.white, // couleur du texte
      ),
    ),
  ),
),
  ],
),
            
        CategorieDataTable(),
            ],
          ),
          
        ),
      ),
    );
  }
  }
