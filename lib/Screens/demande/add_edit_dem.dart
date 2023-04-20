import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';

import '../../constants.dart';
import '../../controllers/demande.dart';
import '../../models/demande.dart';
import '../../services/sidebar.dart';
import '../matiere/form_edit.dart';

class AddEditDemande extends StatefulWidget {
     static const String id = 'demEdit-screen';
 final DemandeModel? demande;
 final index;
AddEditDemande({this.demande, this.index});


  @override
  State<AddEditDemande> createState() => _AddEditDemandeState();
}

class _AddEditDemandeState extends State<AddEditDemande> {
  final _form_Key = GlobalKey<FormState>();
  bool isedit = false;
  final TextEditingController description = TextEditingController();
  final TextEditingController id = TextEditingController();


  @override
  void  get initState{
    if(widget.index != null){
      isedit = true;
     id.text = widget.demande?.id;
     description.text = widget.demande?.description;
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
       sideBar: _sideBar.sideBarMenus(context,AddEditDemande.id),
        body: SafeArea(
            child: SingleChildScrollView(
               padding: EdgeInsets.all(44),
          child: Column(
            children: [
              const SizedBox(height: 40),
               Center(
                child: isedit == true
                 ? const Text("Modifier Demande",style: TextStyle(fontSize: 30),)
                   :const Text("Ajouter Demande",style: TextStyle(fontSize: 30),)
                
              
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Form(
                    key: _form_Key,

                    child: Column(
                      children: [
                        SizedBox(
                      width: 350,
                         child: FormEdit(labledText: "Description",
                          mycontroller: description,
 
                         )
                         ),

                       
                      ],
                    )),
              ),
              const SizedBox(height: 10),
                    Center(
                   child: Row(
      
      mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Padding(padding: EdgeInsets.all(30)),
    ElevatedButton(
      onPressed: () {
        if (_form_Key.currentState!.validate()) {
                      _form_Key.currentState!.save();
                      if(isedit == true){
                        DemandeController().update_demande(DemandeModel(
                          id : id.text,
                          description: description.text));
                      }
                         else{
                         DemandeController().add_demande(DemandeModel(
                           description: description.text)
                         );
                      }
                      Navigator.pop(context);
                    }
      },
      child: isedit == true ?  Text("Modifier") : Text("Sauvgarder"),
       style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(kontColor),
  ),
    ),
    SizedBox(width: 10), // Add space between buttons
    ElevatedButton(
      onPressed: () {
        Navigator.pop(context);
      },
       style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
  ),
      child: Text('Annuler', style: TextStyle(color: Colors.white)),
    ),
  ],
),
  ),
            
           
           
           
           
           
           
           
           
           
           
           
            ],
          ),
        )));
  }
}
