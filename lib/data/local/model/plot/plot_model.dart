import 'package:hive/hive.dart';

part 'plot_model.g.dart';

@HiveType(typeId: 1)
class PlotModel extends HiveObject {
  @HiveField(0)
  final String? plotId;
  @HiveField(1)
  final double plotLat;
  @HiveField(2)
  final double plotLng;
  @HiveField(3)
  final double plotSize;
  @HiveField(4)
  final double biomassAvg;
  @HiveField(5)
  final double biomassStd;

  PlotModel(
    {this.plotId, 
    required this.plotLat,
    required this.plotLng,
    required this.plotSize,
    required this.biomassAvg,
    required this.biomassStd,
  });

  @override
  String toString() {
    return '''
      'plotLat': $plotLat,
      'plotLng': $plotLng,
      'plotSize': $plotSize,
      'biomassAvg': $biomassAvg,
      'biomassStd': $biomassStd
    ''';
  }
}

// const String tablePlot = 'plot';

// class PlotFields {
//   static final List<String> values = [
//     id,
//     plotLat,
//     plotLng,
//     plotSize,
//     biomassAvg,
//     biomassStd,
//   ];

//   static const String id = '_id';
//   static const String plotLat = 'plotLat';
//   static const String plotLng = 'plotLng';
//   static const String plotSize = 'plotSize';
//   static const String biomassAvg = 'biomassAvg';
//   static const String biomassStd = 'biomassStd';
// }

// class PlotModel {
//   final int? id;
//   final double plotLat;
//   final double plotLng;
//   final double plotSize;
//   final double biomassAvg;
//   final double biomassStd;

//   PlotModel({
//     this.id,
//     required this.plotLat,
//     required this.plotLng,
//     required this.plotSize,
//     required this.biomassAvg,
//     required this.biomassStd,
//   });

//   PlotModel copy({
//     int? id,
//     double? plotLat,
//     double? plotLng,
//     double? plotSize,
//     double? biomassAvg,
//     double? biomassStd,
//   }) =>
//       PlotModel(
//         id: id ?? this.id,
//         plotLat: plotLat ?? this.plotLat,
//         plotLng: plotLng ?? this.plotLng,
//         plotSize: plotSize ?? this.plotSize,
//         biomassAvg: biomassAvg ?? this.biomassAvg,
//         biomassStd: biomassStd ?? this.biomassStd,
//       );

//   static PlotModel fromJson(Map<String, Object?> json) => PlotModel(
//         id: json['id'] as int?,
//         plotLat: json['plotLat'] as double,
//         plotLng: json['plotLng'] as double,
//         plotSize: json['plotSize'] as double,
//         biomassAvg: json['biomassAvg'] as double,
//         biomassStd: json['biomassStd'] as double,
//       );

//   Map<String, Object?> toJson() => {
//         'id': id,
//         'plotLat': plotLat,
//         'plotLng': plotLng,
//         'plotSize': plotSize,
//         'biomassAvg': biomassAvg,
//         'biomassStd': biomassStd,
//       };

//   @override
//   String toString() {
//     return 'PlotModel(id: $id, plotLat: $plotLat, plotLng: $plotLng, plotSize: $plotSize, biomassAvg: $biomassAvg, biomassStd: $biomassStd)';
//   }
// }
