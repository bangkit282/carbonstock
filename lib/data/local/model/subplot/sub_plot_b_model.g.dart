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
      plotId: fields[1] as String,
      areaName: fields[2] as String,
      plotName: fields[3] as String,
      localName: fields[4] as String,
      bioName: fields[5] as String,
      keliling: fields[6] as double,
      diameter: fields[7] as double,
      kerapatanKayu: fields[8] as double,
      biomassLand: fields[9] as double,
      carbonValue: fields[10] as double,
      carbonAbsorb: fields[11] as double,
      subPlotBPhotoUrl: fields[12] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SubPlotAreaBModel obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.uuid)
      ..writeByte(1)
      ..write(obj.plotId)
      ..writeByte(2)
      ..write(obj.areaName)
      ..writeByte(3)
      ..write(obj.plotName)
      ..writeByte(4)
      ..write(obj.localName)
      ..writeByte(5)
      ..write(obj.bioName)
      ..writeByte(6)
      ..write(obj.keliling)
      ..writeByte(7)
      ..write(obj.diameter)
      ..writeByte(8)
      ..write(obj.kerapatanKayu)
      ..writeByte(9)
      ..write(obj.biomassLand)
      ..writeByte(10)
      ..write(obj.carbonValue)
      ..writeByte(11)
      ..write(obj.carbonAbsorb)
      ..writeByte(12)
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
