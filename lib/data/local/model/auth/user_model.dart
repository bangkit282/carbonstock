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
  DateTime? tanggalLahir;
  @HiveField(4)
  String? telepon;
  @HiveField(5)
  String? jenisKelamin;
  @HiveField(6)
  String? email;
  @HiveField(7)
  String? password;
  @HiveField(8)
  DateTime? createdAt;
  @HiveField(9)
  DateTime? updatedAt;
  @HiveField(10)
  DateTime? deletedAt;
  @HiveField(11)
  int? isActive;
  @HiveField(12)
  String? role;

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
    this.role,
  });

  @override
  String toString() {
    return '''
      id: $id, 
      nama: $nama, 
      tempatLahir: $tempatLahir, 
      tanggalLahir: $tanggalLahir, 
      telepon: $telepon, 
      jenisKelamin: $jenisKelamin, 
      UserModel{
      email: $email, 
      password: $password, 
      createdAt: $createdAt, 
      updatedAt: $updatedAt, 
      deletedAt: $deletedAt, 
      isActive: $isActive, 
      role: $role
    }''';
  }
}
