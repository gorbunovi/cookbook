import 'package:cookbook/feature/data/datasources/catalog/local/hive/catalog_hive.dart';
import 'package:cookbook/feature/data/models/recipe_model.dart';
import 'package:cookbook/feature/domain/entities/catalog_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'catalog_model.g.dart';

@JsonSerializable()
class CatalogModel extends CatalogEntity{

  CatalogModel({
      required int? id,
      int? parent_id,
      required String? name,
      required String? photo,
      required String? info,
      List<RecipeModel>? recipes,
      List<CatalogModel>?catalogs,
  }): super(
    id: id,
    parent_id: parent_id,
    name: name,
    photo: photo,
    catalogs: catalogs,
    recipes: recipes,
    info: info,
  );


  CatalogHive toHive() {
    return CatalogHive(
        id: id,
        parent_id: parent_id,
        name: name,
        photo: photo,
        info: info,
        recipes: recipes?.map((resipe) => resipe.toHive()).toList(),
        catalogs: catalogs?.map((catalog) => catalog.toHive()).toList(),
    );
  }

  CatalogModel.fromHive(CatalogHive catalogHiveModel)
      : super(
      id: catalogHiveModel.id,
      parent_id: catalogHiveModel.parent_id,
      name: catalogHiveModel.name,
      photo: catalogHiveModel.photo,
      info: catalogHiveModel.info,
      catalogs: catalogHiveModel.catalogs?.map((e) => CatalogModel.fromHive(e)).toList()
  );

  Map<String, dynamic> toMap(){
    return {
      'id' : id,
      'parent_id' : parent_id,
      'name' : name,
      'photo' : photo,
      'info' : info,
    };
  }

  factory CatalogModel.fromMap(Map<String, dynamic> map,)=> CatalogModel(
    id: map['id'],
    parent_id: map['parent_id'],
    name: map['name'],
    photo: map['photo'],
    info: map['info']
  );

  factory CatalogModel.fromJson(Map<String, dynamic> json) => _$CatalogModelFromJson(json);

  Map<String, dynamic> toJson() => _$CatalogModelToJson(this);
}

