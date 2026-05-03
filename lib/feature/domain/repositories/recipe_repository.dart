import '../entities/recipe.dart';
import '../entities/catalog_node.dart';

abstract class RecipeRepository {
  Future<List<CatalogNode>> getCatalog();

  Future<Recipe?> getRecipeById(String id);

  Future<List<Recipe>> getRecipeDependencies(String id);
}
