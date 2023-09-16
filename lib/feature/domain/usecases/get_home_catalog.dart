import 'package:cookbook/core/error/failure.dart';
import 'package:cookbook/core/usecase/usecase.dart';
import 'package:cookbook/feature/domain/entities/catalog_entity.dart';
import 'package:cookbook/feature/domain/repositories/catalog_repository.dart';
import 'package:dartz/dartz.dart';

class GetHomeCatalog extends UseCaseNoParams<CatalogEntity>{
  GetHomeCatalog(this.catalogRepository);

  final CatalogRepository catalogRepository;

  @override
  Future<Either<Failure, CatalogEntity>> call() async {
    try{
      return catalogRepository.getHomeCatalog();
    } catch(e){
      return Left(CacheFailure(e.toString()));
    }
  }
}