import 'package:cookbook/feature/domain/entities/catalog_entity.dart';
import 'package:cookbook/feature/domain/entities/recipe_entity.dart';
import 'package:cookbook/feature/domain/usecases/search.dart';
import 'package:cookbook/feature/routes/app_routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../domain/entities/catalog_recipe.dart';
import 'index.dart';

class CatalogController extends Cubit<CatalogState> {
  CatalogController({ required this.getSearchCatalog}) : super(const Initial());
  CatalogEntity _catalog = CatalogEntity(id: 0, name: 'Кулинарная книга', photo: '', info: '');
  int _index = 0;
  List<CatalogRecipe?> _catalogList = [];
  GetSearchCatalog getSearchCatalog;

  Future<void> init() async{
    final currentState = state;
    emit(const Loading());
    if(currentState is Loading) return;
    _catalog = Get.arguments;
    _catalogList.add(_catalog);
    print('${_catalog.name}4 -- ${_catalog.toString()}');
    emit(Catalog(catalog: _catalog, index: _index));

  }

  void tapBottomNavigationBar(int index){
    _index = index;
    emit(const Loading());
    emit(Catalog(catalog: _catalog, index: index));
  }



  void toHome(){
    Get.toNamed(Routes.HOME,);
  }

  void search(String search) async{
    final currentState = state;
    emit(const Loading());
    if(currentState is Loading) return;


    final failureOrCatalogSearch = await getSearchCatalog(search);

    failureOrCatalogSearch.fold(
          (failure) => emit(Error(failure)),
          (resault){
        if(resault.catalogs?.length != 1){
          _catalog = resault;
        } else {
          _catalog = resault.catalogs![0];
        }
        emit(Search(catalog: _catalog, index: _index, searchData: search));
      },
    );
  }

  void toBack(){
    print('tapCatalog0 ${_catalogList.map((e) => e?.name)} ${_catalogList.length}');
    if(_catalogList.length != 1 ){
      _catalogList.removeLast();
      CatalogEntity catalog = _catalogList.last as CatalogEntity;
      print('tapCatalog1 ${_catalogList.map((e) => e?.name)}');
      // _catalogList.removeLast();
      print('tapCatalog2 ${_catalogList.map((e) => e?.name)}');
      print('catalog -- ${catalog.name}');
      emit(Loading());
      emit(Catalog(catalog: catalog, index: _index));
    }else {
      _catalogList.clear();
      Get.back();
    }
  }

  void tapCatalog({required CatalogEntity catalog,}){
    print('catalog -- $catalog');
    _catalogList.add(catalog);
    print('tapCatalog ${_catalogList.map((e) => e?.name)}');
    if(catalog.recipes != null) print(catalog.recipes!.map((element) =>'pecipe -- ${element.toString()}'));
    // print(_catalogList.map((e) => e.toString()));
    emit(const Loading());
    emit(Catalog(catalog: catalog, index: _index));
  }

  void tapRecipe({required RecipeEntity recipe,}){
    Get.toNamed(Routes.RECIPE, arguments: recipe);
  }

}
