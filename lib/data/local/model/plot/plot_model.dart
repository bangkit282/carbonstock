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

  PlotModel({
    this.plotId,
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
