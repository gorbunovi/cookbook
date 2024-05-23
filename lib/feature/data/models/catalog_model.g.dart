// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CatalogModel _$CatalogModelFromJson(Map<String, dynamic> json) => CatalogModel(
      id: json['id'] as int?,
      parent_id: json['parent_id'] as int?,
      name: json['name'] as String?,
      photo: json['photo'] as String?,
      info: json['info'] as String?,
      recipes: (json['recipes'] as List<dynamic>?)
          ?.map((e) => RecipeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      catalogs: (json['catalogs'] as List<dynamic>?)
          ?.map((e) => CatalogModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CatalogModelToJson(CatalogModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'parent_id': instance.parent_id,
      'name': instance.name,
      'photo': instance.photo,
      'info': instance.info,
      'recipes': instance.recipes,
      'catalogs': instance.catalogs,
    };
