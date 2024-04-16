const String tableSubPlotASemai = 'subplot_a_semai';

class SubPlotAreaASemaiFields {
  static final List<String> values = [
    id,
    areaName,
    plotName,
    basahTotal,
    basahSample,
    keringTotal,
    keringSample,
    carbonValue,
    carbonAbsorb,
  ];

  static const String id = '_id';
  static const String areaName = 'areaName';
  static const String plotName = 'plotName';
  static const String basahTotal = 'basahTotal';
  static const String basahSample = 'basahSample';
  static const String keringTotal = 'keringTotal';
  static const String keringSample = 'keringSample';
  static const String carbonValue = 'carbonValue';
  static const String carbonAbsorb = 'carbonAbsorb';
}

class SubPlotAreaASemaiModel {
  final int? id;
  final String areaName;
  final String plotName;
  final double basahTotal;
  final double basahSample;
  final double keringTotal;
  final double keringSample;
  final double carbonValue;
  final double carbonAbsorb;

  SubPlotAreaASemaiModel({
    this.id,
    required this.areaName,
    required this.plotName,
    required this.basahTotal,
    required this.basahSample,
    required this.keringTotal,
    required this.keringSample,
    required this.carbonValue,
    required this.carbonAbsorb,
  });

  SubPlotAreaASemaiModel copy({
    int? id,
    String? areaName,
    String? plotName,
    double? basahTotal,
    double? basahSample,
    double? keringTotal,
    double? keringSample,
    double? carbonValue,
    double? carbonAbsorb,
  }) =>
      SubPlotAreaASemaiModel(
        id: id ?? this.id,
        areaName: areaName ?? this.areaName,
        plotName: plotName ?? this.plotName,
        basahTotal: basahTotal ?? this.basahTotal,
        basahSample: basahSample ?? this.basahSample,
        keringTotal: keringTotal ?? this.keringTotal,
        keringSample: keringSample ?? this.keringSample,
        carbonValue: carbonValue ?? this.carbonValue,
        carbonAbsorb: carbonAbsorb ?? this.carbonAbsorb,
      );

  static SubPlotAreaASemaiModel fromJson(Map<String, Object?> json) =>
      SubPlotAreaASemaiModel(
        id: json['_id'] as int?,
        areaName: json['areaName'] as String,
        plotName: json['plotName'] as String,
        basahTotal: json['basahTotal'] as double,
        basahSample: json['basahSample'] as double,
        keringTotal: json['keringTotal'] as double,
        keringSample: json['keringSample'] as double,
        carbonValue: json['carbonValue'] as double,
        carbonAbsorb: json['carbonAbsorb'] as double,
      );

  Map<String, Object?> toJson() => {
        '_id': id,
        'areaName': areaName,
        'plotName': plotName,
        'basahTotal': basahTotal,
        'basahSample': basahSample,
        'keringTotal': keringTotal,
        'keringSample': keringSample,
        'carbonValue': carbonValue,
        'carbonAbsorb': carbonAbsorb,
      };

  @override
  String toString() {
    return '''
      SubPlotAreaASemaiModel(
        id: $id,
        areaName: $areaName,
        plotName: $plotName,
        basahTotal: $basahTotal,
        basahSample: $basahSample,
        keringTotal: $keringTotal,
        keringSample: $keringSample,
        carbonValue: $carbonValue,
        carbonAbsorb: $carbonAbsorb
      )
    ''';
  }
}

const String tableSubPlotASeresah = 'subplot_a_seresah';

class SubPlotAreaASeresahFields {
  static final List<String> values = [
    id,
    areaName,
    plotName,
    basahTotal,
    basahSample,
    keringTotal,
    keringSample,
    carbonValue,
    carbonAbsorb,
  ];

  static const String id = '_id';
  static const String areaName = 'areaName';
  static const String plotName = 'plotName';
  static const String basahTotal = 'basahTotal';
  static const String basahSample = 'basahSample';
  static const String keringTotal = 'keringTotal';
  static const String keringSample = 'keringSample';
  static const String carbonValue = 'carbonValue';
  static const String carbonAbsorb = 'carbonAbsorb';
}

class SubPlotAreaASeresahModel {
  final int? id;
  final String areaName;
  final String plotName;
  final double basahTotal;
  final double basahSample;
  final double keringTotal;
  final double keringSample;
  final double carbonValue;
  final double carbonAbsorb;

  SubPlotAreaASeresahModel({
    this.id,
    required this.areaName,
    required this.plotName,
    required this.basahTotal,
    required this.basahSample,
    required this.keringTotal,
    required this.keringSample,
    required this.carbonValue,
    required this.carbonAbsorb,
  });

  SubPlotAreaASeresahModel copy({
    int? id,
    String? areaName,
    String? plotName,
    double? basahTotal,
    double? basahSample,
    double? keringTotal,
    double? keringSample,
    double? carbonValue,
    double? carbonAbsorb,
  }) =>
      SubPlotAreaASeresahModel(
        id: id ?? this.id,
        areaName: areaName ?? this.areaName,
        plotName: plotName ?? this.plotName,
        basahTotal: basahTotal ?? this.basahTotal,
        basahSample: basahSample ?? this.basahSample,
        keringTotal: keringTotal ?? this.keringTotal,
        keringSample: keringSample ?? this.keringSample,
        carbonValue: carbonValue ?? this.carbonValue,
        carbonAbsorb: carbonAbsorb ?? this.carbonAbsorb,
      );

