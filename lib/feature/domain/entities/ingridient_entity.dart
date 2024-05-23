class IngridientEntity {
  IngridientEntity({
    required this.id,
    required this.name,
    required this.photo,
    required this.weight,
    this.weightExisting,
    this.weightPortion,
  });

  late final int id;
  final String? name;
  final String? photo;
  final double? weight;
  final double? weightPortion;
  double? weightExisting;
}
