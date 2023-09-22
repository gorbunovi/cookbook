import 'dart:convert';
import 'package:cookbook/feature/presentation/catalog/controller/index.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:cookbook/feature/data/models/catalog_model.dart';

import '../../../../../core/core.dart';



abstract class CatalogLocalDataSorce{
  Future<CatalogModel> getCatalogLocal();
  Future<bool> createCatalogLocal(List<CatalogModel> catalog);
  Future<bool> updateCatalogLocal();
}


class CatalogLocalDataSorceImpl implements CatalogLocalDataSorce{
  CatalogLocalDataSorceImpl();

  @override
  Future<CatalogModel> getCatalogLocal() async{
    try{
      final catalog = json.decode(await rootBundle.loadString('assets/catalog.json'));
      // print ('catalog -- ${catalog}');
      var result = CatalogModel.fromJson(catalog);
      // print ('result -- ${result}');
      return result;
    }catch(e){
      print ('error -- $e');
      return CatalogModel(id: 0, name: 'Error', photo: '', info: '');
    }
  }

  @override
  Future<bool> createCatalogLocal(catalogs) async{
    try {
      catalogs.map((catalog) async =>
      await DatabaseService().insertQuery(
          tableName: kCatalogTable, value: catalog.toMap()));
      return true;
    }catch(e){
      return false;
    }
  }

  @override
  Future<bool> updateCatalogLocal() {
    // TODO: implement updateCatalogLocal
    throw UnimplementedError();
  }
}