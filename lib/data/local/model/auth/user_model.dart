import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 12)
class UserModel extends HiveObject {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? nama;
  @HiveField(2)
  String? tempatLahir;
  @HiveField(3)
  String? tanggalLahir;
  @HiveField(4)
  String? telepon;
  @HiveField(5)
  String? jenisKelamin;
  @HiveField(6)
  String? email;
  @HiveField(7)
  String? password;
  @HiveField(8)
  String? createdAt;
  @HiveField(9)
  String? updatedAt;
  @HiveField(10)
  String? deletedAt;
  @HiveField(11)
  int? isActive;
  @HiveField(12)
  String? role;
  @HiveField(13)
  List<ListPlotModel> listplot;

  UserModel({
    required this.id,
    required this.nama,
    required this.tempatLahir,
    required this.tanggalLahir,
    required this.telepon,
    required this.jenisKelamin,
    required this.email,
    required this.password,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.isActive,
    required this.role,
    required this.listplot,
  });

  @override
  String toString() {
    return '''
      UserModel{
        id: $id, 
        nama: $nama, 
        tempatLahir: $tempatLahir, 
        tanggalLahir: $tanggalLahir, 
        telepon: $telepon, 
        jenisKelamin: $jenisKelamin, 
        email: $email, 
        password: $password, 
        createdAt: $createdAt, 
        updatedAt: $updatedAt, 
        deletedAt: $deletedAt, 
        isActive: $isActive, 
        role: $role,
        listplot: $listplot
    }''';
  }
}

@HiveType(typeId: 13)
class ListPlotModel extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  int idHamparan;
  @HiveField(2)
  String namaPlot;
  @HiveField(3)
  int typePlot;
  @HiveField(4)
  String? latitude;
  @HiveField(5)
  String? longitude;
  @HiveField(6)
  String? createdAt;
  @HiveField(7)
  String? updatedAt;
  @HiveField(8)
  String? deletedAt;

  ListPlotModel({
    required this.id,
    required this.idHamparan,
    required this.namaPlot,
    required this.typePlot,
    required this.latitude,
    required this.longitude,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  @override
  String toString() {
    return '''
      id: $id
      idHamparan: $idHamparan
      namaPlot: $namaPlot
      typePlot: $typePlot
      latitude: $latitude
      longitude: $longitude
      createdAt: $createdAt
      updatedAt: $updatedAt
      deletedAt: $deletedAt
    ''';
  }
}
