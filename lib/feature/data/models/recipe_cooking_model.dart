import 'package:cookbook/feature/domain/entities/recipe_cooking_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'recipe_cooking_model.g.dart';

@JsonSerializable()
class RecipeCookingModel extends RecipeCookingEntity{

  RecipeCookingModel({
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

  factory RecipeCookingModel.fromMap(Map<String, dynamic> map,)=> RecipeCookingModel(
      id: map['id'],
      recipeId: map['recipeId'],
      photo: map['photo'],
      info: map['info']
  );

  factory RecipeCookingModel.fromJson(Map<String, dynamic> json) => _$RecipeCookingModelFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeCookingModelToJson(this);
}

