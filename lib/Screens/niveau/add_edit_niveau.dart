import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import '../../constants.dart';
import '../../controllers/niveau_controller.dart';
import '../../models/niveau_model.dart';
import '../../services/sidebar.dart';
import '../matiere/form_edit.dart';
class AddEditNiveau extends StatefulWidget {
 static const String id = 'niveauEdit-screen';
  
final NiveauModel? niveau;
final index;
 AddEditNiveau({this.niveau, this.index});


  @override
  State<AddEditNiveau> createState() => _AddEditNiveauState();
}

class _AddEditNiveauState extends State<AddEditNiveau> {
  final _form_Key = GlobalKey<FormState>();
  bool isedit = false;
  final TextEditingController libelle = TextEditingController();
  final TextEditingController id = TextEditingController();


  @override
  void  get initState{
    if(widget.index != null){
      isedit = true;
     id.text = widget.niveau?.id;
     libelle.text = widget.niveau?.libelle;
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
       sideBar: _sideBar.sideBarMenus(context,AddEditNiveau.id),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
               Center(
                child: isedit == true
                 ? const Text("Edit niveau",style: TextStyle(fontSize: 30),)
                   :const Text("Add niveau",style: TextStyle(fontSize: 30),)
                
              
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
                        NiveauController().update_niveau(NiveauModel(
                          id : id.text,
                          libelle: libelle.text));
                      }
                         else{
                          NiveauController().add_niveau(NiveauModel(
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
