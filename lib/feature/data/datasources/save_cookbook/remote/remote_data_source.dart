import 'package:cookbook/feature/data/models/catalog_model.dart';
import 'package:cookbook/feature/data/models/ingridient_model.dart';
import 'package:cookbook/feature/data/models/recipe_cooking_model.dart';
import 'package:cookbook/feature/data/models/recipe_model.dart';
import 'package:cookbook/feature/data/models/recipe_photo_model.dart';
import '../../../../../core/core.dart';

abstract class SaveCookBookRemoteDataSource {

  Future<bool> saveCookBook();
}

class SaveCookBookRemoteDataSourceImpl implements SaveCookBookRemoteDataSource {

  RestService restService;
  DatabaseService databaseService;


  SaveCookBookRemoteDataSourceImpl({required this.restService, required this.databaseService});

  @override
  Future<bool> saveCookBook() async{
    print('saveCookBook()');
    try{

      // final List<CatalogModel>? catalogList = await catalogRemoteDataSource.getCatalog();
      // if(catalogList!=null) catalogLocalDataSorce.createCatalogLocalSQLITE(catalogList);
      //
      // final List<RecipeModel>? recipeList = await catalogRemoteDataSource.getRecipe();
      // if(recipeList!=null)  catalogLocalDataSorce.createRecipeLocal(recipeList);

      //Загрузка и сохранение каталогов
      var catalogs = await restService.getRequest(Api.GetCatalogV1);
      if(catalogs!=null) {
        List<CatalogModel>? catalogList = (catalogs as List<dynamic>?)
          ?.map((e) => CatalogModel.fromJson(e as Map<String, dynamic>))
          .toList();
        var catalogMap = catalogList?.map((catalog) =>catalog.toMap()).toList()??[];
        for (var element in catalogMap) {
          databaseService.insertQuery(tableName: kCatalogTable, value:element );
        }
      }

      //Загрузка и сохранение рецептов
      var recipes = await restService.getRequest(Api.GetRecipeV1);
      if(recipes!=null) {
        List<RecipeModel>? recipeList = (recipes as List<dynamic>?)
          ?.map((e) => RecipeModel.fromJson(e as Map<String, dynamic>))
          .toList();
        var resipeMap = recipeList?.map((resipe) => resipe.toMap()).toList()??[];
        for (var element in resipeMap) {
          databaseService.insertQuery(tableName: kRecipeTable, value:element );
        }
      }

      //
      // //Загрузка и сохранение ингридиентов
      var ingridients = await restService.getRequest(Api.GetIngridientV1);
      if(recipes!=null) {
        List<IngridientModel>? ingridientList = (ingridients as List<dynamic>?)
            ?.map((e) => IngridientModel.fromJson(e as Map<String, dynamic>))
            .toList();
        var ingridientMap = ingridientList?.map((ingridient) => ingridient.toMap()).toList()??[];
        for (var element in ingridientMap) {
          databaseService.insertQuery(tableName: kIngridientTable, value:element );
        }
      }
      // var ingridients = await restService.getRequest('${Api.GetIngridientV1}');
      // if(ingridients==null) return false;
      // var ingridientMap = ingridients.map((ingridient) async => await databaseService.insertQuery(tableName: kIngridientTable, value: ingridient));
      //
      //
      // //Загрузка и сохранение фотографий рецептов
      // var recipePhotos = await restService.getRequest('${Api.GetPhotoV1}');
      // if(recipePhotos==null) return false;
      // var recipePhotoMap = recipePhotos.map((recipePhoto) async => await databaseService.insertQuery(tableName: kRecipePhotoTable, value: recipePhoto));
      // print('Загрузка и сохранение рецептов recipePhotoMap========== $recipePhotoMap');
      // var recipePhotosLocalDB = await databaseService.getQuery(tableName: kRecipePhotoTable);
      // print('Загрузка и сохранение фотографий рецептов Local========== $recipePhotosLocalDB');
      //
      // //Загрузка и сохранение этопов приготовления рецептов
      // var recipeCookings = await restService.getRequest('${Api.GetCooking1}/');
      // if(recipeCookings==null) return false;
      // var recipeCookingMap = recipeCookings.map((recipeCooking) async => await databaseService.insertQuery(tableName: kRecipeCookingTable, value: recipeCooking));
      // print('Загрузка и сохранение рецептов recipeCookingMap========== $recipeCookingMap');
      // var recipeCookingLocalDB = await databaseService.getQuery(tableName: kRecipeCookingTable);
      // print('Загрузка и сохранение этопов приготовления рецептов Local========== $recipeCookingLocalDB');

      return true;
    }catch(e){
      print ('error -- $e');
      return false;
    }
  }

}