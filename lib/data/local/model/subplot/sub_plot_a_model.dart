import 'package:hive/hive.dart';

part 'sub_plot_a_model.g.dart';

@HiveType(typeId: 2)
class SubPlotAreaAModel extends HiveObject {
  @HiveField(0)
  final String? uuid;
  @HiveField(1)
  final String areaName;
  @HiveField(2)
  final String plotName;
  @HiveField(3)
  final List<dynamic>? subPlotAModels;
  @HiveField(4)
  final String subPlotAPhotoUrl;
  @HiveField(5)
  final DateTime updateAt;

  SubPlotAreaAModel({
    required this.uuid,
    required this.areaName,
    required this.plotName,
    this.subPlotAModels,
    required this.subPlotAPhotoUrl,
    required this.updateAt,
  });

  @override
  String toString() {
    return '''
      areaName: $areaName,
      plotName: $plotName,
      subPlotAList: $subPlotAModels,
      subPlotAPhoto: $subPlotAPhotoUrl, 
      updateAt: $updateAt
    ''';
  }
}

@HiveType(typeId: 3)
class SubPlotAreaASemaiModel extends HiveObject {
  @HiveField(0)
  final String? uuid;
  @HiveField(1)
  final String areaName;
  @HiveField(2)
  final String plotName;
  @HiveField(3)
  final double basahTotal;
  @HiveField(4)
  final double basahSample;
  @HiveField(5)
  final double keringTotal;
  @HiveField(6)
  final double keringSample;
  @HiveField(7)
  final double carbonValue;
  @HiveField(8)
  final double carbonAbsorb;

  SubPlotAreaASemaiModel({
    this.uuid,
    required this.areaName,
    required this.plotName,
    required this.basahTotal,
    required this.basahSample,
    required this.keringTotal,
    required this.keringSample,
    required this.carbonValue,
    required this.carbonAbsorb,
  });

  @override
  String toString() {
    return '''
      SubPlotAreaASemaiModel(
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

@HiveType(typeId: 4)
class SubPlotAreaASeresahModel extends HiveObject {
  @HiveField(0)
  final String? uuid;
  @HiveField(1)
  final String areaName;
  @HiveField(2)
  final String plotName;
  @HiveField(3)
  final double basahTotal;
  @HiveField(4)
  final double basahSample;
  @HiveField(5)
  final double keringTotal;
  @HiveField(6)
  final double keringSample;
  @HiveField(7)
  final double carbonValue;
  @HiveField(8)
  final double carbonAbsorb;

  SubPlotAreaASeresahModel({
    this.uuid,
    required this.areaName,
    required this.plotName,
    required this.basahTotal,
    required this.basahSample,
    required this.keringTotal,
    required this.keringSample,
    required this.carbonValue,
    required this.carbonAbsorb,
  });

  @override
  String toString() {
    return '''
      SubPlotAreaASeresahModel(
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

@HiveType(typeId: 5)
class SubPlotAreaATumbuhanBawahModel extends HiveObject {
  @HiveField(0)
  final String? uuid;
  @HiveField(1)
  final String areaName;
  @HiveField(2)
  final String plotName;
  @HiveField(3)
  final double basahTotal;
  @HiveField(4)
  final double basahSample;
  @HiveField(5)
  final double keringTotal;
  @HiveField(6)
  final double keringSample;
  @HiveField(7)
  final double carbonValue;
  @HiveField(8)
  final double carbonAbsorb;

  SubPlotAreaATumbuhanBawahModel({
    this.uuid,
    required this.areaName,
    required this.plotName,
    required this.basahTotal,
    required this.basahSample,
    required this.keringTotal,
    required this.keringSample,
    required this.carbonValue,
    required this.carbonAbsorb,
  });

  @override
  String toString() {
    return '''
      SubPlotAreaATumbuhanBawahModel(
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
