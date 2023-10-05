import 'package:cookbook/core/error/failure.dart';
import 'package:cookbook/feature/domain/entities/catalog_entity.dart';
import 'package:dartz/dartz.dart';

abstract class CatalogRepository{
  Future<Either<Failure,CatalogEntity>> getCatalog(int parent_id);
  Future<Either<Failure,List<CatalogEntity>?>> getCatalogs();
  Future<Either<Failure,CatalogEntity>> getHomeCatalog();
}