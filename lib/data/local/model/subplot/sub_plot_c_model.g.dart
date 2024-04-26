// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_plot_c_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SubPlotAreaCModelAdapter extends TypeAdapter<SubPlotAreaCModel> {
  @override
  final int typeId = 7;

  @override
  SubPlotAreaCModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SubPlotAreaCModel(
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
      updatedAt: fields[12] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, SubPlotAreaCModel obj) {
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
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubPlotAreaCModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
