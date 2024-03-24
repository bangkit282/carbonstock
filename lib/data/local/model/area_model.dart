class AreaModel {
  final int id;
  final String areaName;
  final String areaLocation;
  final String areaImage;
  final String forestType;
  final String landType;
  final DateTime createdAt;
  final String notationTeam;

  AreaModel(
    this.id,
    this.areaName,
    this.areaLocation,
    this.areaImage,
    this.forestType,
    this.landType,
    this.createdAt,
    this.notationTeam,
  );

  @override
  String toString() {
    return 'AreaModel{id: $id, areaName: $areaName, areaLocation: $areaLocation, areaImage: $areaImage, forestType: $forestType, landType: $landType, createdAt: $createdAt, notationTeam: $notationTeam}';
  }
}
