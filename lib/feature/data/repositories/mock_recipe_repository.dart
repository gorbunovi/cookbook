import 'package:get/get.dart';

import '../../domain/entities/recipe.dart';
import '../../domain/entities/catalog_node.dart';
import '../../domain/repositories/recipe_repository.dart';

class MockRecipeRepository extends GetxService
    implements RecipeRepository {
  final Map<String, Recipe> _recipes = {};
  final List<CatalogNode> _catalog = [];

  @override
  void onInit() {
    super.onInit();
    _seed();
  }

  void _seed() {
    final sauce = Recipe(
      id: 'sauce_1',
      title: 'Томатный соус',
      ingredients: [
        Ingredient(name: 'Помидоры', quantity: 3, unit: 'шт'),
      ],
      steps: ['Измельчить', 'Потушить'],
      equipment: ['Кастрюля'],
    );

    final omelette = Recipe(
      id: 'r_1',
      title: 'Омлет',
      ingredients: [
        Ingredient(name: 'Яйцо', quantity: 2, unit: 'шт'),
        Ingredient(name: 'Молоко', quantity: 100, unit: 'мл'),
        Ingredient(
          name: 'Соус',
          quantity: 50,
          unit: 'г',
          recipeId: 'sauce_1',
        ),
      ],
      steps: ['Смешать', 'Жарить'],
      equipment: ['Сковорода'],
    );

    _recipes['sauce_1'] = sauce;
    _recipes['r_1'] = omelette;

    _catalog.add(
      CatalogNode(
        id: 'c1',
        title: 'Завтраки',
        type: NodeType.catalog,
        children: [
          CatalogNode(
            id: 'r1_node',
            title: 'Омлет',
            type: NodeType.recipe,
            recipeId: 'r_1',
          ),
        ],
      ),
    );
  }

  @override
  Future<List<CatalogNode>> getCatalog() async {
    return _catalog;
  }

  @override
  Future<Recipe?> getRecipeById(String id) async {
    return _recipes[id];
  }

  @override
  Future<List<Recipe>> getRecipeDependencies(String id) async {
    final recipe = _recipes[id];
    if (recipe == null) return [];

    final result = <Recipe>[];

    for (final ing in recipe.ingredients) {
      if (ing.recipeId != null) {
        final dep = _recipes[ing.recipeId!];
        if (dep != null) result.add(dep);
      }
    }

    return result;
  }
}