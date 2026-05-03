import 'recipe.dart';

enum NodeType {
  catalog,
  recipe,
}

/// Узел каталога (UI дерево)
class CatalogNode {
  final String id;
  final String title;
  final NodeType type;

  final List<CatalogNode> children;

  /// связь с рецептом
  final String? recipeId;

  const CatalogNode({
    required this.id,
    required this.title,
    required this.type,
    this.children = const [],
    this.recipeId,
  });
}