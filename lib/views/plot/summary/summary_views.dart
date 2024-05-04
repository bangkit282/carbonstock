part of '../../views.dart';

class SummaryPageViews extends StatefulWidget {
  const SummaryPageViews({
    super.key,
    required this.plotId,
    required this.idA,
    required this.idB,
    required this.idC,
    required this.idD,
  });

  final String idA;
  final String idB;
  final String idC;
  final String idD;
  final String plotId;

  @override
  State<SummaryPageViews> createState() => _SummaryPageViewsState();
}

class _SummaryPageViewsState extends State<SummaryPageViews> {
  final SharedPreferenceService _sharedPref = SharedPreferenceService();

  final SubPlotController _subPlotController = Get.find();
  final PlotController _plotController = Get.find();

  double valCarbonA = 0.0;
  double valCarbonASemai = 0.0;
  double valCarbonASeresah = 0.0;
  double valCarbonATumbuhan = 0.0;
  double valAbsorbA = 0.0;
  double valAbsorbASemai = 0.0;
  double valAbsorbASeresah = 0.0;
  double valAbsorbATumbuhan = 0.0;

  double valCarbonB = 0.0;
  double valAbsorbB = 0.0;

  double valCarbonC = 0.0;
  double valAbsorbC = 0.0;

  double valCarbonD = 0.0;
  double valCarbonDPohon = 0.0;
  double valCarbonDNekromas = 0.0;
  double valCarbonDTanah = 0.0;
  double valAbsorbD = 0.0;
  double valAbsorbDPohon = 0.0;
  double valAbsorbDNekromas = 0.0;
  double valAbsorbDTanah = 0.0;

  RxDouble subCarbonValue = 0.0.obs;
  RxDouble subCarbonAbsorb = 0.0.obs;

