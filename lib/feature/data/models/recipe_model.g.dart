// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeModel _$RecipeModelFromJson(Map<String, dynamic> json) => RecipeModel(
      id: json['id'],
      catalogId: json['catalogId'],
      name: json['name'],
      photo:
          (json['photo'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      info: json['info'],
      ingridients: (json['ingridients'] as List<dynamic>?)
          ?.map((e) => IngridientModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      cooking: (json['cooking'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      weightNetto: (json['weightNetto'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$RecipeModelToJson(RecipeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'catalogId': instance.catalogId,
      'name': instance.name,
      'photo': instance.photo,
      'info': instance.info,
      'ingridients': instance.ingridients,
      'cooking': instance.cooking,
      'weightNetto': instance.weightNetto,
    };
