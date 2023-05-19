import 'package:flutter/material.dart';
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
  void   initState(){
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
               padding: EdgeInsets.all(44),
          child: Column(
            children: [
              const SizedBox(height: 40),
               Center(
                child: isedit == true
                 ? const Text("Modifier Etat",style: TextStyle(fontSize: 30),)
                   :const Text("Ajouter Etat",style: TextStyle(fontSize: 30),)
                
              
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
                        EtatController().update_etat(EtatModel(
                          id : id.text,
                          libelle: libelle.text));
                      }
                         else{
                         EtatController().add_etat(EtatModel(
                          id: id,
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
        )));
  }
}