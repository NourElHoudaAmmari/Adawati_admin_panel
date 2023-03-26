class EtatModel {
  final id,libelle;

  EtatModel({this.id,  this.libelle} );
  
  Map<String, dynamic>add_data(){
  return { 
    "id":id,
  "libelle":libelle
  };
 
}
}