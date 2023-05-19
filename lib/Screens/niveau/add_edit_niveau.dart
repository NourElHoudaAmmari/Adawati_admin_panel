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
  void  initState(){
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
              padding: EdgeInsets.all(44),
          child: Column(
            
            children: [
              const SizedBox(height: 40),
               Center(
                child: isedit == true
                 ? const Text("Modifier niveau",style: TextStyle(fontSize: 30,color: kontColor,fontWeight: FontWeight.bold),)
                   :const Text("Ajouter niveau",style: TextStyle(fontSize: 30,color: kontColor,fontWeight: FontWeight.bold),)
                
              
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
                         child: FormEdit(labledText: "Libelle",
                          mycontroller: libelle,
                         )
                         ),

                       
                      ],
                    )),
              ),
              const SizedBox(height: 10),
            Center(
  child: Expanded(
    
    child: Row(
      
      mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Padding(padding: EdgeInsets.all(30)),
    ElevatedButton(
      onPressed: () {
        if (_form_Key.currentState!.validate()) {
          _form_Key.currentState!.save();
          if(isedit == true){
            NiveauController().update_niveau(NiveauModel(
              id : id.text,
              libelle: libelle.text));
          } else {
            NiveauController().add_niveau(NiveauModel(
              libelle: libelle.text)
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
            ),
        ],
        ),
        ),
        ),
        );
  }
}
