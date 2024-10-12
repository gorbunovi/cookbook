import 'package:cookbook/feature/data/models/ingridient_model.dart';

import 'catalog_recipe.dart';

class RecipeEntity extends CatalogRecipe {
  RecipeEntity({
    required this.id,
    required this.catalogId,
    required this.name,
    this.photo,
    required this.info,
    required this.ingridients,
    required this.cooking,
    this.weightNetto = 0,
  });

  late final int? id;
  final int? catalogId;
  final String? name;
  final List<String?>? photo;
  final String? info;
  final List<IngridientModel>? ingridients;
  final List<String?>? cooking;
  double? weightNetto;

  @override
  String toString() => '{'
      'id: $id, '
      'name: $name, '
      'photo: $photo, '
      '}';
}
