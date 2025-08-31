import 'package:cookbook/feature/data/models/catalog_model.dart';
import '../../../../../core/core.dart';

abstract class SearchRemoteDataSource {

  Future<CatalogModel> getSearchCatalog(String search);
}

class SearchCatalogRemoteDataSourceImpl implements SearchRemoteDataSource {
  RestService restService;

  SearchCatalogRemoteDataSourceImpl({required this.restService});

  @override
  Future<CatalogModel> getSearchCatalog(String search) async{
    try{
      var catalogs = await restService.getRequest('${Api.SearchV1}/$search');
      if(catalogs==null) return CatalogModel(id: 0, name: 'Error', photo: '', info: 'null');
      // print('result -- ${catalogs}');
      CatalogModel result = CatalogModel.fromJson(catalogs);
      return result;
    }catch(e){
      // print('getHomeCatalog(error)');
      print ('error -- $e');
      return CatalogModel(id: 0, name: 'Error', photo: '', info: '$e');
    }
  }

}