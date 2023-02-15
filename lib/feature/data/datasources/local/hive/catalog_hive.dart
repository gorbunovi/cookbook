import 'package:hive/hive.dart';
import 'resipe_hive.dart';

part 'catalog_hive.g.dart';

@HiveType(typeId: 0)
class CatalogHive extends HiveObject {
  @HiveField(0)
  final int? id;

  @HiveField(1)
  final int? parent_id;

  @HiveField(2)
  final String? name;

  @HiveField(3)
  final String? photo;

  @HiveField(4)
  final String? info;

  @HiveField(5)
  final List<RecipeHive>? recipes;

  @HiveField(6)
  final List<CatalogHive>? catalogs;

  CatalogHive({
    required this.id,
    this.parent_id,
    required this.name,
    required this.photo,
    required this.info,
    required this.recipes,
    required this.catalogs,
  });
}
