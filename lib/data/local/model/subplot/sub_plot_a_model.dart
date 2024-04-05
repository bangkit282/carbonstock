const String tableSubPlotA = 'sub_plot_a';

class SubPlotAreaA {
  final int? id;
  final String areaName;
  final String plotName;
  final List<SubPlotAModel> subPlot;

  SubPlotAreaA({
    this.id,
    required this.subPlot,
    required this.areaName,
    required this.plotName,
  });

  SubPlotAreaA copy({
    int? id,
    String? areaName,
    String? plotName,
    List<SubPlotAModel>? subPlot,
  }) =>
      SubPlotAreaA(
        id: id ?? this.id,
        subPlot: subPlot ?? this.subPlot,
        areaName: areaName ?? this.areaName,
        plotName: plotName ?? this.plotName,
      );

  static SubPlotAreaA fromJson(Map<String, Object?> json) => SubPlotAreaA(
        id: json['id'] as int?,
        areaName: json['areaName'] as String,
        plotName: json['plotName'] as String,
        subPlot: json['subPlot'] as List<SubPlotAModel>,
      );

  Map<String, Object?> toJson() => {
        'id': id,
        'areaName': areaName,
        'plotName': plotName,
        'subPlot': subPlot,
      };
}

class SubPlotAModel {
  final int? id;
  final String type;
  final double beratBasahSample;
  final double beratBasahTotal;
  final double beratKeringSample;
  final double beratKeringTotal;

  SubPlotAModel({
    this.id,
    required this.type,
    required this.beratBasahSample,
    required this.beratBasahTotal,
    required this.beratKeringSample,
    required this.beratKeringTotal,
  });

  SubPlotAModel copy({
    int? id,
    String? type,
    double? beratBasahSample,
    double? beratBasahTotal,
    double? beratKeringSample,
    double? beratKeringTotal,
  }) =>
      SubPlotAModel(
        id: id ?? this.id,
        type: type ?? '',
        beratBasahSample: beratBasahSample ?? this.beratBasahSample,
        beratBasahTotal: beratBasahTotal ?? this.beratBasahTotal,
        beratKeringSample: beratKeringSample ?? this.beratKeringSample,
        beratKeringTotal: beratKeringTotal ?? this.beratKeringTotal,
      );

  static SubPlotAModel fromJson(Map<String, Object?> json) => SubPlotAModel(
        id: json['id'] as int?,
        type: json['type'] as String,
        beratBasahSample: json['beratBasahSample'] as double,
        beratBasahTotal: json['beratBasahTotal'] as double,
        beratKeringSample: json['beratKeringSample'] as double,
        beratKeringTotal: json['beratKeringTotal'] as double,
      );

  Map<String, Object?> toJson() => {
        'id': id,
        'type': type,
        'beratBasahSample': beratBasahSample,
        'beratBasahTotal': beratBasahTotal,
        'beratKeringSample': beratKeringSample,
        'beratKeringTotal': beratKeringTotal,
      };
}
