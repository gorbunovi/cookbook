// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingridient_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class IngridientHiveAdapter extends TypeAdapter<IngridientHive> {
  @override
  final int typeId = 2;

  @override
  IngridientHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return IngridientHive(
      id: fields[0] as int,
      name: fields[1] as String?,
      photo: fields[2] as String?,
      weight: fields[3] as double?,
      weightPortion: fields[4] as double?,
      weightExisting: fields[5] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, IngridientHive obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.photo)
      ..writeByte(3)
      ..write(obj.weight)
      ..writeByte(4)
      ..write(obj.weightPortion)
      ..writeByte(5)
      ..write(obj.weightExisting);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IngridientHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
