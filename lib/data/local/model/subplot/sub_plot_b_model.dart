const String tableSubPlotB = 'sub_plot_b';

class SubPlotAreaBModel {
  final int? id;
  final String areaName;
  final String plotName;
  final String localName;
  final String bioName;
  final double areaSize;
  final double diameter;
  final double kerapatanKayu;

  SubPlotAreaBModel({
    this.id,
    required this.areaName,
    required this.plotName,
    required this.localName,
    required this.bioName,
    required this.areaSize,
    required this.diameter,
    required this.kerapatanKayu,
  });

  SubPlotAreaBModel copy({
    int? id,
    String? areaName,
    String? plotName,
    String? localName,
    String? bioName,
    double? areaSize,
    double? diameter,
    double? kerapatanKayu,
  }) =>
      SubPlotAreaBModel(
        id: id ?? this.id,
        areaName: areaName ?? this.areaName,
        plotName: plotName ?? this.plotName,
        localName: localName ?? this.localName,
        bioName: bioName ?? this.bioName,
        areaSize: areaSize ?? this.areaSize,
        diameter: diameter ?? this.diameter,
        kerapatanKayu: kerapatanKayu ?? this.kerapatanKayu,
      );

  static SubPlotAreaBModel fromJson(Map<String, Object?> json) =>
      SubPlotAreaBModel(
        id: json['id'] as int?,
        areaName: json['areaName'] as String,
        plotName: json['plotName'] as String,
        localName: json['localName'] as String,
        bioName: json['bioName'] as String,
        areaSize: json['areaSize'] as double,
        diameter: json['diameter'] as double,
        kerapatanKayu: json['kerapatanKayu'] as double,
      );

  Map<String, Object?> toJson() => {
        'id': id,
        'areaName': areaName,
        'plotName': plotName,
        'localName': localName,
        'bioName': bioName,
        'areaSize': areaSize,
        'diameter': diameter,
        'kerapatanKayu': kerapatanKayu,
      };
}
