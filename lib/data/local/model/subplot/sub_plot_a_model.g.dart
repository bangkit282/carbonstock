// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_plot_a_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SubPlotAreaAModelAdapter extends TypeAdapter<SubPlotAreaAModel> {
  @override
  final int typeId = 2;

  @override
  SubPlotAreaAModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SubPlotAreaAModel(
      uuid: fields[0] as String?,
      plotId: fields[1] as String,
      areaName: fields[2] as String,
      plotName: fields[3] as String,
      subPlotAModels: (fields[4] as List?)?.cast<dynamic>(),
      updatedAt: fields[5] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, SubPlotAreaAModel obj) {
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
      ..write(obj.subPlotAModels)
      ..writeByte(5)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubPlotAreaAModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SubPlotAreaASemaiModelAdapter
    extends TypeAdapter<SubPlotAreaASemaiModel> {
  @override
  final int typeId = 3;

  @override
  SubPlotAreaASemaiModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SubPlotAreaASemaiModel(
      uuid: fields[0] as String?,
      plotId: fields[1] as String,
      areaName: fields[2] as String,
      plotName: fields[3] as String,
      basahTotal: fields[4] as double,
      basahSample: fields[5] as double,
      keringTotal: fields[6] as double,
      keringSample: fields[7] as double,
      carbonValue: fields[8] as double,
      carbonAbsorb: fields[9] as double,
      updatedAt: fields[10] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, SubPlotAreaASemaiModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.uuid)
      ..writeByte(1)
      ..write(obj.plotId)
      ..writeByte(2)
      ..write(obj.areaName)
      ..writeByte(3)
      ..write(obj.plotName)
      ..writeByte(4)
      ..write(obj.basahTotal)
      ..writeByte(5)
      ..write(obj.basahSample)
      ..writeByte(6)
      ..write(obj.keringTotal)
      ..writeByte(7)
      ..write(obj.keringSample)
      ..writeByte(8)
      ..write(obj.carbonValue)
      ..writeByte(9)
      ..write(obj.carbonAbsorb)
      ..writeByte(10)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubPlotAreaASemaiModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SubPlotAreaASeresahModelAdapter
    extends TypeAdapter<SubPlotAreaASeresahModel> {
  @override
  final int typeId = 4;

  @override
  SubPlotAreaASeresahModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SubPlotAreaASeresahModel(
      uuid: fields[0] as String?,
      plotId: fields[1] as String,
      areaName: fields[2] as String,
      plotName: fields[3] as String,
      basahTotal: fields[4] as double,
      basahSample: fields[5] as double,
      keringTotal: fields[6] as double,
      keringSample: fields[7] as double,
      carbonValue: fields[8] as double,
      carbonAbsorb: fields[9] as double,
      updatedAt: fields[10] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, SubPlotAreaASeresahModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.uuid)
      ..writeByte(1)
      ..write(obj.plotId)
      ..writeByte(2)
      ..write(obj.areaName)
      ..writeByte(3)
      ..write(obj.plotName)
      ..writeByte(4)
      ..write(obj.basahTotal)
      ..writeByte(5)
      ..write(obj.basahSample)
      ..writeByte(6)
      ..write(obj.keringTotal)
      ..writeByte(7)
      ..write(obj.keringSample)
      ..writeByte(8)
      ..write(obj.carbonValue)
      ..writeByte(9)
      ..write(obj.carbonAbsorb)
      ..writeByte(10)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubPlotAreaASeresahModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SubPlotAreaATumbuhanBawahModelAdapter
    extends TypeAdapter<SubPlotAreaATumbuhanBawahModel> {
  @override
  final int typeId = 5;

  @override
  SubPlotAreaATumbuhanBawahModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SubPlotAreaATumbuhanBawahModel(
      uuid: fields[0] as String?,
      plotId: fields[1] as String,
      areaName: fields[2] as String,
      plotName: fields[3] as String,
      basahTotal: fields[4] as double,
      basahSample: fields[5] as double,
      keringTotal: fields[6] as double,
      keringSample: fields[7] as double,
      carbonValue: fields[8] as double,
      carbonAbsorb: fields[9] as double,
      updatedAt: fields[10] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, SubPlotAreaATumbuhanBawahModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.uuid)
      ..writeByte(1)
      ..write(obj.plotId)
      ..writeByte(2)
      ..write(obj.areaName)
      ..writeByte(3)
      ..write(obj.plotName)
      ..writeByte(4)
      ..write(obj.basahTotal)
      ..writeByte(5)
      ..write(obj.basahSample)
      ..writeByte(6)
      ..write(obj.keringTotal)
      ..writeByte(7)
      ..write(obj.keringSample)
      ..writeByte(8)
      ..write(obj.carbonValue)
      ..writeByte(9)
      ..write(obj.carbonAbsorb)
      ..writeByte(10)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubPlotAreaATumbuhanBawahModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
