import 'dart:convert';
import 'package:cookbook/feature/data/datasources/local/first_data.dart';
import 'package:cookbook/feature/data/datasources/local/hive/catalog_hive.dart';
import 'package:cookbook/feature/data/datasources/local/hive/ingridient_hive.dart';
import 'package:cookbook/feature/data/datasources/local/hive/resipe_hive.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:cookbook/feature/data/models/catalog_model.dart';

abstract class CatalogLocalDataSorce{
  Future<CatalogModel> getCatalogLocal();
}


class CatalogLocalDataSorceImpl implements CatalogLocalDataSorce{
  CatalogLocalDataSorceImpl();

  @override
  Future<CatalogModel> getCatalogLocal() async{
    // registerAdapter();
    // var catalog = FirstData().getCatalog();
    // var catalog;
    // Box<CatalogHive> catalogBox = await Hive.openBox<CatalogHive>('catalog');
    // if(catalogBox.isEmpty) {
    //   await catalogBox.put('catalog', FirstData().getCatalog().toHive());
    //   var hiveCatalog = catalogBox.values.first;
    //   if (hiveCatalog != null) catalog = CatalogModel.fromHive(hiveCatalog);
    // }else{
    //   var hiveCatalog = catalogBox.get('catalog');
    //   if (hiveCatalog != null) catalog = await CatalogModel.fromHive(hiveCatalog);
    //
    // }
    // catalogBox.close();
    // return catalog;
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

  // void registerAdapter(){
  //   if(!Hive.isAdapterRegistered(0)) {
  //     Hive.registerAdapter(CatalogHiveAdapter());
  //   }
  //   if(!Hive.isAdapterRegistered(1)){
  //     Hive.registerAdapter(RecipeHiveAdapter());
  //   }
  //   if(!Hive.isAdapterRegistered(2)) {
  //     Hive.registerAdapter(IngridientHiveAdapter());
  //   }
  // }
}