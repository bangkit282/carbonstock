// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_plot_d_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SubPlotAreaDModelAdapter extends TypeAdapter<SubPlotAreaDModel> {
  @override
  final int typeId = 8;

  @override
  SubPlotAreaDModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SubPlotAreaDModel(
      uuid: fields[0] as String?,
      plotId: fields[1] as String,
      areaName: fields[2] as String,
      plotName: fields[3] as String,
      subPlotDModels: (fields[4] as List?)?.cast<dynamic>(),
      updatedAt: fields[5] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, SubPlotAreaDModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.uuid)
      ..writeByte(1)
      ..write(obj.plotId)
      ..writeByte(2)
      ..write(obj.areaName)
      ..writeByte(3)
      ..write(obj.plotName)
      ..writeByte(4)
      ..write(obj.subPlotDModels)
      ..writeByte(5)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubPlotAreaDModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SubPlotAreaDPohonModelAdapter
    extends TypeAdapter<SubPlotAreaDPohonModel> {
  @override
  final int typeId = 9;

  @override
  SubPlotAreaDPohonModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SubPlotAreaDPohonModel(
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
  void write(BinaryWriter writer, SubPlotAreaDPohonModel obj) {
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
      other is SubPlotAreaDPohonModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SubPlotAreaDNekromasModelAdapter
    extends TypeAdapter<SubPlotAreaDNekromasModel> {
  @override
  final int typeId = 10;

  @override
  SubPlotAreaDNekromasModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SubPlotAreaDNekromasModel(
      uuid: fields[0] as String?,
      plotId: fields[1] as String,
      areaName: fields[2] as String,
      plotName: fields[3] as String,
      diameterPangkal: fields[4] as double,
      diameterUjung: fields[5] as double,
      panjang: fields[6] as double,
      volume: fields[7] as double,
      biomassLand: fields[8] as double,
      carbonValue: fields[9] as double,
      carbonAbsorb: fields[10] as double,
      updatedAt: fields[11] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, SubPlotAreaDNekromasModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.uuid)
      ..writeByte(1)
      ..write(obj.plotId)
      ..writeByte(2)
      ..write(obj.areaName)
      ..writeByte(3)
      ..write(obj.plotName)
      ..writeByte(4)
      ..write(obj.diameterPangkal)
      ..writeByte(5)
      ..write(obj.diameterUjung)
      ..writeByte(6)
      ..write(obj.panjang)
      ..writeByte(7)
      ..write(obj.volume)
      ..writeByte(8)
      ..write(obj.biomassLand)
      ..writeByte(9)
      ..write(obj.carbonValue)
      ..writeByte(10)
      ..write(obj.carbonAbsorb)
      ..writeByte(11)
      ..write(obj.updatedAt);
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
  final int typeId = 11;

  @override
  SubPlotAreaDTanahModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SubPlotAreaDTanahModel(
      uuid: fields[0] as String?,
      plotId: fields[1] as String,
      areaName: fields[2] as String,
      plotName: fields[3] as String,
      kedalamanSample: fields[4] as double,
      beratJenisTanah: fields[5] as double,
      organicTanah: fields[6] as double,
      carbonGrCm: fields[7] as double,
      carbonTonHa: fields[8] as double,
      carbonTon: fields[9] as double,
      carbonAbsorb: fields[10] as double,
      updatedAt: fields[11] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, SubPlotAreaDTanahModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.uuid)
      ..writeByte(1)
      ..write(obj.plotId)
      ..writeByte(2)
      ..write(obj.areaName)
      ..writeByte(3)
      ..write(obj.plotName)
      ..writeByte(4)
      ..write(obj.kedalamanSample)
      ..writeByte(5)
      ..write(obj.beratJenisTanah)
      ..writeByte(6)
      ..write(obj.organicTanah)
      ..writeByte(7)
      ..write(obj.carbonGrCm)
      ..writeByte(8)
      ..write(obj.carbonTonHa)
      ..writeByte(9)
      ..write(obj.carbonTon)
      ..writeByte(10)
      ..write(obj.carbonAbsorb)
      ..writeByte(11)
      ..write(obj.updatedAt);
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
