import 'package:cookbook/feature/data/models/ingridient_model.dart';
import 'package:cookbook/feature/domain/entities/ingridient_entity.dart';

class RecipeEntity {
  RecipeEntity({
    required this.id,
    required this.catalog_id,
    required this.name,
    this.photo,
    required this.info,
    required this.ingridients,
    required this.cooking,
    this.weightNetto = 0,
  });

  late final int? id;
  final int? catalog_id;
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
