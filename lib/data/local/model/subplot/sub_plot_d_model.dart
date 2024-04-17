import 'package:hive/hive.dart';

part 'sub_plot_d_model.g.dart';

@HiveType(typeId: 8)
class SubPlotAreaDPohonModel extends HiveObject {
  @HiveField(0)
  final String? uuid;
  @HiveField(1)
  final String areaName;
  @HiveField(2)
  final String plotName;
  @HiveField(3)
  final String localName;
  @HiveField(4)
  final String bioName;
  @HiveField(5)
  final double keliling;
  @HiveField(6)
  final double diameter;
  @HiveField(7)
  final double kerapatanKayu;
  @HiveField(8)
  final double biomassLand;
  @HiveField(9)
  final double carbonValue;
  @HiveField(10)
  final double carbonAbsorb;

  SubPlotAreaDPohonModel({
    required this.uuid,
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

  @override
  String toString() {
    return '''
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
          ''';
  }
}

@HiveType(typeId: 9)
class SubPlotAreaDNekromasModel extends HiveObject {
  @HiveField(0)
  final String? uuid;
  @HiveField(1)
  final String areaName;
  @HiveField(2)
  final String plotName;
  @HiveField(3)
  final double diameterPangkal;
  @HiveField(4)
  final double diameterUjung;
  @HiveField(5)
  final double panjang;
  @HiveField(6)
  final double volume;
  @HiveField(7)
  final double biomassLand;
  @HiveField(8)
  final double carbonValue;
  @HiveField(9)
  final double carbonAbsorb;

  SubPlotAreaDNekromasModel({
    required this.uuid,
    required this.areaName,
    required this.plotName,
    required this.diameterPangkal,
    required this.diameterUjung,
    required this.panjang,
    required this.volume,
    required this.biomassLand,
    required this.carbonValue,
    required this.carbonAbsorb,
  });

  @override
  String toString() {
    return '''
      'diameterPangkal': $diameterPangkal,
      'diameterUjung': $diameterUjung,
      'panjang': $panjang,
      'volume': $volume,
      'biomassLand': $biomassLand,
      'carbonValue': $carbonValue,
      'carbonAbsorb': $carbonAbsorb,
    ''';
  }
}

@HiveType(typeId: 10)
class SubPlotAreaDTanahModel extends HiveObject {
  @HiveField(0)
  final String? uuid;
  @HiveField(1)
  final String areaName;
  @HiveField(2)
  final String plotName;
  @HiveField(3)
  final double kedalamanSample;
  @HiveField(4)
  final double beratJenisTanah;
  @HiveField(5)
  final double organicTanah;
  @HiveField(6)
  final double carbonGrCm;
  @HiveField(7)
  final double carbonTonHa;
  @HiveField(8)
  final double carbonTon;
  @HiveField(9)
  final double carbonAbsorb;

  SubPlotAreaDTanahModel({
    required this.uuid,
    required this.areaName,
    required this.plotName,
    required this.kedalamanSample,
    required this.beratJenisTanah,
    required this.organicTanah,
    required this.carbonGrCm,
    required this.carbonTonHa,
    required this.carbonTon,
    required this.carbonAbsorb,
  });

  @override
  String toString() {
    return '''
      'kedalamanSample': $kedalamanSample,
      'beratJenisTanah': $beratJenisTanah,
      'organicTanah': $organicTanah,
      'carbonGrCm': $carbonGrCm,
      'carbonTonHa': $carbonTonHa,
      'carbonTon': $carbonTon,
      'carbonAbsorb': $carbonAbsorb,
    ''';
  }
}
