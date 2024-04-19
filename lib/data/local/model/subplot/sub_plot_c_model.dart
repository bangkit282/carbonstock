import 'package:hive/hive.dart';

part 'sub_plot_c_model.g.dart';

@HiveType(typeId: 7)
class SubPlotAreaCModel extends HiveObject {
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
  @HiveField(11)
  final String subPlotCPhotoUrl;

  SubPlotAreaCModel({
    this.uuid,
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
    required this.subPlotCPhotoUrl,
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
        'subPlotCPhotoUrl': $subPlotCPhotoUrl,
          ''';
  }
}
