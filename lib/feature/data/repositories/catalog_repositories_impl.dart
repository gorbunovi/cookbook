import 'package:cookbook/core/error/exception.dart';
import 'package:cookbook/core/error/failure.dart';
import 'package:cookbook/core/services/rest/service/network_info.dart';
import 'package:cookbook/feature/data/datasources/catalog/local/local_data_source.dart';
import 'package:cookbook/feature/data/datasources/catalog/remote/remote_data_source.dart';
import 'package:cookbook/feature/data/datasources/save_cookbook/local/local_data_source.dart';
import 'package:cookbook/feature/data/models/catalog_model.dart';
import 'package:cookbook/feature/data/models/recipe_model.dart';
import 'package:cookbook/feature/domain/entities/catalog_entity.dart';
import 'package:cookbook/feature/domain/repositories/catalog_repository.dart';
import 'package:dartz/dartz.dart';

class CatalogRepositoryImpl implements CatalogRepository {
  CatalogRepositoryImpl({
    required this.catalogLocalDataSorce,
    required this.catalogRemoteDataSource,
    // required this.saveCookBookLocalDataSorce,
    required this.networkInfo,
  });

  final CatalogLocalDataSource catalogLocalDataSorce;
  final CatalogRemoteDataSource catalogRemoteDataSource;
  // final SaveCookBookLocalDataSorce saveCookBookLocalDataSorce;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, CatalogEntity>> getCatalog(int parent_id) async {
    if(await networkInfo.isConnected) {
      try {
        final Map<String, dynamic> catalogs = await await catalogRemoteDataSource.getHomeCatalog();
        CatalogModel result = CatalogModel.fromJson(catalogs);
        return Right(result);
      } on CacheException {
        return Left(CacheFailure(''));
      }
    }else{
      try {
        final Map<String, dynamic> catalogs = await catalogLocalDataSorce.getCatalogLocal();
        CatalogModel result = CatalogModel.fromJson(catalogs);
        return Right(result);
      } on CacheException {
        return Left(CacheFailure(''));
      }
    }
  }

  @override
  Future<Either<Failure, CatalogEntity>> getHomeCatalog() async {
    CatalogModel result;
    if(await networkInfo.isConnected) {
      try {
        final dynamic catalog =  await catalogRemoteDataSource.getHomeCatalog();
        if(catalog==null) result = CatalogModel(id: 0, name: 'Error', photo: '', info: 'nullRemoteDataSource');
          await catalogLocalDataSorce.createCatalogLocal(catalog);
          result = CatalogModel.fromJson(catalog);
        return Right(result);
      } catch(e) {
        return Right(CatalogModel(id: 0, name: 'Error', photo: '', info: '$e '));
        // return Left(CacheFailure(''));
      }
    }else{
      try {
        final Map<String, dynamic> catalogs = await catalogLocalDataSorce.getCatalogLocal();
        if(catalogs==null) result = CatalogModel(id: 0, name: 'Error', photo: '', info: 'nullLocalDataSorce');
        result = CatalogModel.fromJson(catalogs);
        return Right(result);
      } catch(e) {
        return Left(CacheFailure('$e'));
      }
    }
  }



  @override
  Future<Either<Failure, List<CatalogEntity>?>> getCatalogs() async {
    if(await networkInfo.isConnected) {
      try {
        final catalog = await catalogRemoteDataSource.getCatalog();
        return Right(catalog);
      } catch(e) {
        return Left(CacheFailure(''));
      }
    }else{
      return Left(CacheFailure(''));
    }
  }
}
