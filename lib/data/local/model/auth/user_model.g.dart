// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final int typeId = 12;

  @override
  UserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModel(
      id: fields[0] as String?,
      nama: fields[1] as String?,
      tempatLahir: fields[2] as String?,
      tanggalLahir: fields[3] as String?,
      telepon: fields[4] as String?,
      jenisKelamin: fields[5] as String?,
      email: fields[6] as String?,
      password: fields[7] as String?,
      createdAt: fields[8] as String?,
      updatedAt: fields[9] as String?,
      deletedAt: fields[10] as String?,
      isActive: fields[11] as int?,
      role: fields[12] as String?,
      token: fields[13] as String?,
      listplot: (fields[14] as List).cast<ListPlotModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.nama)
      ..writeByte(2)
      ..write(obj.tempatLahir)
      ..writeByte(3)
      ..write(obj.tanggalLahir)
      ..writeByte(4)
      ..write(obj.telepon)
      ..writeByte(5)
      ..write(obj.jenisKelamin)
      ..writeByte(6)
      ..write(obj.email)
      ..writeByte(7)
      ..write(obj.password)
      ..writeByte(8)
      ..write(obj.createdAt)
      ..writeByte(9)
      ..write(obj.updatedAt)
      ..writeByte(10)
      ..write(obj.deletedAt)
      ..writeByte(11)
      ..write(obj.isActive)
      ..writeByte(12)
      ..write(obj.role)
      ..writeByte(13)
      ..write(obj.token)
      ..writeByte(14)
      ..write(obj.listplot);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ListPlotModelAdapter extends TypeAdapter<ListPlotModel> {
  @override
  final int typeId = 13;

  @override
  ListPlotModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ListPlotModel(
      id: fields[0] as int,
      idHamparan: fields[1] as int,
      namaPlot: fields[2] as String,
      typePlot: fields[3] as int,
      latitude: fields[4] as String?,
      longitude: fields[5] as String?,
      createdAt: fields[6] as String?,
      updatedAt: fields[7] as String?,
      deletedAt: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ListPlotModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.idHamparan)
      ..writeByte(2)
      ..write(obj.namaPlot)
      ..writeByte(3)
      ..write(obj.typePlot)
      ..writeByte(4)
      ..write(obj.latitude)
      ..writeByte(5)
      ..write(obj.longitude)
      ..writeByte(6)
      ..write(obj.createdAt)
      ..writeByte(7)
      ..write(obj.updatedAt)
      ..writeByte(8)
      ..write(obj.deletedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ListPlotModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
