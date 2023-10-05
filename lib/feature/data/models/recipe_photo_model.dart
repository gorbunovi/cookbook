
import 'package:cookbook/feature/domain/entities/photo_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'recipe_photo_model.g.dart';

@JsonSerializable()
class RecipePhotoModel extends RecipePhotoEntity{

  RecipePhotoModel({
    required int id,
    required int recipeId,
    required String? photo,
    required String? info,
  }): super(
    id: id,
    recipeId: recipeId,
    photo: photo,
    info: info,
  );


  Map<String, dynamic> toMap(){
    return {
      'id' : id,
      'recipeId' : recipeId,
      'photo' : photo,
      'info' : info,
    };
  }

  factory RecipePhotoModel.fromMap(Map<String, dynamic> map,)=> RecipePhotoModel(
      id: map['id'],
      recipeId: map['recipeId'],
      photo: map['photo'],
      info: map['info']
  );

  factory RecipePhotoModel.fromJson(Map<String, dynamic> json) => _$RecipePhotoModelFromJson(json);

  Map<String, dynamic> toJson() => _$RecipePhotoModelToJson(this);
}

