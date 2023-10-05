class RecipeCookingEntity {
  RecipeCookingEntity({
    required this.id,
    required this.recipeId,
    this.photo,
    required this.info,
  });

  final int id;
  final int recipeId;
  final String? info;
  final String? photo;




  @override
  String toString() => '{'
      'id: $id, '
      'name: $recipeId, '
      'photo: $photo, '
      'info: $info'
      '}';
}