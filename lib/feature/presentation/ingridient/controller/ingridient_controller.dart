import 'package:cookbook/core/usecase/usecase.dart';
import 'package:cookbook/feature/domain/entities/catalog_entity.dart';
import 'package:cookbook/feature/domain/usecases/get_catalog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'index.dart';

class IngridientController extends Cubit<IngridientState> {
  IngridientController({required this.getCatalogs}) : super(const Initial());
  final GetCatalogs getCatalogs;
  CatalogEntity catalog = CatalogEntity(id: 0, name: 'Кулинарная книга', photo: '',info: '');
  int _index = 0;

  Future<void> init() async{
    // catalogsList = getCatalogs.
    // emit(Catalog(catalogs: catalogsList, index: 0));
    final currentState = state;
    emit(const Loading());
    if(currentState is Loading) return;


    // final failureOrCatalog = await getCatalogs(NoParams());
    //
    // failureOrCatalog.fold(
    //       (failure) => emit(Error(failure)),
    //       (resault){
    //       catalog = resault;
    //     emit(Catalog(catalog: catalog, index: _index));
    //   },
    // );
    emit(Catalog(catalog: catalog, index: _index));
  }

  void tapBottomNavigationBar(int index){
    _index = index;
    emit(const Loading());
    emit(Catalog(catalog: catalog, index: index));
  }

  void toHome(){
    emit(const Loading());
    emit(Catalog(catalog: catalog, index: _index));
  }

  void tapCatalog(CatalogEntity catalog){
    print('${catalog.name}-- ${catalog.toString()}');
    emit(const Loading());
    emit(Catalog(catalog: catalog, index: _index));
  }

}
