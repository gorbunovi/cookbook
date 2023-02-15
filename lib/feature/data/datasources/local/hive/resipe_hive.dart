import 'package:hive/hive.dart';
import 'ingridient_hive.dart';

part 'resipe_hive.g.dart';

@HiveType(typeId: 1)
class RecipeHive extends HiveObject {
  @HiveField(0)
  final int? id;

  @HiveField(1)
  final int? catalog_id;

  @HiveField(2)
  final String? name;

  @HiveField(3)
  final List<String?>? photo;

  @HiveField(4)
  final String? info;

  @HiveField(5)
  double? weightNetto;

  @HiveField(6)
  final List<IngridientHive>? ingridients;

  @HiveField(7)
  final List<String?>? cooking;

  RecipeHive({
    required this.id,
    required this.catalog_id,
    required this.name,
    this.photo,
    required this.info,
    required this.ingridients,
    required this.cooking,
    this.weightNetto = 0,
  });
}
