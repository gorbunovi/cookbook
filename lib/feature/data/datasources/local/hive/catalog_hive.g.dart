// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CatalogHiveAdapter extends TypeAdapter<CatalogHive> {
  @override
  final int typeId = 0;

  @override
  CatalogHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CatalogHive(
      id: fields[0] as int?,
      parent_id: fields[1] as int?,
      name: fields[2] as String?,
      photo: fields[3] as String?,
      info: fields[4] as String?,
      recipes: (fields[5] as List?)?.cast<RecipeHive>(),
      catalogs: (fields[6] as List?)?.cast<CatalogHive>(),
    );
  }

  @override
  void write(BinaryWriter writer, CatalogHive obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.parent_id)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.photo)
      ..writeByte(4)
      ..write(obj.info)
      ..writeByte(5)
      ..write(obj.recipes)
      ..writeByte(6)
      ..write(obj.catalogs);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CatalogHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
