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
    );
  }

  @override
  void write(BinaryWriter writer, SubPlotAreaCModel obj) {
    writer
      ..writeByte(11)
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
      ..write(obj.carbonAbsorb);
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
