// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plot_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlotModelAdapter extends TypeAdapter<PlotModel> {
  @override
  final int typeId = 1;

  @override
  PlotModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PlotModel(
      plotId: fields[0] as String?,
      plotLat: fields[1] as double,
      plotLng: fields[2] as double,
      plotSize: fields[3] as double,
      biomassAvg: fields[4] as double,
      biomassStd: fields[5] as double,
    );
  }

  @override
  void write(BinaryWriter writer, PlotModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.plotId)
      ..writeByte(1)
      ..write(obj.plotLat)
      ..writeByte(2)
      ..write(obj.plotLng)
      ..writeByte(3)
      ..write(obj.plotSize)
      ..writeByte(4)
      ..write(obj.biomassAvg)
      ..writeByte(5)
      ..write(obj.biomassStd);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlotModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
