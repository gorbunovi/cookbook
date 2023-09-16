import 'package:cookbook/feature/data/models/catalog_model.dart';
import '../../../../core/core.dart';

abstract class CatalogRemoteDataSource {

  Future<List<CatalogModel>> getCatalog(int id);
  Future <CatalogModel> getHomeCatalog();
}

class CatalogRemoteDataSourceImpl implements CatalogRemoteDataSource {
  RestService restService;

  CatalogRemoteDataSourceImpl({required this.restService});

  @override
  Future<List<CatalogModel>> getCatalog(int id) {
    // TODO: implement getAllCatalog
    throw UnimplementedError();
  }

  @override
  Future<CatalogModel> getHomeCatalog() async{
     try{
       var catalogs = await restService.getRequest(Api.GetAllV1);
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