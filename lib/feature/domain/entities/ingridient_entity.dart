class IngridientEntity {
  IngridientEntity({
    required this.id,
    required this.recipeId,
    required this.info,
    required this.name,
    required this.photo,
    required this.weight,
    this.weightExisting,
    this.weightPortion,
  });

  late final int id;
  late final int recipeId;
  final String? info;
  final String? name;
  final String? photo;
  final double? weight;
  final double? weightPortion;
  double? weightExisting;
}