  static SubPlotAreaASeresahModel fromJson(Map<String, Object?> json) =>
      SubPlotAreaASeresahModel(
        id: json['_id'] as int?,
        areaName: json['areaName'] as String,
        plotName: json['plotName'] as String,
        basahTotal: json['basahTotal'] as double,
        basahSample: json['basahSample'] as double,
        keringTotal: json['keringTotal'] as double,
        keringSample: json['keringSample'] as double,
        carbonValue: json['carbonValue'] as double,
        carbonAbsorb: json['carbonAbsorb'] as double,
      );

  Map<String, Object?> toJson() => {
        '_id': id,
        'areaName': areaName,
        'plotName': plotName,
        'basahTotal': basahTotal,
        'basahSample': basahSample,
        'keringTotal': keringTotal,
        'keringSample': keringSample,
        'carbonValue': carbonValue,
        'carbonAbsorb': carbonAbsorb,
      };

  @override
  String toString() {
    return '''
      SubPlotAreaASeresahModel(
        id: $id,
        areaName: $areaName,
        plotName: $plotName,
        basahTotal: $basahTotal,
        basahSample: $basahSample,
        keringTotal: $keringTotal,
        keringSample: $keringSample,
        carbonValue: $carbonValue,
        carbonAbsorb: $carbonAbsorb
      )
    ''';
  }
}

const String tableSubPlotATumbuhanBawah = 'subplot_a_tumbuhan';

class SubPlotAreaATumbuhanBawahFields {
  static final List<String> values = [
    id,
    areaName,
    plotName,
    basahTotal,
    basahSample,
    keringTotal,
    keringSample,
    carbonValue,
    carbonAbsorb,
  ];

  static const String id = '_id';
  static const String areaName = 'areaName';
  static const String plotName = 'plotName';
  static const String basahTotal = 'basahTotal';
  static const String basahSample = 'basahSample';
  static const String keringTotal = 'keringTotal';
  static const String keringSample = 'keringSample';
  static const String carbonValue = 'carbonValue';
  static const String carbonAbsorb = 'carbonAbsorb';
}

class SubPlotAreaATumbuhanBawahModel {
  final int? id;
  final String areaName;
  final String plotName;
  final double basahTotal;
  final double basahSample;
  final double keringTotal;
  final double keringSample;
  final double carbonValue;
  final double carbonAbsorb;

  SubPlotAreaATumbuhanBawahModel({
    this.id,
    required this.areaName,
    required this.plotName,
    required this.basahTotal,
    required this.basahSample,
    required this.keringTotal,
    required this.keringSample,
    required this.carbonValue,
    required this.carbonAbsorb,
  });

  SubPlotAreaATumbuhanBawahModel copy({
    int? id,
    String? areaName,
    String? plotName,
    double? basahTotal,
    double? basahSample,
    double? keringTotal,
    double? keringSample,
    double? carbonValue,
    double? carbonAbsorb,
  }) =>
      SubPlotAreaATumbuhanBawahModel(
        id: id ?? this.id,
        areaName: areaName ?? this.areaName,
        plotName: plotName ?? this.plotName,
        basahTotal: basahTotal ?? this.basahTotal,
        basahSample: basahSample ?? this.basahSample,
        keringTotal: keringTotal ?? this.keringTotal,
        keringSample: keringSample ?? this.keringSample,
        carbonValue: carbonValue ?? this.carbonValue,
        carbonAbsorb: carbonAbsorb ?? this.carbonAbsorb,
      );

  static SubPlotAreaATumbuhanBawahModel fromJson(Map<String, Object?> json) =>
      SubPlotAreaATumbuhanBawahModel(
        id: json['_id'] as int?,
        areaName: json['areaName'] as String,
        plotName: json['plotName'] as String,
        basahTotal: json['basahTotal'] as double,
        basahSample: json['basahSample'] as double,
        keringTotal: json['keringTotal'] as double,
        keringSample: json['keringSample'] as double,
        carbonValue: json['carbonValue'] as double,
        carbonAbsorb: json['carbonAbsorb'] as double,
      );

  Map<String, Object?> toJson() => {
        '_id': id,
        'areaName': areaName,
        'plotName': plotName,
        'basahTotal': basahTotal,
        'basahSample': basahSample,
        'keringTotal': keringTotal,
        'keringSample': keringSample,
        'carbonValue': carbonValue,
        'carbonAbsorb': carbonAbsorb,
      };

  @override
  String toString() {
    return '''
      SubPlotAreaASeresahModel(
        id: $id,
        areaName: $areaName,
        plotName: $plotName,
        basahTotal: $basahTotal,
        basahSample: $basahSample,
        keringTotal: $keringTotal,
        keringSample: $keringSample,
        carbonValue: $carbonValue,
        carbonAbsorb: $carbonAbsorb
      )
    ''';
  }
}

