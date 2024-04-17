// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'area_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AreaModelAdapter extends TypeAdapter<AreaModel> {
  @override
  final int typeId = 0;

  @override
  AreaModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AreaModel(
      areaId: fields[0] as String?,
      areaName: fields[1] as String,
      areaLocation: fields[2] as String,
      areaImage: fields[3] as String,
      forestType: fields[4] as String,
      landType: fields[5] as String,
      createdAt: fields[6] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, AreaModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.areaId)
      ..writeByte(1)
      ..write(obj.areaName)
      ..writeByte(2)
      ..write(obj.areaLocation)
      ..writeByte(3)
      ..write(obj.areaImage)
      ..writeByte(4)
      ..write(obj.forestType)
      ..writeByte(5)
      ..write(obj.landType)
      ..writeByte(6)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AreaModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
