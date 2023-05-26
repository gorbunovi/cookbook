import 'dart:convert';

import 'package:cookbook/core/error/exception.dart';
import 'package:cookbook/core/platform/network_services.dart';
import 'package:http/http.dart' as http;
import 'package:cookbook/feature/data/models/catalog_model.dart';
import 'package:flutter/services.dart' show rootBundle;

abstract class CatalogRemoteDataSource {
  /// Calls the https://rickandmortyapi.com/api/character/?page=1 endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<CatalogModel>> getCatalog(int id);
  Future <CatalogModel> getHomeCatalog();
}

class CatalogRemoteDataSourceImpl implements CatalogRemoteDataSource {
  http.Client client;



  CatalogRemoteDataSourceImpl({required this.client});

  @override
  Future<List<CatalogModel>> getCatalog(int id) {
    // TODO: implement getAllCatalog
    throw UnimplementedError();
  }

  @override
  Future<CatalogModel> getHomeCatalog() async{
    try{
      // Map map = {
      //   "jsonrpc":"2.0",
      //   "method":NetworkServices.GET_HOME_CATALOG,
      //   "params": {
      //     "id": "1",
      //   }
      // };
      // var body = json.encode(map);
      // final response = await http.post(
      //     Uri.parse(NetworkServices.ROOT),
      //     body: body,
      //     headers: {'Accept': 'application/json'}
      // );
      final response = await client.get(Uri.parse(NetworkServices.GET_HOME_CATALOG),
          headers: {'Accept': 'application/json'});

      // print('response.statusCode -- ${response.statusCode}');

      if(response.statusCode == 200){

        var catalogs = json.decode(response.body);
        // print('catalogs -- ${catalogs}');
        if(catalogs==null) return CatalogModel(id: 0, name: 'Error', photo: '', info: 'null');
        // print('result -- ${catalogs}');
        CatalogModel result = CatalogModel.fromJson(catalogs);
        return result;

      }else{
        return CatalogModel(id: 0, name: 'Error', photo: '', info: 'statusCode ${response.statusCode}');
      }
    }catch(e){
      print ('error -- $e');
      return CatalogModel(id: 0, name: 'Error', photo: '', info: '$e');
    }

  }


}