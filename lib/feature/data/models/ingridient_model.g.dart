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
      weight: json['weight'] == null ? 0.0 : json['weight'].toDouble(),
      weightExisting: json['weightExisting']== null ? 0.0 : json['weightExisting'].toDouble(),
      weightPortion: json['weightPortion'] == null ? 0.0 : json['weightPortion'].toDouble(),
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
