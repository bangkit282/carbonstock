const String tableSubPlotB = 'subplot_b';

class SubPlotAreaBFields {
  static final List<String> values = [
    id,
    areaName,
    plotName,
    keliling,
    diameter,
    localName,
    bioName,
    kerapatanKayu,
    biomassLand,
    carbonValue,
    carbonAbsorb
  ];

  static const String id = '_id';
  static const String areaName = 'areaName';
  static const String plotName = 'plotName';
  static const String keliling = 'keliling';
  static const String diameter = 'diameter';
  static const String localName = 'localName';
  static const String bioName = 'bioName';
  static const String kerapatanKayu = 'kerapatanKayu';
  static const String biomassLand = 'biomassLand';
  static const String carbonValue = 'carbonValue';
  static const String carbonAbsorb = 'carbonAbsorb';
}

class SubPlotAreaBModel {
  final int? id;
  final String areaName;
  final String plotName;
  final String localName;
  final String bioName;
  final double keliling;
  final double diameter;
  final double kerapatanKayu;
  final double biomassLand;
  final double carbonValue;
  final double carbonAbsorb;

  SubPlotAreaBModel({
    this.id,
    required this.areaName,
    required this.plotName,
    required this.localName,
    required this.bioName,
    required this.keliling,
    required this.diameter,
    required this.kerapatanKayu,
    required this.biomassLand,
    required this.carbonValue,
    required this.carbonAbsorb,
  });

  SubPlotAreaBModel copy({
    int? id,
    String? areaName,
    String? plotName,
    String? localName,
    String? bioName,
    double? keliling,
    double? diameter,
    double? kerapatanKayu,
    double? biomassLand,
    double? carbonValue,
    double? carbonAbsorb,
  }) =>
      SubPlotAreaBModel(
        id: id ?? this.id,
        areaName: areaName ?? this.areaName,
        plotName: plotName ?? this.plotName,
        localName: localName ?? this.localName,
        bioName: bioName ?? this.bioName,
        keliling: keliling ?? this.keliling,
        diameter: diameter ?? this.diameter,
        kerapatanKayu: kerapatanKayu ?? this.kerapatanKayu,
        biomassLand: biomassLand ?? this.biomassLand,
        carbonValue: carbonValue ?? this.carbonValue,
        carbonAbsorb: carbonAbsorb ?? this.carbonAbsorb,
      );

  static SubPlotAreaBModel fromJson(Map<String, Object?> json) =>
      SubPlotAreaBModel(
        id: json['id'] as int?,
        areaName: json['areaName'] as String,
        plotName: json['plotName'] as String,
        localName: json['localName'] as String,
        bioName: json['bioName'] as String,
        keliling: json['keliling'] as double,
        diameter: json['diameter'] as double,
        kerapatanKayu: json['kerapatanKayu'] as double,
        biomassLand: json['biomassLand'] as double,
        carbonValue: json['carbonValue'] as double,
        carbonAbsorb: json['carbonAbsorb'] as double,
      );

  Map<String, Object?> toJson() => {
        'id': id,
        'areaName': areaName,
        'plotName': plotName,
        'localName': localName,
        'bioName': bioName,
        'keliling': keliling,
        'diameter': diameter,
        'kerapatanKayu': kerapatanKayu,
        'biomassLand': biomassLand,
        'carbonValue': carbonValue,
        'carbonAbsorb': carbonAbsorb,
      };
}
