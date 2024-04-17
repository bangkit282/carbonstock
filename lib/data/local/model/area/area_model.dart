import 'package:hive/hive.dart';

part 'area_model.g.dart';

@HiveType(typeId: 0)
class AreaModel extends HiveObject {
  @HiveField(0)
  final String? areaId;
  @HiveField(1)
  final String areaName;
  @HiveField(2)
  final String areaLocation;
  @HiveField(3)
  final String areaImage;
  @HiveField(4)
  final String forestType;
  @HiveField(5)
  final String landType;
  @HiveField(6)
  final DateTime createdAt;

  AreaModel({
    this.areaId,
    required this.areaName,
    required this.areaLocation,
    required this.areaImage,
    required this.forestType,
    required this.landType,
    required this.createdAt,
  });

  @override
  String toString() {
    return '''
      'areaName': $areaName,
      'areaLocation': $areaLocation,
      'areaImage': $areaImage,
      'forestType': $forestType,
      'landType': $landType,
      'createdAt': $createdAt
    ''';
  }
}