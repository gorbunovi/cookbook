import 'package:hive/hive.dart';

part 'ingridient_hive.g.dart';

@HiveType(typeId: 2)
class IngridientHive extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? photo;
  @HiveField(3)
  final double? weight;
  @HiveField(4)
  final double? weightPortion;
  @HiveField(5)
  final double? weightExisting;

  IngridientHive({
    required this.id,
    required this.name,
    required this.photo,
    required this.weight,
    this.weightPortion,
    this.weightExisting,
  });
}
