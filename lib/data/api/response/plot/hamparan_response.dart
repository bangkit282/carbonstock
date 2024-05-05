// To parse this JSON data, do
//
//     final hamparan = hamparanFromJson(jsonString);

import 'dart:convert';

Hamparan hamparanFromJson(String str) {
  final jsonData = json.decode(str);
  return Hamparan.fromJson(jsonData);
}

String hamparanToJson(Hamparan data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class Hamparan {
  bool? status;
  String? message;
  List<HamparanDatum>? data;

  Hamparan({
    this.status,
    this.message,
    this.data,
  });

  factory Hamparan.fromJson(Map<String, dynamic> json) => Hamparan(
        status: json['status'],
        message: json['message'],
        data: List<HamparanDatum>.from(
          json['data'].map((x) => HamparanDatum.fromJson(x)),
        ),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': List<dynamic>.from(data!.map((x) => x.toJson())),
      };

  @override
  String toString() {
    return '''Hamparan{
      status: $status, 
      message: $message, 
      data: $data
    }''';
  }
}

class HamparanDatum {
  int id;
  String namaHamparan;
  int idZona;
  String? latitude;
  String? longitude;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  Zona zona;

  HamparanDatum({
    required this.id,
    required this.namaHamparan,
    required this.idZona,
    required this.latitude,
    required this.longitude,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.zona,
  });

  factory HamparanDatum.fromJson(Map<String, dynamic> json) => HamparanDatum(
        id: json['id'],
        namaHamparan: json['nama_hamparan'],
        idZona: json['id_zona'],
        latitude: json['latitude'] ?? '-6.973002',
        longitude: json['longitude'] ?? '107.62911',
        createdAt: json['created_at'] ?? '',
        updatedAt: json['updated_at'] ?? '',
        deletedAt: json['deleted_at'] ?? '',
        zona: Zona.fromJson(json['zona']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'nama_hamparan': namaHamparan,
        'id_zona': idZona,
        'latitude': latitude,
        'longitude': longitude,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'deleted_at': deletedAt,
        'zona': zona.toJson(),
      };

  @override
  String toString() {
    return '''HamparanDatum{'
          id: $id,
          namaHamparan: $namaHamparan,
          idZona: $idZona,
          latitude: $latitude,
          longitude: $longitude,
          createdAt: $createdAt,
          updatedAt: $updatedAt,
          deletedAt: $deletedAt,
          zona: $zona'
        }''';
  }
}

class Zona {
  int id;
  String namaZona;
  int jenisHutan;
  String latitude;
  String longitude;
  String createdAt;
  String updatedAt;
  dynamic deletedAt;
  int idRegional;

  Zona({
    required this.id,
    required this.namaZona,
    required this.jenisHutan,
    required this.latitude,
    required this.longitude,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.idRegional,
  });

  factory Zona.fromJson(Map<String, dynamic> json) => Zona(
        id: json['id'],
        namaZona: json['nama_zona'],
        jenisHutan: json['jenis_hutan'] ?? 0,
        latitude: json['latitude'] ?? '-6.973002',
        longitude: json['longitude'] ?? '107.62911',
        createdAt: json['created_at'] ?? '',
        updatedAt: json['updated_at'] ?? '',
        deletedAt: json['deleted_at'] ?? '',
        idRegional: json['id_regional'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'nama_zona': namaZona,
        'jenis_hutan': jenisHutan,
        'latitude': latitude,
        'longitude': longitude,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'deleted_at': deletedAt,
        'id_regional': idRegional,
      };

  @override
  String toString() {
    return '''
    Zona{
      id: $id, 
      namaZona: $namaZona, 
      jenisHutan: $jenisHutan, 
      latitude: $latitude,
      longitude: $longitude, 
      createdAt: $createdAt,
      updatedAt: $updatedAt,
      deletedAt: $deletedAt,
      idRegional: $idRegional
    }
    ''';
  }
}
