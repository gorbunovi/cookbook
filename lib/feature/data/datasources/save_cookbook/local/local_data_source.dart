import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:cookbook/feature/data/models/catalog_model.dart';

import '../../../../../core/core.dart';



abstract class SaveCookBookLocalDataSorce{
  Future<CatalogModel> getSearchCatalogLocal(String search);
}


class SaveCookBookLocalDataSorceImpl implements SaveCookBookLocalDataSorce{
  SaveCookBookLocalDataSorceImpl();

  @override
  Future<CatalogModel> getSearchCatalogLocal(String search) async{
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
}