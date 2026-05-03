/// Рецепт — узел графа
class Recipe {
  final String id;
  final String title;

  final List<Ingredient> ingredients;
  final List<String> steps;
  final List<String> equipment;

  const Recipe({
    required this.id,
    required this.title,
    this.ingredients = const [],
    this.steps = const [],
    this.equipment = const [],
  });
}

/// Ингредиент (может ссылаться на другой рецепт)
class Ingredient {
  final String name;
  final double quantity;
  final String unit;

  /// связь графа
  final String? recipeId;

  const Ingredient({
    required this.name,
    required this.quantity,
    required this.unit,
    this.recipeId,
  });
}