  @override
  Widget build(BuildContext context) {
    if (widget.idA != '') {
      List<SubPlotAreaAModel> listA =
          _subPlotController.contactABox.values.toList();
      SubPlotAreaAModel plotAFiltered =
          listA.firstWhere((element) => element.uuid == widget.idA);

      valCarbonASemai = plotAFiltered.subPlotAModels![0] != null
          ? plotAFiltered.subPlotAModels![0].carbonValue
          : 0.0;
      valCarbonASeresah = plotAFiltered.subPlotAModels![1] != null
          ? plotAFiltered.subPlotAModels![1].carbonValue
          : 0.0;
      valCarbonATumbuhan = plotAFiltered.subPlotAModels![2] != null
          ? plotAFiltered.subPlotAModels![2].carbonValue
          : 0.0;

      valAbsorbASemai = plotAFiltered.subPlotAModels![0] != null
          ? plotAFiltered.subPlotAModels![0].carbonAbsorb
          : 0.0;
      valAbsorbASeresah = plotAFiltered.subPlotAModels![1] != null
          ? plotAFiltered.subPlotAModels![1].carbonAbsorb
          : 0.0;
      valAbsorbATumbuhan = plotAFiltered.subPlotAModels![2] != null
          ? plotAFiltered.subPlotAModels![2].carbonAbsorb
          : 0.0;

      valCarbonA = valCarbonASemai + valCarbonASeresah + valCarbonATumbuhan;
      valAbsorbA = valAbsorbASemai + valAbsorbASeresah + valAbsorbATumbuhan;
    }

    if (widget.idB != '') {
      List<SubPlotAreaBModel> listB =
          _subPlotController.contactBBox.values.toList();
      SubPlotAreaBModel plotBFiltered =
          listB.firstWhere((element) => element.uuid == widget.idB);

      valCarbonB = plotBFiltered.carbonValue;
      valAbsorbB = plotBFiltered.carbonAbsorb;
    }

    if (widget.idC != '') {
      List<SubPlotAreaCModel> listC =
          _subPlotController.contactCBox.values.toList();
      SubPlotAreaCModel plotCFiltered =
          listC.firstWhere((element) => element.uuid == widget.idC);

      valCarbonC = plotCFiltered.carbonValue;
      valAbsorbC = plotCFiltered.carbonAbsorb;
    }

    if (widget.idD != '') {
      List<SubPlotAreaDModel> listD =
          _subPlotController.contactDBox.values.toList();
      SubPlotAreaDModel plotDFiltered =
          listD.firstWhere((element) => element.uuid == widget.idD);

      valCarbonDPohon = plotDFiltered.subPlotDModels![0] != null
          ? plotDFiltered.subPlotDModels![0].carbonValue
          : 0.0;
      valCarbonDNekromas = plotDFiltered.subPlotDModels![1] != null
          ? plotDFiltered.subPlotDModels![1].carbonValue
          : 0.0;
      valCarbonDTanah = plotDFiltered.subPlotDModels![2] != null
          ? plotDFiltered.subPlotDModels![2].carbonValue
          : 0.0;

      valAbsorbDPohon = plotDFiltered.subPlotDModels![0] != null
          ? plotDFiltered.subPlotDModels![0].carbonAbsorb
          : 0.0;
      valAbsorbDNekromas = plotDFiltered.subPlotDModels![1] != null
          ? plotDFiltered.subPlotDModels![1].carbonAbsorb
          : 0.0;
      valAbsorbDTanah = plotDFiltered.subPlotDModels![2] != null
          ? plotDFiltered.subPlotDModels![2].carbonAbsorb
          : 0.0;

      valCarbonD = valCarbonDPohon + valCarbonDNekromas + valCarbonDTanah;
      valAbsorbD = valAbsorbDPohon + valAbsorbDNekromas + valAbsorbDTanah;
    }

    subCarbonAbsorb.value = valAbsorbA + valAbsorbB + valAbsorbC + valAbsorbD;
    subCarbonValue.value = valCarbonA + valCarbonB + valCarbonC + valCarbonD;

    d.log('${subCarbonValue.value} ${subCarbonAbsorb.value}', name: 'test');

    return Scaffold(
      backgroundColor: colorPrimaryBackground,
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Summary Sub Plot',
          style: TextStyle(
            fontSize: 20.sp,
            color: colorPrimaryWhite,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            CupertinoIcons.back,
            color: Colors.white,
          ),
        ),
        backgroundColor: colorSecondaryGreen,
      ),
      body: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: ListView(
            children: [
              SizedBox(
                width: 1.sw,
                height: 280.h,
                child: Card(
                  elevation: 0,
                  child: Padding(
                    padding: EdgeInsets.all(16.r),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Detail Plot',
                              style: TextStyle(
                                fontSize: 18.sp,
                                color: colorPrimaryBlack,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            // const Spacer(flex: 2),
                            // GestureDetector(
                            //   onTap: () {
                            //     Navigator.push(
                            //       context,
                            //       PageRouteBuilder(
                            //         pageBuilder: (_, __, ___) =>
                            //             AddPlotScreenViews(
                            //           plotId: widget.plotId,
                            //         ),
                            //         transitionsBuilder:
                            //             (_, animation, __, child) {
                            //           return FadeTransition(
                            //             opacity: animation,
                            //             child: child,
                            //           );
                            //         },
                            //       ),
                            //     );
                            //   },
                            //   child: Text(
                            //     'Edit Plot Data',
                            //     style: TextStyle(
                            //       fontSize: 14.sp,
                            //       color: const Color.fromRGBO(255, 168, 0, 1),
                            //       fontWeight: FontWeight.w700,
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                        Container(
                          width: 1.sw,
                          height: 1.h,
                          margin: EdgeInsets.symmetric(vertical: 16.h),
                          color: const Color.fromRGBO(239, 239, 240, 1),
                        ),
                        buildPlotDetail(),
                      ],
                    ),
                  ),
                ),
              ),
              Text(
                'Summary Hitungan Total',
                style: TextStyle(
                  fontSize: 18.sp,
                  color: colorPrimaryBlack,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 16.h),
              SizedBox(
                width: 1.sw,
                height: 386.h,
                child: Card(
                  elevation: 0,
                  child: Padding(
                    padding: EdgeInsets.all(16.r),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Kandungan Karbon\n(Ton C/Ha)',
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: colorPrimaryBlack,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Container(
                          width: 1.sw,
                          height: 1.h,
                          margin: EdgeInsets.symmetric(vertical: 16.h),
                          color: const Color.fromRGBO(239, 239, 240, 1),
                        ),
                        buildTotalKarbonDetail(),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 1.sw,
                height: 380.h,
                child: Card(
                  elevation: 0,
                  child: Padding(
                    padding: EdgeInsets.all(16.r),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Serapan CO2\n(Ton C/Ha)',
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: colorPrimaryBlack,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Container(
                          width: 1.sw,
                          height: 1.h,
                          margin: EdgeInsets.symmetric(vertical: 16.h),
                          color: const Color.fromRGBO(239, 239, 240, 1),
                        ),
                        buildTotalSerapanDetail(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPlotDetail() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Koordinat Plot',
              style: TextStyle(
                fontSize: 12.sp,
                color: colorPrimaryBlack,
              ),
            ),
            ValueListenableBuilder(
              valueListenable: _plotController.contactBox.listenable(),
              builder: (context, box, _) {
                if (box.isNotEmpty) {
                  return Text(
                    '${box.getAt(box.length - 1)?.plotLat.toStringAsFixed(5)}'
                    ' ${box.getAt(box.length - 1)?.plotLng.toStringAsFixed(5)}',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: colorPrimaryBlack,
                    ),
                  );
                } else {
                  return Text(
                    'No data',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: colorPrimaryBlack,
                    ),
                  );
                }
              },
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Ukuran Plot',
              style: TextStyle(
                fontSize: 12.sp,
                color: colorPrimaryBlack,
              ),
            ),
            ValueListenableBuilder(
              valueListenable: _plotController.contactBox.listenable(),
              builder: (context, box, _) {
                if (box.isNotEmpty) {
                  return Text(
                    '${box.getAt(box.length - 1)?.plotSize}',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: colorPrimaryBlack,
                    ),
                  );
                } else {
                  return Text(
                    'No data',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: colorPrimaryBlack,
                    ),
                  );
                }
              },
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Rataan Biomasa',
              style: TextStyle(
                fontSize: 12.sp,
                color: colorPrimaryBlack,
              ),
            ),
            ValueListenableBuilder(
              valueListenable: _plotController.contactBox.listenable(),
              builder: (context, box, _) {
                if (box.isNotEmpty) {
                  return Text(
                    '${box.getAt(box.length - 1)?.biomassAvg}',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: colorPrimaryBlack,
                    ),
                  );
                } else {
                  return Text(
                    'No data',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: colorPrimaryBlack,
                    ),
                  );
                }
              },
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Standar Deviasi Biomasa',
              style: TextStyle(
                fontSize: 12.sp,
                color: colorPrimaryBlack,
              ),
            ),
            ValueListenableBuilder(
              valueListenable: _plotController.contactBox.listenable(),
              builder: (context, box, _) {
                if (box.isNotEmpty) {
                  return Text(
                    '${box.getAt(box.length - 1)?.biomassStd}',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: colorPrimaryBlack,
                    ),
                  );
                } else {
                  return Text(
                    'No data',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: colorPrimaryBlack,
                    ),
                  );
                }
              },
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total Kandungan Carbon',
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w700,
                color: colorPrimaryBlack,
              ),
            ),
            ValueListenableBuilder(
              valueListenable: _plotController.contactBox.listenable(),
              builder: (context, box, _) {
                if (box.isNotEmpty) {
                  return Text(
                    subCarbonValue.toStringAsFixed(2),
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                      color: colorPrimaryBlack,
                    ),
                  );
                } else {
                  return Text(
                    'No data',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: colorPrimaryBlack,
                    ),
                  );
                }
              },
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total Serapan CO2',
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w700,
                color: colorPrimaryBlack,
              ),
            ),
            ValueListenableBuilder(
              valueListenable: _plotController.contactBox.listenable(),
              builder: (context, box, _) {
                if (box.isNotEmpty) {
                  return Text(
                    subCarbonAbsorb.toStringAsFixed(2),
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                      color: colorPrimaryBlack,
                    ),
                  );
                } else {
                  return Text(
                    'No data',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: colorPrimaryBlack,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget buildTotalKarbonDetail() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Seresah',
              style: TextStyle(
                fontSize: 12.sp,
                color: colorPrimaryBlack,
              ),
            ),
            ValueListenableBuilder(
              valueListenable:
                  _subPlotController.contactASeresahBox.listenable(),
              builder: (context, box, _) {
                if (box.isNotEmpty) {
                  return Text(
                    '${(box.getAt(box.length - 1)?.carbonValue)?.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: colorPrimaryBlack,
                    ),
                  );
                } else {
                  return Text(
                    'No data',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: colorPrimaryBlack,
                    ),
                  );
                }
              },
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Tumbuhan Bawah',
              style: TextStyle(
                fontSize: 12.sp,
                color: colorPrimaryBlack,
              ),
            ),
            ValueListenableBuilder(
              valueListenable:
                  _subPlotController.contactATumbuhanBox.listenable(),
              builder: (context, box, _) {
                if (box.isNotEmpty) {
                  return Text(
                    '${(box.getAt(box.length - 1)?.carbonValue)?.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: colorPrimaryBlack,
                    ),
                  );
                } else {
                  return Text(
                    'No data',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: colorPrimaryBlack,
                    ),
                  );
                }
              },
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Semai',
              style: TextStyle(
                fontSize: 12.sp,
                color: colorPrimaryBlack,
              ),
            ),
            ValueListenableBuilder(
              valueListenable: _subPlotController.contactASemaiBox.listenable(),
              builder: (context, box, _) {
                if (box.isNotEmpty) {
                  return Text(
                    '${(box.getAt(box.length - 1)?.carbonValue)?.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: colorPrimaryBlack,
                    ),
                  );
                } else {
                  return Text(
                    'No data',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: colorPrimaryBlack,
                    ),
                  );
                }
              },
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Pancang',
              style: TextStyle(
                fontSize: 12.sp,
                color: colorPrimaryBlack,
              ),
            ),
            ValueListenableBuilder(
              valueListenable: _subPlotController.contactBBox.listenable(),
              builder: (context, box, _) {
                if (box.isNotEmpty) {
                  return Text(
                    '${(box.getAt(box.length - 1)?.carbonValue)?.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: colorPrimaryBlack,
                    ),
                  );
                } else {
                  return Text(
                    'No data',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: colorPrimaryBlack,
                    ),
                  );
                }
              },
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Tiang',
              style: TextStyle(
                fontSize: 12.sp,
                color: colorPrimaryBlack,
              ),
            ),
            ValueListenableBuilder(
              valueListenable: _subPlotController.contactCBox.listenable(),
              builder: (context, box, _) {
                if (box.isNotEmpty) {
                  return Text(
                    '${(box.getAt(box.length - 1)?.carbonValue)?.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: colorPrimaryBlack,
                    ),
                  );
                } else {
                  return Text(
                    'No data',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: colorPrimaryBlack,
                    ),
                  );
                }
              },
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Pohon',
              style: TextStyle(
                fontSize: 12.sp,
                color: colorPrimaryBlack,
              ),
            ),
            ValueListenableBuilder(
              valueListenable: _subPlotController.contactDPohonBox.listenable(),
              builder: (context, box, _) {
                if (box.isNotEmpty) {
                  return Text(
                    '${(box.getAt(box.length - 1)?.carbonValue)?.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: colorPrimaryBlack,
                    ),
                  );
                } else {
                  return Text(
                    'No data',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: colorPrimaryBlack,
                    ),
                  );
                }
              },
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Nekromas',
              style: TextStyle(
                fontSize: 12.sp,
                color: colorPrimaryBlack,
              ),
            ),
            ValueListenableBuilder(
              valueListenable:
                  _subPlotController.contactDNekromasBox.listenable(),
              builder: (context, box, _) {
                if (box.isNotEmpty) {
                  return Text(
                    '${(box.getAt(box.length - 1)?.carbonValue)?.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: colorPrimaryBlack,
                    ),
                  );
                } else {
                  return Text(
                    'No data',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: colorPrimaryBlack,
                    ),
                  );
                }
              },
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Tanah',
              style: TextStyle(
                fontSize: 12.sp,
                color: colorPrimaryBlack,
              ),
            ),
            ValueListenableBuilder(
              valueListenable: _subPlotController.contactDTanahBox.listenable(),
              builder: (context, box, _) {
                if (box.isNotEmpty) {
                  return Text(
                    '${(box.getAt(box.length - 1)?.carbonTon)?.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: colorPrimaryBlack,
                    ),
                  );
                } else {
                  return Text(
                    'No data',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: colorPrimaryBlack,
                    ),
                  );
                }
              },
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total Carbon',
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w700,
                color: colorPrimaryBlack,
              ),
            ),
            ValueListenableBuilder(
              valueListenable: _plotController.contactBox.listenable(),
              builder: (context, box, _) {
                if (box.isNotEmpty) {
                  return Text(
                    subCarbonValue.toStringAsFixed(2),
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                      color: colorPrimaryBlack,
                    ),
                  );
                } else {
                  return Text(
                    'No data',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: colorPrimaryBlack,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget buildTotalSerapanDetail() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Seresah',
              style: TextStyle(
                fontSize: 12.sp,
                color: colorPrimaryBlack,
              ),
            ),
            ValueListenableBuilder(
              valueListenable:
                  _subPlotController.contactASeresahBox.listenable(),
              builder: (context, box, _) {
                if (box.isNotEmpty) {
                  return Text(
                    _sharedPref
                        .getDouble('absorb_a_seresah')
                        .toStringAsFixed(2),
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: colorPrimaryBlack,
                    ),
                  );
                } else {
                  return Text(
                    'No data',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: colorPrimaryBlack,
                    ),
                  );
                }
              },
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Tumbuhan Bawah',
              style: TextStyle(
                fontSize: 12.sp,
                color: colorPrimaryBlack,
              ),
            ),
            ValueListenableBuilder(
              valueListenable:
                  _subPlotController.contactATumbuhanBox.listenable(),
              builder: (context, box, _) {
                if (box.isNotEmpty) {
                  return Text(
                    _sharedPref
                        .getDouble('absorb_a_tumbuhan')
                        .toStringAsFixed(2),
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: colorPrimaryBlack,
                    ),
                  );
                } else {
                  return Text(
                    'No data',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: colorPrimaryBlack,
                    ),
                  );
                }
              },
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Semai',
              style: TextStyle(
                fontSize: 12.sp,
                color: colorPrimaryBlack,
              ),
            ),
            ValueListenableBuilder(
              valueListenable: _subPlotController.contactASemaiBox.listenable(),
              builder: (context, box, _) {
                if (box.isNotEmpty) {
                  return Text(
                    _sharedPref.getDouble('absorb_a_semai').toStringAsFixed(2),
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: colorPrimaryBlack,
                    ),
                  );
                } else {
                  return Text(
                    'No data',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: colorPrimaryBlack,
                    ),
                  );
                }
              },
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Pancang',
              style: TextStyle(
                fontSize: 12.sp,
                color: colorPrimaryBlack,
              ),
            ),
            ValueListenableBuilder(
              valueListenable: _subPlotController.contactBBox.listenable(),
              builder: (context, box, _) {
                if (box.isNotEmpty) {
                  return Text(
                    _sharedPref.getDouble('absorb_b').toStringAsFixed(2),
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: colorPrimaryBlack,
                    ),
                  );
                } else {
                  return Text(
                    'No data',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: colorPrimaryBlack,
                    ),
                  );
                }
              },
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Tiang',
              style: TextStyle(
                fontSize: 12.sp,
                color: colorPrimaryBlack,
              ),
            ),
            ValueListenableBuilder(
              valueListenable: _subPlotController.contactCBox.listenable(),
              builder: (context, box, _) {
                if (box.isNotEmpty) {
                  return Text(
                    _sharedPref.getDouble('absorb_c').toStringAsFixed(2),
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: colorPrimaryBlack,
                    ),
                  );
                } else {
                  return Text(
                    'No data',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: colorPrimaryBlack,
                    ),
                  );
                }
              },
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Pohon',
              style: TextStyle(
                fontSize: 12.sp,
                color: colorPrimaryBlack,
              ),
            ),
            ValueListenableBuilder(
              valueListenable: _subPlotController.contactDPohonBox.listenable(),
              builder: (context, box, _) {
                if (box.isNotEmpty) {
                  return Text(
                    _sharedPref.getDouble('absorb_d_pohon').toStringAsFixed(2),
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: colorPrimaryBlack,
                    ),
                  );
                } else {
                  return Text(
                    'No data',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: colorPrimaryBlack,
                    ),
                  );
                }
              },
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Nekromas',
              style: TextStyle(
                fontSize: 12.sp,
                color: colorPrimaryBlack,
              ),
            ),
            ValueListenableBuilder(
              valueListenable:
                  _subPlotController.contactDNekromasBox.listenable(),
              builder: (context, box, _) {
                if (box.isNotEmpty) {
                  return Text(
                    _sharedPref
                        .getDouble('absorb_d_nekromas')
                        .toStringAsFixed(2),
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: colorPrimaryBlack,
                    ),
                  );
                } else {
                  return Text(
                    'No data',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: colorPrimaryBlack,
                    ),
                  );
                }
              },
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Tanah',
              style: TextStyle(
                fontSize: 12.sp,
                color: colorPrimaryBlack,
              ),
            ),
            ValueListenableBuilder(
              valueListenable: _subPlotController.contactDTanahBox.listenable(),
              builder: (context, box, _) {
                if (box.isNotEmpty) {
                  return Text(
                    _sharedPref.getDouble('absorb_d_tanah').toStringAsFixed(2),
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: colorPrimaryBlack,
                    ),
                  );
                } else {
                  return Text(
                    'No data',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: colorPrimaryBlack,
                    ),
                  );
                }
              },
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total Serapan CO2',
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w700,
                color: colorPrimaryBlack,
              ),
            ),
            ValueListenableBuilder(
              valueListenable: _plotController.contactBox.listenable(),
              builder: (context, box, _) {
                if (box.isNotEmpty) {
                  return Text(
                    subCarbonAbsorb.toStringAsFixed(2),
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                      color: colorPrimaryBlack,
                    ),
                  );
                } else {
                  return Text(
                    'No data',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: colorPrimaryBlack,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}
