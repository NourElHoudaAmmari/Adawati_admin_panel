class MatiereModel {
  final id,libelle;

  MatiereModel({this.id,  this.libelle} );
  
  Map<String, dynamic>add_data(){
  return { 
    "id":id,
  "libelle":libelle
  };
 
}
}