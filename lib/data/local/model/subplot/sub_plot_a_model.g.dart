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
      areaName: fields[1] as String,
      plotName: fields[2] as String,
      subPlotAModels: (fields[3] as List?)?.cast<dynamic>(),
      subPlotAPhotoUrl: fields[4] as String,
      updateAt: fields[5] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, SubPlotAreaAModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.uuid)
      ..writeByte(1)
      ..write(obj.areaName)
      ..writeByte(2)
      ..write(obj.plotName)
      ..writeByte(3)
      ..write(obj.subPlotAModels)
      ..writeByte(4)
      ..write(obj.subPlotAPhotoUrl)
      ..writeByte(5)
      ..write(obj.updateAt);
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
      areaName: fields[1] as String,
      plotName: fields[2] as String,
      basahTotal: fields[3] as double,
      basahSample: fields[4] as double,
      keringTotal: fields[5] as double,
      keringSample: fields[6] as double,
      carbonValue: fields[7] as double,
      carbonAbsorb: fields[8] as double,
    );
  }

  @override
  void write(BinaryWriter writer, SubPlotAreaASemaiModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.uuid)
      ..writeByte(1)
      ..write(obj.areaName)
      ..writeByte(2)
      ..write(obj.plotName)
      ..writeByte(3)
      ..write(obj.basahTotal)
      ..writeByte(4)
      ..write(obj.basahSample)
      ..writeByte(5)
      ..write(obj.keringTotal)
      ..writeByte(6)
      ..write(obj.keringSample)
      ..writeByte(7)
      ..write(obj.carbonValue)
      ..writeByte(8)
      ..write(obj.carbonAbsorb);
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
      areaName: fields[1] as String,
      plotName: fields[2] as String,
      basahTotal: fields[3] as double,
      basahSample: fields[4] as double,
      keringTotal: fields[5] as double,
      keringSample: fields[6] as double,
      carbonValue: fields[7] as double,
      carbonAbsorb: fields[8] as double,
    );
  }

  @override
  void write(BinaryWriter writer, SubPlotAreaASeresahModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.uuid)
      ..writeByte(1)
      ..write(obj.areaName)
      ..writeByte(2)
      ..write(obj.plotName)
      ..writeByte(3)
      ..write(obj.basahTotal)
      ..writeByte(4)
      ..write(obj.basahSample)
      ..writeByte(5)
      ..write(obj.keringTotal)
      ..writeByte(6)
      ..write(obj.keringSample)
      ..writeByte(7)
      ..write(obj.carbonValue)
      ..writeByte(8)
      ..write(obj.carbonAbsorb);
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
      areaName: fields[1] as String,
      plotName: fields[2] as String,
      basahTotal: fields[3] as double,
      basahSample: fields[4] as double,
      keringTotal: fields[5] as double,
      keringSample: fields[6] as double,
      carbonValue: fields[7] as double,
      carbonAbsorb: fields[8] as double,
    );
  }

  @override
  void write(BinaryWriter writer, SubPlotAreaATumbuhanBawahModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.uuid)
      ..writeByte(1)
      ..write(obj.areaName)
      ..writeByte(2)
      ..write(obj.plotName)
      ..writeByte(3)
      ..write(obj.basahTotal)
      ..writeByte(4)
      ..write(obj.basahSample)
      ..writeByte(5)
      ..write(obj.keringTotal)
      ..writeByte(6)
      ..write(obj.keringSample)
      ..writeByte(7)
      ..write(obj.carbonValue)
      ..writeByte(8)
      ..write(obj.carbonAbsorb);
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
