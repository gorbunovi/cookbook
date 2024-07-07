// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_cooking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeCookingModel _$RecipeCookingModelFromJson(Map<String, dynamic> json) =>
    RecipeCookingModel(
      id: (json['id'] as num).toInt(),
      recipeId: (json['recipeId'] as num).toInt(),
      photo: json['photo'] as String?,
      info: json['info'] as String?,
    );

Map<String, dynamic> _$RecipeCookingModelToJson(RecipeCookingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'recipeId': instance.recipeId,
      'info': instance.info,
      'photo': instance.photo,
    };
