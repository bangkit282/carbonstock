// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_plot_d_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SubPlotAreaDPohonModelAdapter
    extends TypeAdapter<SubPlotAreaDPohonModel> {
  @override
  final int typeId = 8;

  @override
  SubPlotAreaDPohonModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SubPlotAreaDPohonModel(
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
      updateAt: fields[11] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, SubPlotAreaDPohonModel obj) {
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
      ..write(obj.updateAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubPlotAreaDPohonModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SubPlotAreaDNekromasModelAdapter
    extends TypeAdapter<SubPlotAreaDNekromasModel> {
  @override
  final int typeId = 9;

  @override
  SubPlotAreaDNekromasModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SubPlotAreaDNekromasModel(
      uuid: fields[0] as String?,
      areaName: fields[1] as String,
      plotName: fields[2] as String,
      diameterPangkal: fields[3] as double,
      diameterUjung: fields[4] as double,
      panjang: fields[5] as double,
      volume: fields[6] as double,
      biomassLand: fields[7] as double,
      carbonValue: fields[8] as double,
      carbonAbsorb: fields[9] as double,
      updateAt: fields[10] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, SubPlotAreaDNekromasModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.uuid)
      ..writeByte(1)
      ..write(obj.areaName)
      ..writeByte(2)
      ..write(obj.plotName)
      ..writeByte(3)
      ..write(obj.diameterPangkal)
      ..writeByte(4)
      ..write(obj.diameterUjung)
      ..writeByte(5)
      ..write(obj.panjang)
      ..writeByte(6)
      ..write(obj.volume)
      ..writeByte(7)
      ..write(obj.biomassLand)
      ..writeByte(8)
      ..write(obj.carbonValue)
      ..writeByte(9)
      ..write(obj.carbonAbsorb)
      ..writeByte(10)
      ..write(obj.updateAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubPlotAreaDNekromasModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SubPlotAreaDTanahModelAdapter
    extends TypeAdapter<SubPlotAreaDTanahModel> {
  @override
  final int typeId = 10;

  @override
  SubPlotAreaDTanahModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SubPlotAreaDTanahModel(
      uuid: fields[0] as String?,
      areaName: fields[1] as String,
      plotName: fields[2] as String,
      kedalamanSample: fields[3] as double,
      beratJenisTanah: fields[4] as double,
      organicTanah: fields[5] as double,
      carbonGrCm: fields[6] as double,
      carbonTonHa: fields[7] as double,
      carbonTon: fields[8] as double,
      carbonAbsorb: fields[9] as double,
      updateAt: fields[10] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, SubPlotAreaDTanahModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.uuid)
      ..writeByte(1)
      ..write(obj.areaName)
      ..writeByte(2)
      ..write(obj.plotName)
      ..writeByte(3)
      ..write(obj.kedalamanSample)
      ..writeByte(4)
      ..write(obj.beratJenisTanah)
      ..writeByte(5)
      ..write(obj.organicTanah)
      ..writeByte(6)
      ..write(obj.carbonGrCm)
      ..writeByte(7)
      ..write(obj.carbonTonHa)
      ..writeByte(8)
      ..write(obj.carbonTon)
      ..writeByte(9)
      ..write(obj.carbonAbsorb)
      ..writeByte(10)
      ..write(obj.updateAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubPlotAreaDTanahModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
