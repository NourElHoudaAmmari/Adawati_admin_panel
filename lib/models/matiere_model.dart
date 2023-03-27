class MatiereModel {
<<<<<<< HEAD
  final id,code,libelle;

  MatiereModel({this.id,this.code,  this.libelle} );
=======
  final id,libelle;

  MatiereModel({this.id,  this.libelle} );
>>>>>>> 69ff65da0a1c551c12a863a67a4454a0907d7aa1
  
  Map<String, dynamic>add_data(){
  return { 
    "id":id,
<<<<<<< HEAD
    "code":code,
=======
>>>>>>> 69ff65da0a1c551c12a863a67a4454a0907d7aa1
  "libelle":libelle
  };
 
}
}