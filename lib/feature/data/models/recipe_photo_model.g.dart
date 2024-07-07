// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_photo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipePhotoModel _$RecipePhotoModelFromJson(Map<String, dynamic> json) =>
    RecipePhotoModel(
      id: (json['id'] as num).toInt(),
      recipeId: (json['recipeId'] as num).toInt(),
      photo: json['photo'] as String?,
      info: json['info'] as String?,
    );

Map<String, dynamic> _$RecipePhotoModelToJson(RecipePhotoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'recipeId': instance.recipeId,
      'photo': instance.photo,
      'info': instance.info,
    };
