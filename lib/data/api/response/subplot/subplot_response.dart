// To parse this JSON data, do
//
//     final subPlot = subPlotFromJson(jsonString);

import 'dart:convert';

SubPlot subPlotFromJson(String str) {
  final jsonData = json.decode(str);
  return SubPlot.fromJson(jsonData);
}

String subPlotToJson(SubPlot data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class SubPlot {
  bool status;
  String message;
  List<dynamic> data;

  SubPlot({
    required this.status,
    required this.message,
    required this.data,
  });

  factory SubPlot.fromJson(Map<String, dynamic> json) => SubPlot(
        status: json['status'],
        message: json['message'],
        data: List<dynamic>.from(json['data'].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': List<dynamic>.from(data.map((x) => x)),
      };

  @override
  String toString() =>
      'SubPlot{status: $status, message: $message, data: $data}';
}
