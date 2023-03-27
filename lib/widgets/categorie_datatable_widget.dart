import 'package:adawati_admin_panel/controllers/categorie_controller.dart';
import 'package:adawati_admin_panel/services/firebase_services.dart';
import 'package:adawati_admin_panel/widgets/custom_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CategorieDataTable extends StatefulWidget {
  const CategorieDataTable({super.key});

  @override
  State<CategorieDataTable> createState() => _CategorieDataTableState();
}

class _CategorieDataTableState extends State<CategorieDataTable> {

   final CategorieController categorieController = Get.put(CategorieController());

  @override
 void get initState
  {
    super.initState;
    categorieController.fetchCategorie();
  }

  @override
  Widget build(BuildContext context) {
 var columns = const [
<<<<<<< HEAD

  DataColumn(label: Text('Libelle')),
=======
 // DataColumn(label: Text('id')),
  DataColumn(label: Text('Name')),
>>>>>>> 69ff65da0a1c551c12a863a67a4454a0907d7aa1
DataColumn(
  label: Text(
    'Actions',
    textAlign: TextAlign.right,
  ),
),
];

    final DataTableSource data = MyData();
    

     return Obx(() => Padding(
      padding: const EdgeInsets.all(16),
      child: categorieController.categories.isEmpty
          ? const Center(child: CircularProgressIndicator())
        
          : Container(
              decoration: BoxDecoration(
               // border: Border.all(color: Colors.grey.shade700),
              ),
              child: PaginatedDataTable(
                columns: columns,
                source: data,
                columnSpacing: 900.0,
                horizontalMargin: 80,
                rowsPerPage: 8,
              ),
            ),
    ));

  }
}
  
class MyData extends DataTableSource {
  final CategorieController categorieController = Get.put(CategorieController());

  List<Map<String, dynamic>> data = [];

  MyData() {
    for (var i = 0; i < categorieController.categories.length; i++) {
      data.add({
<<<<<<< HEAD
     
=======
       // 'id': categorieController.categories[i].id.toString(),
>>>>>>> 69ff65da0a1c551c12a863a67a4454a0907d7aa1
        'name': categorieController.categories[i].name,
        'actions': {
          'edit': () {
            print('Edit');
          },
          'delete': () {
            print('Delete');
          },
        },
      });
    }
  }

  @override
DataRow getRow(int index) {
  return DataRow(cells: [
<<<<<<< HEAD
  
=======
    //DataCell(Text(data[index]['id'].toString())),
>>>>>>> 69ff65da0a1c551c12a863a67a4454a0907d7aa1
    DataCell(Text(data[index]['name'].toString())),
    DataCell(Row(
      children: [
      Row(
  children: [
    IconButton(
      icon: Icon(Icons.edit),
      color: Colors.indigo,
      onPressed: data[index]['actions']['edit'],
    ),
    //Text('Modifier',style: TextStyle(color: Colors.indigo),),
  ],
),
Row(
  children: [
    IconButton(
      icon: Icon(Icons.delete),
      color: Colors.redAccent,
      onPressed: data[index]['actions']['delete'],
    ),
    //Text('Supprimer',style: TextStyle(color: Colors.redAccent),),
  ],
),
      ],
    )),
  ]);
}

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;
}
