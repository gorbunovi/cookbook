import 'package:cookbook/core/error/exception.dart';
import 'package:cookbook/core/error/failure.dart';
import 'package:cookbook/core/platform/network_info.dart';
import 'package:cookbook/feature/data/datasources/local/local_data_source.dart';
import 'package:cookbook/feature/data/datasources/remote/remote_data_source.dart';
import 'package:cookbook/feature/data/models/catalog_model.dart';
import 'package:cookbook/feature/domain/entities/catalog_entity.dart';
import 'package:cookbook/feature/domain/repositories/catalog_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

class CatalogRepositoryImpl implements CatalogRepository {
  CatalogRepositoryImpl({
    required this.catalogLocalDataSorce,
    required this.catalogRemoteDataSource,
    required this.networkInfo,
  });

  final CatalogLocalDataSorce catalogLocalDataSorce;
  final CatalogRemoteDataSource catalogRemoteDataSource;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, CatalogEntity>> getCatalog(int parent_id) async {
    if(await networkInfo.isConnected) {
      try {
        final catalog = await catalogLocalDataSorce.getCatalogLocal();
        return Right(catalog);
      } on CacheException {
        return Left(CacheFailure(''));
      }
    }else{
      try {
        final catalog = await catalogLocalDataSorce.getCatalogLocal();
        return Right(catalog);
      } on CacheException {
        return Left(CacheFailure(''));
      }
    }
  }

  @override
  Future<Either<Failure, CatalogEntity>> getHomeCatalog() async {
    // print('getHomeCatalog');
    if(await networkInfo.isConnected) {
      try {
        final catalog = await catalogRemoteDataSource.getHomeCatalog();
        return Right(catalog);
      } catch(e) {
        return Right(CatalogModel(id: 0, name: 'Error', photo: '', info: '${e} '));
        // return Left(CacheFailure(''));
      }
    }else{
      try {
        final catalog = await catalogLocalDataSorce.getCatalogLocal();
        return Right(catalog);
      } on CacheException {
        return Left(CacheFailure(''));
      }
    }
  }
}
