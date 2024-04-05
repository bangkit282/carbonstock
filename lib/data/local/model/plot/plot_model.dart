const String tablePlot = 'plot';

class PlotFields {
  static final List<String> values = [
    id,
    plotLat,
    plotLng,
    plotSize,
    biomassAvg,
    biomassStd,
  ];

  static const String id = '_id';
  static const String plotLat = 'plotLat';
  static const String plotLng = 'plotLng';
  static const String plotSize = 'plotSize';
  static const String biomassAvg = 'biomassAvg';
  static const String biomassStd = 'biomassStd';
}

class PlotModel {
  final int? id;
  final double plotLat;
  final double plotLng;
  final String plotSize;
  final double biomassAvg;
  final double biomassStd;

  PlotModel({
    this.id,
    required this.plotLat,
    required this.plotLng,
    required this.plotSize,
    required this.biomassAvg,
    required this.biomassStd,
  });

  PlotModel copy({
    int? id,
    double? plotLat,
    double? plotLng,
    String? plotSize,
    double? biomassAvg,
    double? biomassStd,
  }) =>
      PlotModel(
        id: id ?? this.id,
        plotLat: plotLat ?? this.plotLat,
        plotLng: plotLng ?? this.plotLng,
        plotSize: plotSize ?? '',
        biomassAvg: biomassAvg ?? this.biomassAvg,
        biomassStd: biomassStd ?? this.biomassStd,
      );

  static PlotModel fromJson(Map<String, Object?> json) => PlotModel(
        id: json['id'] as int?,
        plotLat: json['plotLat'] as double,
        plotLng: json['plotLng'] as double,
        plotSize: json['plotSize'] as String,
        biomassAvg: json['biomassAvg'] as double,
        biomassStd: json['biomassStd'] as double,
      );

  Map<String, Object?> toJson() => {
        'id': id,
        'plotLat': plotLat,
        'plotLng': plotLng,
        'plotSize': plotSize,
        'biomassAvg': biomassAvg,
        'biomassStd': biomassStd,
      };

  @override
  String toString() {
    return 'PlotModel(id: $id, plotLat: $plotLat, plotLng: $plotLng, plotSize: $plotSize, biomassAvg: $biomassAvg, biomassStd: $biomassStd)';
  }
}
