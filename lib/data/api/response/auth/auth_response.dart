// To parse this JSON data, do
// final login = loginFromJson(jsonString);

import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));
String loginToJson(Login data) => json.encode(data.toJson());

class Login {
    bool status;
    String message;
    dynamic data;

    Login({
        required this.status,
        required this.message,
        required this.data,
    });

    factory Login.fromJson(Map<String, dynamic> json) => Login(
        status: json['status'],
        message: json['message'],
        data: json['data'],
    );

    Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data.toJson(),
    };
}

class Data {
    String id;
    String nama;
    String tempatLahir;
    DateTime tanggalLahir;
    String telepon;
    String jenisKelamin;
    String email;
    String password;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic deletedAt;
    int isActive;
    dynamic role;

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
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json['id'],
        nama: json['nama'],
        tempatLahir: json['tempat_lahir'],
        tanggalLahir: DateTime.parse(json['tanggal_lahir']),
        telepon: json['telepon'],
        jenisKelamin: json['jenis_kelamin'],
        email: json['email'],
        password: json['password'],
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']),
        deletedAt: json['deleted_at'],
        isActive: json['is_active'],
        role: json['role'],
    );

    Map<String, dynamic> toJson() => {
        'id': id,
        'nama': nama,
        'tempat_lahir': tempatLahir,
        'tanggal_lahir': '${tanggalLahir.year.toString().padLeft(4, '0')}-${tanggalLahir.month.toString().padLeft(2, '0')}-${tanggalLahir.day.toString().padLeft(2, '0')}',
        'telepon': telepon,
        'jenis_kelamin': jenisKelamin,
        'email': email,
        'password': password,
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
        'deleted_at': deletedAt,
        'is_active': isActive,
        'role': role,
    };
}
