import 'package:cookbook/feature/data/datasources/catalog/local/hive/resipe_hive.dart';
import 'package:cookbook/feature/data/models/ingridient_model.dart';
import 'package:cookbook/feature/domain/entities/recipe_entity.dart';
import 'package:json_annotation/json_annotation.dart';


part 'recipe_model.g.dart';

@JsonSerializable()
class RecipeModel extends RecipeEntity{

  RecipeModel({
    required id,
    required catalog_id,
    required name,
    List<String?>? photo,
    required info,
    List<IngridientModel>? ingridients,
    List<String?>? cooking,
    double? weightNetto = 0.0,
  }): super(
    id: id,
    catalog_id: catalog_id,
    name: name,
    photo: photo,
    info: info,
    ingridients: ingridients,
    weightNetto: weightNetto,
    cooking: cooking,
  );

  RecipeHive toHive() {
    return RecipeHive(
      id: id,
      catalog_id: catalog_id,
      name: name,
      photo: photo,
      info: info,
      weightNetto: weightNetto,
      ingridients: ingridients!.map((ingridient) => ingridient.toHive()).toList(),
      cooking: cooking,

    );
  }

  RecipeModel.fromHive(RecipeHive recipeHive)
      : super(
    id: recipeHive.id,
    catalog_id: recipeHive.catalog_id,
    name: recipeHive.name,
    photo: recipeHive.photo,
    info: recipeHive.info,
    weightNetto: recipeHive.weightNetto,
    ingridients: recipeHive.ingridients!.map((ingridient) => IngridientModel.fromHive(ingridient)).toList(),
    cooking: recipeHive.cooking,
  );

  Map<String, dynamic> toMap(){
    return {
      'id' : id,
      'catalog_id' : catalog_id,
      'name' : name,
      'photo' : photo,
      'info' : info,
    };
  }

  factory RecipeModel.fromMap(Map<String, dynamic> map,)=> RecipeModel(
      id: map['id'],
      catalog_id: map['catalog_id'],
      name: map['name'],
      photo: map['photo'],
      info: map['info'],
  );

  factory RecipeModel.fromJson(Map<String, dynamic> json) => _$RecipeModelFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeModelToJson(this);
}