import 'package:cookbook/core/usecase/usecase.dart';
import 'package:cookbook/feature/domain/entities/catalog_entity.dart';
import 'package:cookbook/feature/domain/usecases/get_home_catalog.dart';
import 'package:cookbook/feature/routes/app_routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'index.dart';

class HomeController extends Cubit<HomeState> {
  HomeController({ required this.getHomeCatalog}) : super(const Initial());
  final GetHomeCatalog getHomeCatalog;
  // final GetCatalogs getCatalogs;
  CatalogEntity _catalog = CatalogEntity(id: 0, name: 'Кулинарная книга', photo: '', info: '');
  int _index = 0;
  List<CatalogEntity?> _catalogList = [];


  Future<void> init() async{
    final currentState = state;
    emit(const Loading());
    if(currentState is Loading) return;


    final failureOrCatalog = await getHomeCatalog();

    failureOrCatalog.fold(
          (failure) => emit(Error(failure)),
          (resault){
            if(resault.catalogs?.length != 1){
              _catalog = resault;
            } else {
              _catalog = resault.catalogs![0];
            }
        emit(Catalog(catalog: _catalog, index: _index));
      },
    );

  }

  Future<void> reset() async {
    final failureOrCatalog = await getHomeCatalog();
    failureOrCatalog.fold(
          (failure) => emit(Error(failure)),
          (resault){
            if(resault.catalogs?.length != 1){
              _catalog = resault;
            } else {
              _catalog = resault.catalogs![0];
            }
        emit(Catalog(catalog: _catalog, index: _index));
      },
    );

  }

  void tapBottomNavigationBar(int index){
    _index = index;
    emit(const Loading());
    emit(Catalog(catalog: _catalog, index: index));
  }

  void toHome(){
    _catalogList.clear();
    emit(const Loading());
    emit(Catalog(catalog: _catalog, index: _index));
  }

  void toBack(){
    print('tapCatalog0 ${_catalogList.map((e) => e?.name)}');
    if(_catalogList.length != 1){
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
      emit(Loading());
      emit(Catalog(catalog: _catalog, index: _index));
    }
  }

  void tapCatalog({required CatalogEntity catalog,}){
    Get.toNamed(Routes.CATALOG, arguments: catalog);
  }

}
