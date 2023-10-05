import 'package:cookbook/feature/data/models/catalog_model.dart';
import 'package:cookbook/feature/data/models/recipe_model.dart';

class CatalogEntity {
  CatalogEntity({
    required this.id,
    this.parentId,
    required this.name,
    required this.photo,
    required this.info,
    this.recipes,
    this.catalogs,
  });

  late final int? id;
  late final int? parentId;
  late final String? name;
  late final String? photo;
  late final String? info;
  final List<RecipeModel>? recipes;
  final List<CatalogModel>? catalogs;





  @override
  String toString() => 'catalog: {'
      'id: $id, '
      'name: $name, '
      'photo: $photo, '
      'catalog: ${catalogs?.map((e) => e).toList()}, '
      'recipe: ${recipes?.map((e) => e).toList()}, '
      '}';
}
