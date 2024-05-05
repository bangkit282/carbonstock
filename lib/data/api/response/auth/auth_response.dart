// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';

Login loginFromJson(String str) {
  final jsonData = json.decode(str);
  return Login.fromJson(jsonData);
}

String loginToJson(Login data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class Login {
  bool status;
  String message;
  Data data;

  Login({
    required this.status,
    required this.message,
    required this.data,
  });

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        status: json['status'],
        message: json['message'],
        data: Data.fromJson(json['data']),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data.toJson(),
      };

  @override
  String toString() {
    return 'Login{status: $status, message: $message, data: $data}';
  }
}

class Data {
  String id;
  String nama;
  String tempatLahir;
  String tanggalLahir;
  String telepon;
  String jenisKelamin;
  String email;
  String password;
  String createdAt;
  String updatedAt;
  String? deletedAt;
  int isActive;
  dynamic role;
  List<ListTim> listTim;
  List<Listplot> listplot;

  Data({
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
    required this.listTim,
    required this.listplot,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json['id'],
        nama: json['nama'],
        tempatLahir: json['tempat_lahir'],
        tanggalLahir: json['tanggal_lahir'],
        telepon: json['telepon'],
        jenisKelamin: json['jenis_kelamin'],
        email: json['email'],
        password: json['password'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
        deletedAt: json['deleted_at'] ?? '',
        isActive: json['is_active'],
        role: json['role'],
        listTim: List<ListTim>.from(
            json["list_tim"].map((x) => ListTim.fromJson(x))),
        listplot: List<Listplot>.from(
            json['listplot'].map((x) => Listplot.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'nama': nama,
        'tempat_lahir': tempatLahir,
        'tanggal_lahir': tanggalLahir,
        'telepon': telepon,
        'jenis_kelamin': jenisKelamin,
        'email': email,
        'password': password,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'deleted_at': deletedAt ?? '',
        'is_active': isActive,
        'role': role,
        "list_tim": List<dynamic>.from(listTim.map((x) => x.toJson())),
        'listplot': List<dynamic>.from(listplot.map((x) => x.toJson())),
      };

  @override
  String toString() {
    return '''
      Data{
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
        listTim: $listTim,
        listplot: $listplot
    }''';
  }
}

class ListTim {
  int id;
  String nama;
  String createdAt;
  String updatedAt;
  dynamic deletedAt;

  ListTim({
    required this.id,
    required this.nama,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory ListTim.fromJson(Map<String, dynamic> json) => ListTim(
        id: json['id'],
        nama: json['nama'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
        deletedAt: json['deleted_at'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'nama': nama,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'deleted_at': deletedAt,
      };
}

class Listplot {
  int id;
  String namaPlot;
  int typePlot;
  String? latitude;
  String? longitude;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  int idHamparan;

  Listplot({
    required this.id,
    required this.namaPlot,
    required this.typePlot,
    required this.latitude,
    required this.longitude,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.idHamparan,
  });

  factory Listplot.fromJson(Map<String, dynamic> json) => Listplot(
        id: json['id'],
        namaPlot: json['nama_plot'] ,
        typePlot: json['type_plot'],
        latitude: json['latitude'] ?? '-6.859973002',
        longitude: json['longitude'] ?? '107.62911',
        createdAt: json['created_at'] ?? '',
        updatedAt: json['updated_at'] ?? '',
        deletedAt: json['deleted_at'] ?? '',
        idHamparan: json['id_hamparan'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'nama_plot': namaPlot,
        'type_plot': typePlot,
        'latitude': latitude ?? '-6.859973002',
        'longitude': longitude ?? '107.62911',
        'created_at': createdAt ?? '',
        'updated_at': updatedAt ?? '',
        'deleted_at': deletedAt ?? '',
        'id_hamparan': idHamparan,
      };

  @override
  String toString() {
    return '''
    ListPlot{
      id: $id
      idHamparan: $idHamparan
      namaPlot: $namaPlot
      typePlot: $typePlot
      latitude: $latitude
      longitude: $longitude
      createdAt: $createdAt
      updatedAt: $updatedAt
      deletedAt: $deletedAt
      }
    ''';
  }
}
