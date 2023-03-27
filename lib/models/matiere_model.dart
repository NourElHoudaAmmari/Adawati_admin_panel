class MatiereModel {
  final id,code,libelle;

  MatiereModel({this.id,this.code,  this.libelle} );
  
  Map<String, dynamic>add_data(){
  return { 
    "id":id,
    "code":code,
  "libelle":libelle
  };
 
}
}