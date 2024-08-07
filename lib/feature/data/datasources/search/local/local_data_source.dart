import 'dart:convert';
import 'package:cookbook/feature/data/models/recipe_model.dart';
import 'package:cookbook/feature/presentation/catalog/controller/index.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:cookbook/feature/data/models/catalog_model.dart';

import '../../../../../core/core.dart';



abstract class SearchCatalogLocalDataSorce{
  Future<CatalogModel> getSearchCatalogLocal(String search);
}


class SearchCatalogLocalDataSorceImpl implements SearchCatalogLocalDataSorce{
  SearchCatalogLocalDataSorceImpl({required this.databaseService});
  DatabaseService databaseService;

  @override
  Future<CatalogModel> getSearchCatalogLocal(String search) async{
    String sql = "SELECT * FROM recipe WHERE upper (name) LIKE upper ('%$search%')";
    late CatalogModel result;
    try{
      var recipesList = await databaseService.rawQuery(sql: sql );
      List<RecipeModel>? recipes = recipesList
          ?.map((e) => RecipeModel.fromJson(e)).toList()
          ?? [];
      result = CatalogModel(
        id: null,
        name: 'Поиск',
        photo: null,
        info: 'Поиск рецептов',
        catalogs: null,
        recipes: recipes,
      );
      return result;
    }catch(e){
      print ('error -- $e');
      return CatalogModel(id: 0, name: 'Error', photo: '', info: '');
    }
  }
}