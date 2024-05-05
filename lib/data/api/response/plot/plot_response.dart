// To parse this JSON data, do
//
//     final plot = plotFromJson(jsonString);

import 'dart:convert';

Plot plotFromJson(String str) {
  final jsonData = json.decode(str);
  return Plot.fromJson(jsonData);
}

String plotToJson(Plot data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class Plot {
  bool? status;
  String? message;
  List<Datum>? data;

  Plot({
    this.status,
    this.message,
    this.data,
  });

  factory Plot.fromJson(Map<String, dynamic> json) => Plot(
        status: json['status'],
        message: json['message'],
        data: List<Datum>.from(json['data'].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': List<dynamic>.from(data!.map((x) => x.toJson())),
      };

  @override
  String toString() {
    return 'Plot{status: $status, message: $message, data: $data}';
  }
}

class Datum {
  int id;
  String namaPlot;
  int typePlot;
  String? latitude;
  String? longitude;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  int idHamparan;
  PlotClass plot;

  Datum({
    required this.id,
    required this.namaPlot,
    required this.typePlot,
    required this.latitude,
    required this.longitude,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.idHamparan,
    required this.plot,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'],
        namaPlot: json['nama_plot'],
        typePlot: json['type_plot'],
        latitude: json['latitude'] ?? '-6.973002',
        longitude: json['longitude'] ?? '107.62911',
        createdAt: json['created_at'] ?? '',
        updatedAt: json['updated_at'] ?? '',
        deletedAt: json['deleted_at'] ?? '',
        idHamparan: json['id_hamparan'],
        plot: PlotClass.fromJson(json['plot']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'nama_plot': namaPlot,
        'type_plot': typePlot,
        'latitude': latitude ?? '-6.973002',
        'longitude': longitude ?? '107.62911',
        'created_at': createdAt ?? '',
        'updated_at': updatedAt ?? '',
        'deleted_at': deletedAt ?? '',
        'id_hamparan': idHamparan,
        'plot': plot.toJson(),
      };

  @override
  String toString() {
    return '''Datum{
      id: $id, 
      namaPlot: $namaPlot, 
      typePlot: $typePlot, 
      latitude: $latitude, 
      longitude: $longitude, 
      createdAt: $createdAt, 
      updatedAt: $updatedAt, 
      deletedAt: $deletedAt, 
      idHamparan: $idHamparan, 
      plot: $plot
    }''';
  }
}

class PlotClass {
  int id;
  String namaPlot;
  String ukuranPlot;

  PlotClass({
    required this.id,
    required this.namaPlot,
    required this.ukuranPlot,
  });

  factory PlotClass.fromJson(Map<String, dynamic> json) => PlotClass(
        id: json['id'],
        namaPlot: json['nama_plot'],
        ukuranPlot: json['ukuran_plot'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'nama_plot': namaPlot,
        'ukuran_plot': ukuranPlot,
      };

  @override
  String toString() {
    return '''PlotClass{
      id: $id, 
      namaPlot: $namaPlot, 
      ukuranPlot: $ukuranPlot
    }''';
  }
}
