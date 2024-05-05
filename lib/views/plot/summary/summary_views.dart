part of '../../views.dart';

class SummaryPageViews extends StatefulWidget {
  const SummaryPageViews({
    super.key,
    required this.plotId,
    required this.idA,
    required this.idB,
    required this.idC,
    required this.idD,
    required this.plotData,
  });

  final String? idA;
  final String? idB;
  final String? idC;
  final String? idD;
  final String plotId;
  final Datum plotData;

  @override
  State<SummaryPageViews> createState() => _SummaryPageViewsState();
}

class _SummaryPageViewsState extends State<SummaryPageViews> {
  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();

  final SubPlotController _subPlotController = Get.find();
  final SummarySubplotController _summaryController = Get.find();

  DateTime today = DateTime.now();

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

  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      d.log('Couldn\'t check connectivity status', error: e);
      return;
    }

    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      _connectionStatus = result;
    });
  }

  @override
  void initState() {
    initConnectivity();

    _connectivity.onConnectivityChanged.listen(
      _updateConnectionStatus,
    );
    super.initState();
  }

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

      if (_connectionStatus == ConnectivityResult.mobile ||
          _connectionStatus == ConnectivityResult.wifi) {
        _summaryController.postSubPlotA(
          uuid: plotAFiltered.uuid.toString(),
          plotId: plotAFiltered.plotId,
          areaName: plotAFiltered.areaName,
          plotName: plotAFiltered.plotName,
          updatedAt: DateFormat('yyyy-MM-dd HH:mm:ss').parse(today.toString()),
        );

        if (plotAFiltered.subPlotAModels![0] != null) {
          _summaryController.postSubPlotAParts(
            part: 'Semai',
            uuid: plotAFiltered.subPlotAModels![0].uuid.toString(),
            plotAuuid: plotAFiltered.uuid.toString(),
            plotId: plotAFiltered.plotId,
            areaName: plotAFiltered.areaName,
            plotName: plotAFiltered.plotName,
            basahTotal: plotAFiltered.subPlotAModels![0].basahTotal,
            keringTotal: plotAFiltered.subPlotAModels![0].keringTotal,
            basahSample: plotAFiltered.subPlotAModels![0].basahSample,
            keringSample: plotAFiltered.subPlotAModels![0].keringSample,
            carbonValue: valCarbonASemai,
            carbonAbsorb: valAbsorbASemai,
            updatedAt:
                DateFormat('yyyy-MM-dd HH:mm:ss').parse(today.toString()),
          );
        }

        if (plotAFiltered.subPlotAModels![1] != null) {
          _summaryController.postSubPlotAParts(
            part: 'Seresah',
            uuid: plotAFiltered.subPlotAModels![1].uuid.toString(),
            plotAuuid: plotAFiltered.uuid.toString(),
            plotId: plotAFiltered.plotId,
            areaName: plotAFiltered.areaName,
            plotName: plotAFiltered.plotName,
            basahTotal: plotAFiltered.subPlotAModels![1].basahTotal,
            keringTotal: plotAFiltered.subPlotAModels![1].keringTotal,
            basahSample: plotAFiltered.subPlotAModels![1].basahSample,
            keringSample: plotAFiltered.subPlotAModels![1].keringSample,
            carbonValue: valCarbonASeresah,
            carbonAbsorb: valAbsorbASeresah,
            updatedAt:
                DateFormat('yyyy-MM-dd HH:mm:ss').parse(today.toString()),
          );
        }

        if (plotAFiltered.subPlotAModels![2] != null) {
          _summaryController.postSubPlotAParts(
            part: 'Bawah',
            uuid: plotAFiltered.subPlotAModels![2].uuid.toString(),
            plotAuuid: plotAFiltered.uuid.toString(),
            plotId: plotAFiltered.plotId,
            areaName: plotAFiltered.areaName,
            plotName: plotAFiltered.plotName,
            basahTotal: plotAFiltered.subPlotAModels![2].basahTotal,
            keringTotal: plotAFiltered.subPlotAModels![2].keringTotal,
            basahSample: plotAFiltered.subPlotAModels![2].basahSample,
            keringSample: plotAFiltered.subPlotAModels![2].keringSample,
            carbonValue: valCarbonATumbuhan,
            carbonAbsorb: valAbsorbATumbuhan,
            updatedAt:
                DateFormat('yyyy-MM-dd HH:mm:ss').parse(today.toString()),
          );
        }
        // d.log('A submit $plotAFiltered', name: 'test-post');
      }
    }

    if (widget.idB != '') {
      List<SubPlotAreaBModel> listB =
          _subPlotController.contactBBox.values.toList();
      SubPlotAreaBModel plotBFiltered =
          listB.firstWhere((element) => element.uuid == widget.idB);

      valCarbonB = plotBFiltered.carbonValue;
      valAbsorbB = plotBFiltered.carbonAbsorb;

      if (_connectionStatus == ConnectivityResult.mobile ||
          _connectionStatus == ConnectivityResult.wifi) {
        _summaryController.postSubPlotB(
          uuid: plotBFiltered.uuid.toString(),
          plotId: plotBFiltered.plotId,
          areaName: plotBFiltered.areaName,
          plotName: plotBFiltered.plotName,
          localName: plotBFiltered.localName,
          bioName: plotBFiltered.bioName,
          keliling: plotBFiltered.keliling,
          diameter: plotBFiltered.diameter,
          kerapatankayu: plotBFiltered.kerapatanKayu,
          biomass: plotBFiltered.biomassLand,
          carbonValue: valCarbonB,
          carbonAbsorb: valAbsorbB,
          updatedAt: DateFormat('yyyy-MM-dd HH:mm:ss').parse(today.toString()),
        );
        // d.log('B submit', name: 'test-post');
      }
    }

    if (widget.idC != '') {
      List<SubPlotAreaCModel> listC =
          _subPlotController.contactCBox.values.toList();
      SubPlotAreaCModel plotCFiltered =
          listC.firstWhere((element) => element.uuid == widget.idC);

      valCarbonC = plotCFiltered.carbonValue;
      valAbsorbC = plotCFiltered.carbonAbsorb;

      _summaryController.postSubPlotC(
        uuid: plotCFiltered.uuid.toString(),
        plotId: plotCFiltered.plotId,
        areaName: plotCFiltered.areaName,
        plotName: plotCFiltered.plotName,
        localName: plotCFiltered.localName,
        bioName: plotCFiltered.bioName,
        keliling: plotCFiltered.keliling,
        diameter: plotCFiltered.diameter,
        kerapatankayu: plotCFiltered.kerapatanKayu,
        biomass: plotCFiltered.biomassLand,
        carbonValue: valCarbonC,
        carbonAbsorb: valAbsorbC,
        updatedAt: DateFormat('yyyy-MM-dd HH:mm:ss').parse(today.toString()),
      );
      // d.log('C submit', name: 'test-post');
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
          ? plotDFiltered.subPlotDModels![2].carbonTon
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

      // Plot D
      _summaryController.postSubPlotD(
        uuid: plotDFiltered.uuid.toString(),
        plotId: plotDFiltered.plotId,
        areaName: plotDFiltered.areaName,
        plotName: plotDFiltered.plotName,
        updatedAt: DateFormat('yyyy-MM-dd HH:mm:ss').parse(today.toString()),
      );

      if (plotDFiltered.subPlotDModels![0] != null) {
        _summaryController.postSubPlotDPohon(
          uuid: plotDFiltered.uuid.toString(),
          plotDuuid: plotDFiltered.subPlotDModels![0].uuid.toString(),
          plotId: plotDFiltered.plotId,
          areaName: plotDFiltered.areaName,
          plotName: plotDFiltered.plotName,
          localName: plotDFiltered.subPlotDModels![0].localName,
          bioName: plotDFiltered.subPlotDModels![0].bioName,
          keliling: plotDFiltered.subPlotDModels![0].keliling,
          diameter: plotDFiltered.subPlotDModels![0].diameter,
          kerapatankayu: plotDFiltered.subPlotDModels![0].kerapatanKayu,
          biomass: plotDFiltered.subPlotDModels![0].biomassLand,
          carbonValue: valCarbonDPohon,
          carbonAbsorb: valAbsorbDPohon,
          updatedAt: DateFormat('yyyy-MM-dd HH:mm:ss').parse(today.toString()),
        );
      }

      if (plotDFiltered.subPlotDModels![1] != null) {
        _summaryController.postSubPlotDNekromas(
          uuid: plotDFiltered.uuid.toString(),
          plotDuuid: plotDFiltered.subPlotDModels![1].uuid.toString(),
          plotId: plotDFiltered.plotId,
          areaName: plotDFiltered.areaName,
          plotName: plotDFiltered.plotName,
          diameterPangkal: plotDFiltered.subPlotDModels![1].diameterPangkal,
          diameterUjung: plotDFiltered.subPlotDModels![1].diameterUjung,
          panjang: plotDFiltered.subPlotDModels![1].panjang,
          volume: plotDFiltered.subPlotDModels![1].volume,
          biomass: plotDFiltered.subPlotDModels![1].biomassLand,
          carbonValue: valCarbonDNekromas,
          carbonAbsorb: valAbsorbDNekromas,
          updatedAt: DateFormat('yyyy-MM-dd HH:mm:ss').parse(today.toString()),
        );
      }

      if (plotDFiltered.subPlotDModels![2] != null) {
        _summaryController.postSubPlotDTanah(
          uuid: plotDFiltered.uuid.toString(),
          plotDuuid: plotDFiltered.subPlotDModels![2].uuid.toString(),
          plotId: plotDFiltered.plotId,
          areaName: plotDFiltered.areaName,
          plotName: plotDFiltered.plotName,
          kedalamanSample: plotDFiltered.subPlotDModels![2].kedalamanSample,
          beratJenis: plotDFiltered.subPlotDModels![2].beratJenisTanah,
          organikCTanah: plotDFiltered.subPlotDModels![2].organicTanah,
          carbonGrCm: plotDFiltered.subPlotDModels![2].carbonGrCm,
          carbonTonHa: plotDFiltered.subPlotDModels![2].carbonTonHa,
          carbonTon: plotDFiltered.subPlotDModels![2].carbonTon,
          carbonAbsorb: valAbsorbDTanah,
          updatedAt: DateFormat('yyyy-MM-dd HH:mm:ss').parse(today.toString()),
        );
      }
      // d.log('D submit', name: 'test-post');
    }

    subCarbonAbsorb.value = valAbsorbA + valAbsorbB + valAbsorbC + valAbsorbD;
    subCarbonValue.value = valCarbonA + valCarbonB + valCarbonC + valCarbonD;
    d.log('${subCarbonAbsorb.value} ${subCarbonValue.value}', name: 'test');

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
                height: 215.h,
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
            Text(
              '${widget.plotData.latitude}, ${widget.plotData.longitude}',
              style: TextStyle(
                fontSize: 12.sp,
                color: colorPrimaryBlack,
              ),
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
            Text(
              widget.plotData.plot.ukuranPlot,
              style: TextStyle(
                fontSize: 12.sp,
                color: colorPrimaryBlack,
              ),
            ),
          ],
        ),
        // SizedBox(height: 16.h),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Text(
        //       'Rataan Biomasa',
        //       style: TextStyle(
        //         fontSize: 12.sp,
        //         color: colorPrimaryBlack,
        //       ),
        //     ),
        //     ValueListenableBuilder(
        //       valueListenable: _plotController.contactBox.listenable(),
        //       builder: (context, box, _) {
        //         if (box.isNotEmpty) {
        //           return Text(
        //             '${box.getAt(box.length - 1)?.biomassAvg}',
        //             style: TextStyle(
        //               fontSize: 12.sp,
        //               color: colorPrimaryBlack,
        //             ),
        //           );
        //         } else {
        //           return Text(
        //             'No data',
        //             style: TextStyle(
        //               fontSize: 12.sp,
        //               color: colorPrimaryBlack,
        //             ),
        //           );
        //         }
        //       },
        //     ),
        //   ],
        // ),
        // SizedBox(height: 16.h),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Text(
        //       'Standar Deviasi Biomasa',
        //       style: TextStyle(
        //         fontSize: 12.sp,
        //         color: colorPrimaryBlack,
        //       ),
        //     ),
        //     ValueListenableBuilder(
        //       valueListenable: _plotController.contactBox.listenable(),
        //       builder: (context, box, _) {
        //         if (box.isNotEmpty) {
        //           return Text(
        //             '${box.getAt(box.length - 1)?.biomassStd}',
        //             style: TextStyle(
        //               fontSize: 12.sp,
        //               color: colorPrimaryBlack,
        //             ),
        //           );
        //         } else {
        //           return Text(
        //             'No data',
        //             style: TextStyle(
        //               fontSize: 12.sp,
        //               color: colorPrimaryBlack,
        //             ),
        //           );
        //         }
        //       },
        //     ),
        //   ],
        // ),
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
            Text(
              subCarbonValue.toStringAsFixed(2),
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w700,
                color: colorPrimaryBlack,
              ),
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
            Text(
              subCarbonAbsorb.toStringAsFixed(2),
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w700,
                color: colorPrimaryBlack,
              ),
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
                  if (box.values.toList().indexWhere((element) =>
                          element.plotId == widget.plotData.id.toString()) !=
                      -1) {
                    return Text(
                      (box.values
                              .lastWhere((element) =>
                                  element.plotId ==
                                  widget.plotData.id.toString())
                              .carbonValue)
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
                  if (box.values.toList().indexWhere((element) =>
                          element.plotId == widget.plotData.id.toString()) !=
                      -1) {
                    return Text(
                      (box.values
                              .lastWhere((element) =>
                                  element.plotId ==
                                  widget.plotData.id.toString())
                              .carbonValue)
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
                  if (box.values.toList().indexWhere((element) =>
                          element.plotId == widget.plotData.id.toString()) !=
                      -1) {
                    return Text(
                      (box.values
                              .lastWhere((element) =>
                                  element.plotId ==
                                  widget.plotData.id.toString())
                              .carbonValue)
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
                  if (box.values.toList().indexWhere((element) =>
                          element.plotId == widget.plotData.id.toString()) !=
                      -1) {
                    if (box.values.toList().length > 1) {
                      double total = 0;

                      for (var i = 0; i < box.values.toList().length; i++) {
                        total += box.values.toList()[i].carbonValue;
                      }

                      return Text(
                        total.toStringAsFixed(2),
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: colorPrimaryBlack,
                        ),
                      );
                    } else {
                      return Text(
                        (box.values
                                .lastWhere((element) =>
                                    element.plotId ==
                                    widget.plotData.id.toString())
                                .carbonValue)
                            .toStringAsFixed(2),
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: colorPrimaryBlack,
                        ),
                      );
                    }
                  } else {
                    return Text(
                      'No data',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: colorPrimaryBlack,
                      ),
                    );
                  }
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
                  if (box.values.toList().indexWhere((element) =>
                          element.plotId == widget.plotData.id.toString()) !=
                      -1) {
                    if (box.values.toList().length > 1) {
                      double total = 0;

                      for (var i = 0; i < box.values.toList().length; i++) {
                        total += box.values.toList()[i].carbonValue;
                      }

                      return Text(
                        total.toStringAsFixed(2),
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: colorPrimaryBlack,
                        ),
                      );
                    } else {
                      return Text(
                        (box.values
                                .lastWhere((element) =>
                                    element.plotId ==
                                    widget.plotData.id.toString())
                                .carbonValue)
                            .toStringAsFixed(2),
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: colorPrimaryBlack,
                        ),
                      );
                    }
                  } else {
                    return Text(
                      'No data',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: colorPrimaryBlack,
                      ),
                    );
                  }
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
                  if (box.values.toList().indexWhere((element) =>
                          element.plotId == widget.plotData.id.toString()) !=
                      -1) {
                    return Text(
                      (box.values
                              .lastWhere((element) =>
                                  element.plotId ==
                                  widget.plotData.id.toString())
                              .carbonValue)
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
                  if (box.values.toList().indexWhere((element) =>
                          element.plotId == widget.plotData.id.toString()) !=
                      -1) {
                    return Text(
                      (box.values
                              .lastWhere((element) =>
                                  element.plotId ==
                                  widget.plotData.id.toString())
                              .carbonValue)
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
                  if (box.values.toList().indexWhere((element) =>
                          element.plotId == widget.plotData.id.toString()) !=
                      -1) {
                    return Text(
                      (box.values
                              .lastWhere((element) =>
                                  element.plotId ==
                                  widget.plotData.id.toString())
                              .carbonTon)
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
            Text(
              subCarbonValue.toStringAsFixed(2),
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w700,
                color: colorPrimaryBlack,
              ),
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
                  if (box.values.toList().indexWhere((element) =>
                          element.plotId == widget.plotData.id.toString()) !=
                      -1) {
                    return Text(
                      (box.values
                              .lastWhere((element) =>
                                  element.plotId ==
                                  widget.plotData.id.toString())
                              .carbonAbsorb)
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
                  if (box.values.toList().indexWhere((element) =>
                          element.plotId == widget.plotData.id.toString()) !=
                      -1) {
                    return Text(
                      (box.values
                              .lastWhere((element) =>
                                  element.plotId ==
                                  widget.plotData.id.toString())
                              .carbonAbsorb)
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
                  if (box.values.toList().indexWhere((element) =>
                          element.plotId == widget.plotData.id.toString()) !=
                      -1) {
                    return Text(
                      (box.values
                              .lastWhere((element) =>
                                  element.plotId ==
                                  widget.plotData.id.toString())
                              .carbonAbsorb)
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
                  if (box.values.toList().indexWhere((element) =>
                          element.plotId == widget.plotData.id.toString()) !=
                      -1) {
                    if (box.values.toList().length > 1) {
                      double total = 0;

                      for (var i = 0; i < box.values.toList().length; i++) {
                        total += box.values.toList()[i].carbonAbsorb;
                      }

                      return Text(
                        total.toStringAsFixed(2),
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: colorPrimaryBlack,
                        ),
                      );
                    } else {
                      return Text(
                        (box.values
                                .lastWhere((element) =>
                                    element.plotId ==
                                    widget.plotData.id.toString())
                                .carbonAbsorb)
                            .toStringAsFixed(2),
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: colorPrimaryBlack,
                        ),
                      );
                    }
                  } else {
                    return Text(
                      'No data',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: colorPrimaryBlack,
                      ),
                    );
                  }
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
                  if (box.values.toList().indexWhere((element) =>
                          element.plotId == widget.plotData.id.toString()) !=
                      -1) {
                    if (box.values.toList().length > 1) {
                      double total = 0;

                      for (var i = 0; i < box.values.toList().length; i++) {
                        total += box.values.toList()[i].carbonAbsorb;
                      }

                      return Text(
                        total.toStringAsFixed(2),
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: colorPrimaryBlack,
                        ),
                      );
                    } else {
                      return Text(
                        (box.values
                                .lastWhere((element) =>
                                    element.plotId ==
                                    widget.plotData.id.toString())
                                .carbonAbsorb)
                            .toStringAsFixed(2),
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: colorPrimaryBlack,
                        ),
                      );
                    }
                  } else {
                    return Text(
                      'No data',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: colorPrimaryBlack,
                      ),
                    );
                  }
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
                  if (box.values.toList().indexWhere((element) =>
                          element.plotId == widget.plotData.id.toString()) !=
                      -1) {
                    return Text(
                      (box.values
                              .lastWhere((element) =>
                                  element.plotId ==
                                  widget.plotData.id.toString())
                              .carbonAbsorb)
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
                  if (box.values.toList().indexWhere((element) =>
                          element.plotId == widget.plotData.id.toString()) !=
                      -1) {
                    return Text(
                      (box.values
                              .lastWhere((element) =>
                                  element.plotId ==
                                  widget.plotData.id.toString())
                              .carbonAbsorb)
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
                  if (box.values.toList().indexWhere((element) =>
                          element.plotId == widget.plotData.id.toString()) !=
                      -1) {
                    return Text(
                      (box.values
                              .lastWhere((element) =>
                                  element.plotId ==
                                  widget.plotData.id.toString())
                              .carbonAbsorb)
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
            Text(
              subCarbonAbsorb.toStringAsFixed(2),
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w700,
                color: colorPrimaryBlack,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
