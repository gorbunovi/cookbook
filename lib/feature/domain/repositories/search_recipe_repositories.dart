import 'package:cookbook/core/error/failure.dart';
import 'package:cookbook/feature/domain/entities/catalog_entity.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRecipeRepository{
  Future<Either<Failure,CatalogEntity>> getSearchCatalog(String search);
}