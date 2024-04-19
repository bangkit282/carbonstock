// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_plot_b_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SubPlotAreaBModelAdapter extends TypeAdapter<SubPlotAreaBModel> {
  @override
  final int typeId = 6;

  @override
  SubPlotAreaBModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SubPlotAreaBModel(
      uuid: fields[0] as String?,
      areaName: fields[1] as String,
      plotName: fields[2] as String,
      localName: fields[3] as String,
      bioName: fields[4] as String,
      keliling: fields[5] as double,
      diameter: fields[6] as double,
      kerapatanKayu: fields[7] as double,
      biomassLand: fields[8] as double,
      carbonValue: fields[9] as double,
      carbonAbsorb: fields[10] as double,
      subPlotBPhotoUrl: fields[11] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SubPlotAreaBModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.uuid)
      ..writeByte(1)
      ..write(obj.areaName)
      ..writeByte(2)
      ..write(obj.plotName)
      ..writeByte(3)
      ..write(obj.localName)
      ..writeByte(4)
      ..write(obj.bioName)
      ..writeByte(5)
      ..write(obj.keliling)
      ..writeByte(6)
      ..write(obj.diameter)
      ..writeByte(7)
      ..write(obj.kerapatanKayu)
      ..writeByte(8)
      ..write(obj.biomassLand)
      ..writeByte(9)
      ..write(obj.carbonValue)
      ..writeByte(10)
      ..write(obj.carbonAbsorb)
      ..writeByte(11)
      ..write(obj.subPlotBPhotoUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubPlotAreaBModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
