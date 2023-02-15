import 'package:cookbook/core/error/failure.dart';
import 'package:cookbook/core/usecase/usecase.dart';
import 'package:cookbook/feature/domain/entities/catalog_entity.dart';
import 'package:cookbook/feature/domain/repositories/catalog_repository.dart';
import 'package:dartz/dartz.dart';

class GetCatalogs extends UseCase<CatalogEntity, int>{
  GetCatalogs(this.catalogRepository);

  final CatalogRepository catalogRepository;

  @override
  Future<Either<Failure, CatalogEntity>> call(int parent_id) async {
    try{
      return catalogRepository.getCatalog(parent_id);
    } catch(e){
     return Left(CacheFailure(e.toString()));
    }
  }
}