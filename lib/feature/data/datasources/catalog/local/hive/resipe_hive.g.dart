// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resipe_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecipeHiveAdapter extends TypeAdapter<RecipeHive> {
  @override
  final int typeId = 1;

  @override
  RecipeHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecipeHive(
      id: fields[0] as int?,
      catalog_id: fields[1] as int?,
      name: fields[2] as String?,
      photo: (fields[3] as List?)?.cast<String?>(),
      info: fields[4] as String?,
      ingridients: (fields[6] as List?)?.cast<IngridientHive>(),
      cooking: (fields[7] as List?)?.cast<String?>(),
      weightNetto: fields[5] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, RecipeHive obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.catalog_id)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.photo)
      ..writeByte(4)
      ..write(obj.info)
      ..writeByte(5)
      ..write(obj.weightNetto)
      ..writeByte(6)
      ..write(obj.ingridients)
      ..writeByte(7)
      ..write(obj.cooking);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecipeHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
