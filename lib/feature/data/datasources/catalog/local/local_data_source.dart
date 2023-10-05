import 'dart:convert';
import 'package:cookbook/feature/data/models/catalog_model.dart';
import 'package:cookbook/feature/data/models/recipe_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/core.dart';



abstract class CatalogLocalDataSource{
  Future<Map<String, dynamic>> getCatalogLocal();
  Future<bool> createCatalogLocal(Map<String, dynamic> catalogJson);
  Future<bool> createCatalogLocalSQLITE(List<CatalogModel> catalogList);
  Future<bool> createRecipeLocal(List<RecipeModel> recipeList);
}


class CatalogLocalDataSourceImpl implements CatalogLocalDataSource{
  CatalogLocalDataSourceImpl({
    required this.sharedPreferences,
    required this.databaseService,
  });//

  final DatabaseService databaseService;
  final SharedPreferences sharedPreferences;

  @override
  Future<Map<String, dynamic>> getCatalogLocal() async{
    try{
      final catalogJson = sharedPreferences.getString('catalog');
      if(catalogJson!=null || catalogJson!.isNotEmpty){
        var cat = jsonDecode(catalogJson);
        return cat;
      }else {
        return {'Error': '<Локальных данных нет>'};
      }
    }catch(e){
      return {'Error': '$e'};
    }
  }

  @override
  Future<bool> createCatalogLocal(catalogJson) async{

    try {
      var cat = jsonEncode(catalogJson);
      sharedPreferences.setString('catalog', cat);
      return true;
    }catch(e){
      return false;
    }

  }

  @override
  Future<bool> createCatalogLocalSQLITE(List<CatalogModel> catalogList) async{
    try {
      var catalogMap = catalogList.map((catalog) =>catalog.toMap()).toList();
      catalogMap.forEach((element) {
        databaseService.insertQuery(tableName: kCatalogTable, value:element );
      });
      return true;
    }catch(e){
      return false;
    }
  }

  @override
  Future<bool> createRecipeLocal(List<RecipeModel> recipeList) async{
    try {
      var resipeMap = recipeList.map((resipe) => resipe.toMap()).toList();
      resipeMap.forEach((element) {
        databaseService.insertQuery(tableName: kRecipeTable, value:element );
      });
      getCatalogLocalSQLIFE();
      return true;
    }catch(e){
      return false;
    }
  }

  Future<List<RecipeModel>> getCatalogLocalSQLIFE() async{
    try {
      var catalogLocal = await databaseService.getQuery(tableName: kRecipeTable);
      List<RecipeModel> catalogList = catalogLocal.map((e) => RecipeModel.fromMap(e)).toList();
      print('getCatalogLocalSQLIFE === $catalogList');
      return catalogList;
    }catch(e){
      return [];
    }
  }

  @override
  Future<bool> updateCatalogLocal() {
    // TODO: implement updateCatalogLocal
    throw UnimplementedError();
  }
}