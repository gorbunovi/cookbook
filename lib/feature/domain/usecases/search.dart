import 'package:cookbook/core/error/failure.dart';
import 'package:cookbook/feature/domain/entities/catalog_entity.dart';
import 'package:cookbook/feature/domain/repositories/search_recipe_repositories.dart';
import '../../../core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

class GetSearchCatalog extends UseCase<CatalogEntity, String>{
  GetSearchCatalog(this.searchRecipeRepository);

  final SearchRecipeRepository searchRecipeRepository;

  @override
  Future<Either<Failure, CatalogEntity>> call(search) async {
    try{
      return searchRecipeRepository.getSearchCatalog(search);
    } catch(e){
      return Left(CacheFailure(e.toString()));
    }
  }
}