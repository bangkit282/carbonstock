import 'package:hive/hive.dart';

part 'sub_plot_a_model.g.dart';

@HiveType(typeId: 2)
class SubPlotAreaAModel extends HiveObject {
  @HiveField(0)
  final String? uuid;
  @HiveField(1)
  final String plotId;
  @HiveField(2)
  final String areaName;
  @HiveField(3)
  final String plotName;
  @HiveField(4)
  final List<dynamic>? subPlotAModels;
  @HiveField(5)
  final DateTime updatedAt;

  SubPlotAreaAModel({
    this.uuid,
    required this.plotId,
    required this.areaName,
    required this.plotName,
    this.subPlotAModels,
    required this.updatedAt,
  });

  @override
  String toString() {
    return '''
      uuid: $uuid,
      areaName: $areaName,
      plotName: $plotName,
      subPlotAList: $subPlotAModels,
      updatedAt: $updatedAt
    ''';
  }
}

@HiveType(typeId: 3)
class SubPlotAreaASemaiModel extends HiveObject {
  @HiveField(0)
  final String? uuid;
  @HiveField(1)
  final String plotId;
  @HiveField(2)
  final String areaName;
  @HiveField(3)
  final String plotName;
  @HiveField(4)
  final double basahTotal;
  @HiveField(5)
  final double basahSample;
  @HiveField(6)
  final double keringTotal;
  @HiveField(7)
  final double keringSample;
  @HiveField(8)
  final double carbonValue;
  @HiveField(9)
  final double carbonAbsorb;
  @HiveField(10)
  final DateTime updatedAt;

  SubPlotAreaASemaiModel({
    this.uuid,
    required this.plotId,
    required this.areaName,
    required this.plotName,
    required this.basahTotal,
    required this.basahSample,
    required this.keringTotal,
    required this.keringSample,
    required this.carbonValue,
    required this.carbonAbsorb,
    required this.updatedAt,
  });

  @override
  String toString() {
    return '''
      SubPlotAreaASemaiModel(
        plotId: $plotId,
        areaName: $areaName,
        plotName: $plotName,
        basahTotal: $basahTotal,
        basahSample: $basahSample,
        keringTotal: $keringTotal,
        keringSample: $keringSample,
        carbonValue: $carbonValue,
        carbonAbsorb: $carbonAbsorb
        updatedAt: $updatedAt
      )
    ''';
  }
}

@HiveType(typeId: 4)
class SubPlotAreaASeresahModel extends HiveObject {
  @HiveField(0)
  final String? uuid;
  @HiveField(1)
  final String plotId;
  @HiveField(2)
  final String areaName;
  @HiveField(3)
  final String plotName;
  @HiveField(4)
  final double basahTotal;
  @HiveField(5)
  final double basahSample;
  @HiveField(6)
  final double keringTotal;
  @HiveField(7)
  final double keringSample;
  @HiveField(8)
  final double carbonValue;
  @HiveField(9)
  final double carbonAbsorb;
  @HiveField(10)
  final DateTime updatedAt;

  SubPlotAreaASeresahModel({
    this.uuid,
    required this.plotId,
    required this.areaName,
    required this.plotName,
    required this.basahTotal,
    required this.basahSample,
    required this.keringTotal,
    required this.keringSample,
    required this.carbonValue,
    required this.carbonAbsorb,
    required this.updatedAt,
  });

  @override
  String toString() {
    return '''
      SubPlotAreaASeresahModel(
        plotId: $plotId,
        areaName: $areaName,
        plotName: $plotName,
        basahTotal: $basahTotal,
        basahSample: $basahSample,
        keringTotal: $keringTotal,
        keringSample: $keringSample,
        carbonValue: $carbonValue,
        carbonAbsorb: $carbonAbsorb,
        updatedAt: $updatedAt
      )
    ''';
  }
}

@HiveType(typeId: 5)
class SubPlotAreaATumbuhanBawahModel extends HiveObject {
  @HiveField(0)
  final String? uuid;
  @HiveField(1)
  final String plotId;
  @HiveField(2)
  final String areaName;
  @HiveField(3)
  final String plotName;
  @HiveField(4)
  final double basahTotal;
  @HiveField(5)
  final double basahSample;
  @HiveField(6)
  final double keringTotal;
  @HiveField(7)
  final double keringSample;
  @HiveField(8)
  final double carbonValue;
  @HiveField(9)
  final double carbonAbsorb;
  @HiveField(10)
  final DateTime updatedAt;

  SubPlotAreaATumbuhanBawahModel({
    this.uuid,
    required this.plotId,
    required this.areaName,
    required this.plotName,
    required this.basahTotal,
    required this.basahSample,
    required this.keringTotal,
    required this.keringSample,
    required this.carbonValue,
    required this.carbonAbsorb,
    required this.updatedAt,
  });

  @override
  String toString() {
    return '''
      SubPlotAreaATumbuhanBawahModel(
        plotId: $plotId,
        areaName: $areaName,
        plotName: $plotName,
        basahTotal: $basahTotal,
        basahSample: $basahSample,
        keringTotal: $keringTotal,
        keringSample: $keringSample,
        carbonValue: $carbonValue,
        carbonAbsorb: $carbonAbsorb,
        updatedAt: $updatedAt
      )
    ''';
  }
}
