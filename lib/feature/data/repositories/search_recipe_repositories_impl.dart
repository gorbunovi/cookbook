import 'package:cookbook/core/error/failure.dart';
import 'package:cookbook/feature/data/datasources/search/local/local_data_source.dart';
import 'package:cookbook/feature/data/datasources/search/remote/remote_data_source.dart';
import 'package:cookbook/feature/data/models/catalog_model.dart';
import 'package:cookbook/feature/domain/entities/catalog_entity.dart';
import 'package:cookbook/feature/domain/repositories/search_recipe_repositories.dart';
import 'package:dartz/dartz.dart';

import '../../../core/core.dart';
import '../../../core/error/exception.dart';

class SearchRecipeRepositoryImpl implements SearchRecipeRepository {
  SearchRecipeRepositoryImpl({
    required this.searchCatalogLocalDataSorce,
    required this.searchRemoteDataSource,
    required this.networkInfo,
  });

  final SearchCatalogLocalDataSorce searchCatalogLocalDataSorce;
  final SearchRemoteDataSource searchRemoteDataSource;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, CatalogEntity>> getSearchCatalog(String search) async {
    if (await networkInfo.isConnected) {
      try {
        final catalog = await searchRemoteDataSource.getSearchCatalog(search);
        return Right(catalog);
      } catch (e) {
        return Right(
            CatalogModel(id: 0, name: 'Error', photo: '', info: '${e} '));
        // return Left(CacheFailure(''));
      }
    } else {
      try {
        final catalog =
            await searchCatalogLocalDataSorce.getSearchCatalogLocal(search);
        return Right(catalog);
      } catch (e) {
        return Left(CacheFailure('$e'));
      }
    }
  }
}
