import 'package:hive/hive.dart';

part 'sub_plot_d_model.g.dart';

@HiveType(typeId: 8)
class SubPlotAreaDModel extends HiveObject {
  @HiveField(0)
  final String? uuid;
  @HiveField(1)
  final String plotId;
  @HiveField(2)
  final String areaName;
  @HiveField(3)
  final String plotName;
  @HiveField(4)
  final List<dynamic>? subPlotDModels;
  @HiveField(5)
  final DateTime updatedAt;

  SubPlotAreaDModel({
    this.uuid,
    required this.plotId,
    required this.areaName,
    required this.plotName,
    this.subPlotDModels,
    required this.updatedAt,
  });

  @override
  String toString() {
    return '''
      areaName: $areaName,
      plotName: $plotName,
      plotId: $plotId,
      subPlotDList: $subPlotDModels,
      updateAt: $updatedAt
    ''';
  }
}

@HiveType(typeId: 9)
class SubPlotAreaDPohonModel extends HiveObject {
  @HiveField(0)
  final String? uuid;
  @HiveField(1)
  final String plotId;
  @HiveField(2)
  final String areaName;
  @HiveField(3)
  final String plotName;
  @HiveField(4)
  final String localName;
  @HiveField(5)
  final String bioName;
  @HiveField(6)
  final double keliling;
  @HiveField(7)
  final double diameter;
  @HiveField(8)
  final double kerapatanKayu;
  @HiveField(9)
  final double biomassLand;
  @HiveField(10)
  final double carbonValue;
  @HiveField(11)
  final double carbonAbsorb;
  @HiveField(12)
  final DateTime updatedAt;

  SubPlotAreaDPohonModel({
    this.uuid,
    required this.plotId,
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
    required this.updatedAt,
  });

  @override
  String toString() {
    return '''
        plotId: $plotId,
        'areaName': $areaName,
        'plotName': $plotName,
        'localName': $localName,
        'bioName': $bioName,
        'keliling': $keliling,
        'diameter': $diameter,
        'kerapatanKayu': $kerapatanKayu,
        'biomassLand': $biomassLand,
        'carbonValue': $carbonValue,
        'carbonAbsorb': $carbonAbsorb,
        'updateAt': $updatedAt
        ''';
  }
}

@HiveType(typeId: 10)
class SubPlotAreaDNekromasModel extends HiveObject {
  @HiveField(0)
  final String? uuid;
  @HiveField(1)
  final String plotId;
  @HiveField(2)
  final String areaName;
  @HiveField(3)
  final String plotName;
  @HiveField(4)
  final double diameterPangkal;
  @HiveField(5)
  final double diameterUjung;
  @HiveField(6)
  final double panjang;
  @HiveField(7)
  final double volume;
  @HiveField(8)
  final double biomassLand;
  @HiveField(9)
  final double carbonValue;
  @HiveField(10)
  final double carbonAbsorb;
  @HiveField(11)
  final DateTime updatedAt;

  SubPlotAreaDNekromasModel({
    this.uuid,
    required this.plotId,
    required this.areaName,
    required this.plotName,
    required this.diameterPangkal,
    required this.diameterUjung,
    required this.panjang,
    required this.volume,
    required this.biomassLand,
    required this.carbonValue,
    required this.carbonAbsorb,
    required this.updatedAt,
  });

  @override
  String toString() {
    return '''
      plotId: $plotId,
      'diameterPangkal': $diameterPangkal,
      'diameterUjung': $diameterUjung,
      'panjang': $panjang,
      'volume': $volume,
      'biomassLand': $biomassLand,
      'carbonValue': $carbonValue,
      'carbonAbsorb': $carbonAbsorb,
      'updateAt': $updatedAt
    ''';
  }
}

@HiveType(typeId: 11)
class SubPlotAreaDTanahModel extends HiveObject {
  @HiveField(0)
  final String? uuid;
  @HiveField(1)
  final String plotId;
  @HiveField(2)
  final String areaName;
  @HiveField(3)
  final String plotName;
  @HiveField(4)
  final double kedalamanSample;
  @HiveField(5)
  final double beratJenisTanah;
  @HiveField(6)
  final double organicTanah;
  @HiveField(7)
  final double carbonGrCm;
  @HiveField(8)
  final double carbonTonHa;
  @HiveField(9)
  final double carbonTon;
  @HiveField(10)
  final double carbonAbsorb;
  @HiveField(11)
  final DateTime updatedAt;

  SubPlotAreaDTanahModel({
    this.uuid,
    required this.plotId,
    required this.areaName,
    required this.plotName,
    required this.kedalamanSample,
    required this.beratJenisTanah,
    required this.organicTanah,
    required this.carbonGrCm,
    required this.carbonTonHa,
    required this.carbonTon,
    required this.carbonAbsorb,
    required this.updatedAt,
  });

  @override
  String toString() {
    return '''
      'plotId': $plotId,
      'kedalamanSample': $kedalamanSample,
      'beratJenisTanah': $beratJenisTanah,
      'organicTanah': $organicTanah,
      'carbonGrCm': $carbonGrCm,
      'carbonTonHa': $carbonTonHa,
      'carbonTon': $carbonTon,
      'carbonAbsorb': $carbonAbsorb,
      'updateAt': $updatedAt
    ''';
  }
}
