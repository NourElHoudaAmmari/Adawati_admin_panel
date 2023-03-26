import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';

import '../../constants.dart';
import '../../controllers/etat_controller.dart';
import '../../models/etat.dart';
import '../../services/sidebar.dart';
import '../matiere/form_edit.dart';

class AddEditEtat extends StatefulWidget {
   static const String id = 'etatEdit-screen';
  
final EtatModel? etat;
final index;
AddEditEtat({this.etat, this.index});

  @override
  State<AddEditEtat> createState() => _AddEditEtatState();
}

class _AddEditEtatState extends State<AddEditEtat> {
  final _form_Key = GlobalKey<FormState>();
  bool isedit = false;
  final TextEditingController libelle = TextEditingController();
  final TextEditingController id = TextEditingController();


  @override
  void  get initState{
    if(widget.index != null){
      isedit = true;
     id.text = widget.etat?.id;
     libelle.text = widget.etat?.libelle;
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
       sideBar: _sideBar.sideBarMenus(context,AddEditEtat.id),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
               Center(
                child: isedit == true
                 ? const Text("Edit etat",style: TextStyle(fontSize: 30),)
                   :const Text("Add etat",style: TextStyle(fontSize: 30),)
                
              
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
                        EtatController().update_etat(EtatModel(
                          id : id.text,
                          libelle: libelle.text));
                      }
                         else{
                         EtatController().add_etat(EtatModel(
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
