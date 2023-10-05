import 'package:cookbook/feature/data/models/catalog_model.dart';
import 'package:cookbook/feature/data/models/recipe_model.dart';
import '../../../../../core/core.dart';

abstract class CatalogRemoteDataSource {

  Future<List<CatalogModel>?> getCatalog();
  Future<List<RecipeModel>?> getRecipe();
  Future <Map<String, dynamic>> getHomeCatalog();
}

class CatalogRemoteDataSourceImpl implements CatalogRemoteDataSource {
  RestService restService;

  CatalogRemoteDataSourceImpl({required this.restService});


  @override
  Future<List<CatalogModel>?> getCatalog() async{
    try{
      var catalogs = await restService.getRequest(Api.GetCatalogV1);
      if(catalogs==null) return [];
      // print('result -- ${catalogs}');
      List<CatalogModel>? result = (catalogs as List<dynamic>?)
          ?.map((e) => CatalogModel.fromJson(e as Map<String, dynamic>))
          .toList();
      return result;
    }catch(e){
      // print('getHomeCatalog(error)');
      print ('error -- $e');
      return [];
    }
  }


  @override
  Future<List<RecipeModel>?> getRecipe() async{
    try{
      var recipes = await restService.getRequest(Api.GetRecipeV1);
      if(recipes==null) return [];
      List<RecipeModel>? result = (recipes as List<dynamic>?)
          ?.map((e) => RecipeModel.fromJson(e as Map<String, dynamic>))
          .toList();
      return result;
    }catch(e){
      print ('error -- $e');
      return [];
    }
  }

  @override
  Future<Map<String, dynamic>> getHomeCatalog() async{
     try{
       var catalogs = await restService.getRequest(Api.GetAllV1);
       if(catalogs==null) return {'Error': 'null'};
       // print('result -- ${catalogs}');
       // CatalogModel result = CatalogModel.fromJson(catalogs);
       return catalogs;
    }catch(e){
       // print('getHomeCatalog(error)');
      print ('error -- $e');
      return {'Error': '$e'};
    }
  }
}