import 'package:cookbook/feature/data/datasources/local/hive/ingridient_hive.dart';
import 'package:cookbook/feature/domain/entities/ingridient_entity.dart';
import 'package:json_annotation/json_annotation.dart';


// part 'ingridient_model.g.dart';

@JsonSerializable()
class IngridientModel extends IngridientEntity{


  IngridientModel({
    required id,
    required name,
    required photo,
    required weight,
    weightExisting,
    weightPortion,
  }): super(
    id: id,
    name: name,
    photo: photo,
    weight: weight,
    weightExisting: weightExisting,
    weightPortion: weightPortion,
  );

  IngridientHive toHive() {
    return IngridientHive(
      id: id,
      name: name,
      photo: photo,
      weight: weight,
      weightPortion: weightPortion,
      weightExisting: weightExisting,
    );
  }

  IngridientModel.fromHive(IngridientHive ingridientHive)
      : super(
    id: ingridientHive.id,
    name: ingridientHive.name,
    photo: ingridientHive.photo,
    weight: ingridientHive.weight,
    weightPortion: ingridientHive.weightPortion,
    weightExisting: ingridientHive.weightPortion,
  );

  Map<String, dynamic> toMap(){
    return <String, dynamic>{
      'id' : id,
      'name' : name,
      'photo' : photo,
      'weight' : weight,
    };
  }

  factory IngridientModel.fromMap(Map<String, dynamic> map,)=> IngridientModel(
    id: map['id'],
    name: map['name'],
    photo: map['photo'],
    weight: map['weight'],

  );

  factory IngridientModel.fromJson(Map<String, dynamic> json) => IngridientModel(
    id: json['id'],
    name: json['name'],
    photo: json['photo'],
    weight: json['weight'] == null ? 0.0 : json['weight'].toDouble(),
    weightExisting: json['weightExisting']== null ? 0.0 : json['weightExisting'].toDouble(),
    weightPortion: json['weightPortion'] == null ? 0.0 : json['weightPortion'].toDouble(),
  );

  Map<String, dynamic> toJson() =>
      <String, dynamic>{
    'id': id,
    'name': name,
    'photo': photo,
    'weight': weight,
    'weightPortion': weightPortion,
    'weightExisting': weightExisting,
  };
}