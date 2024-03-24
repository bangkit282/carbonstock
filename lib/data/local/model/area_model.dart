const String tableArea = 'area';

class AreaFields {
  static final List<String> values = [
    id,
    areaName,
    areaLocation,
    areaImage,
    forestType,
    landType,
    createdAt,
    notationTeam,
  ];

  static const String id = '_id';
  static const String areaName = 'areaName';
  static const String areaLocation = 'areaLocation';
  static const String areaImage = 'areaImage';
  static const String forestType = 'forestType';
  static const String landType = 'landType';
  static const String createdAt = 'createdAt';
  static const String notationTeam = 'notationTeam';
}

class AreaModel {
  final int? id;
  final String areaName;
  final String areaLocation;
  final String areaImage;
  final String forestType;
  final String landType;
  final DateTime createdAt;
  final String notationTeam;

  AreaModel({
    this.id,
    required this.areaName,
    required this.areaLocation,
    required this.areaImage,
    required this.forestType,
    required this.landType,
    required this.createdAt,
    required this.notationTeam,
  });

  AreaModel copy({
    int? id,
    String? areaName,
    String? areaLocation,
    String? areaImage,
    String? forestType,
    String? landType,
    DateTime? createdAt,
    String? notationTeam,
  }) =>
      AreaModel(
        id: id ?? this.id,
        areaName: areaName ?? this.areaName,
        areaLocation: areaLocation ?? this.areaLocation,
        areaImage: areaImage ?? this.areaImage,
        forestType: forestType ?? this.forestType,
        landType: landType ?? this.landType,
        createdAt: createdAt ?? this.createdAt,
        notationTeam: notationTeam ?? this.notationTeam,
      );

  static AreaModel fromJson(Map<String, dynamic> json) {
    return AreaModel(
      id: json['id'] as int?,
      areaName: json['areaName'] as String,
      areaLocation: json['areaLocation'] as String,
      areaImage: json['areaImage'] as String,
      forestType: json['forestType'] as String,
      landType: json['landType'] as String,
      createdAt: DateTime.parse(json['createdAt']),
      notationTeam: json['notationTeam'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'areaName': areaName,
      'areaLocation': areaLocation,
      'areaImage': areaImage,
      'forestType': forestType,
      'landType': landType,
      'createdAt': createdAt.toIso8601String(),
      'notationTeam': notationTeam,
    };
  }

  @override
  String toString() {
    return 'AreaModel{id: $id, areaName: $areaName, areaLocation: $areaLocation, areaImage: $areaImage, forestType: $forestType, landType: $landType, createdAt: $createdAt, notationTeam: $notationTeam}';
  }
}
