// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingridient_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IngridientModel _$IngridientModelFromJson(Map<String, dynamic> json) =>
    IngridientModel(
      id: json['id'],
      name: json['name'],
      photo: json['photo'],
      weight: json['weight'],
      weightExisting: json['weightExisting'],
      weightPortion: json['weightPortion'],
    );

Map<String, dynamic> _$IngridientModelToJson(IngridientModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'photo': instance.photo,
      'weight': instance.weight,
      'weightPortion': instance.weightPortion,
      'weightExisting': instance.weightExisting,
    };
