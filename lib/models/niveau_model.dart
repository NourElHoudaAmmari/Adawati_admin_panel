class   NiveauModel {
  final id,libelle;

  NiveauModel({this.id,  this.libelle} );
  
  Map<String, dynamic>add_data(){
  return { 
    "id":id,
  "libelle":libelle
  };
 
}
}