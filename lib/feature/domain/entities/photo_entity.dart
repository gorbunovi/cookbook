class RecipePhotoEntity {
  RecipePhotoEntity({
    required this.id,
    required this.recipeId,
    this.photo,
    required this.info,
  });

  final int id;
  final int recipeId;
  final String? photo;
  final String? info;


  @override
  String toString() => '{'
      'id: $id, '
      'name: $recipeId, '
      'photo: $photo, '
      'info: $info'
      '}';
}