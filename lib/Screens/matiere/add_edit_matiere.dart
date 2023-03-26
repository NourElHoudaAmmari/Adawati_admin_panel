import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';

import '../../constants.dart';
import '../../controllers/matiere_controller.dart';
import '../../models/matiere_model.dart';
import '../../services/sidebar.dart';
import 'form_edit.dart';
import 'package:flutter/material.dart';




class AddEdirMatiere extends StatefulWidget {
    static const String id = 'matiereEdit-screen';
  
final MatiereModel? matiere;
final index;
AddEdirMatiere({this.matiere, this.index});


  @override
  State<AddEdirMatiere> createState() => _AddEdirMatiereState();
}

class _AddEdirMatiereState extends State<AddEdirMatiere> {
  final _form_Key = GlobalKey<FormState>();
  bool isedit = false;
  final TextEditingController libelle = TextEditingController();
  final TextEditingController id = TextEditingController();


  @override
  void  get initState{
    if(widget.index != null){
      isedit = true;
     id.text = widget.matiere?.id;
     libelle.text = widget.matiere?.libelle;
    }
    else{
      isedit = false;
    }
    super.initState;
  }
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
       sideBar: _sideBar.sideBarMenus(context,AddEdirMatiere.id),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
               Center(
                child: isedit == true
                 ? const Text("Edit matiere",style: TextStyle(fontSize: 30),)
                   :const Text("Add matiere",style: TextStyle(fontSize: 30),)
                
              
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Form(
                    key: _form_Key,
                    child: Column(
                      children: [
                        SizedBox(
                      width: 250,
                         child: FormEdit(labledText: "Libelle",
                          mycontroller: libelle,
 
                         )
                         ),

                       
                      ],
                    )),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () {
                    if (_form_Key.currentState!.validate()) {
                      _form_Key.currentState!.save();
                      if(isedit == true){
                        MatiereController().update_matiere(MatiereModel(
                          id : id.text,
                          libelle: libelle.text));
                      }
                         else{
                         MatiereController().add_matiere(MatiereModel(
                          libelle: libelle.text)

                         );
                      }
                      Navigator.pop(context);
                    }
                  
                  },
                  child: isedit == true ?  Text("Update") : Text("Save"))
            ],
          ),
        )));
  }
}
