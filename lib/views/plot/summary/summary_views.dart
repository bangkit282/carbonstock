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

  RxList<Map<String, double>> listCarbonB =
      List<Map<String, double>>.empty(growable: true).obs;
  RxList<Map<String, double>> listCarbonC =
      List<Map<String, double>>.empty(growable: true).obs;

  RxList<Map<String, double>> listCarbonDPohon =
      List<Map<String, double>>.empty(growable: true).obs;
  RxList<Map<String, double>> listCarbonDNekromas =
      List<Map<String, double>>.empty(growable: true).obs;
  RxList<Map<String, double>> listCarbonDTanah =
      List<Map<String, double>>.empty(growable: true).obs;

  RxDouble valCarbonB = 0.0.obs;
  RxDouble valAbsorbB = 0.0.obs;

  RxDouble valCarbonC = 0.0.obs;
  RxDouble valAbsorbC = 0.0.obs;

  // double valCarbonD = 0.0;
  RxDouble valCarbonDPohon = 0.0.obs;
  RxDouble valCarbonDNekromas = 0.0.obs;
  RxDouble valCarbonDTanah = 0.0.obs;
  // double valAbsorbD = 0.0;
  RxDouble valAbsorbDPohon = 0.0.obs;
  RxDouble valAbsorbDNekromas = 0.0.obs;
  RxDouble valAbsorbDTanah = 0.0.obs;

  RxDouble subCarbonValue = 0.0.obs;
  RxDouble subCarbonAbsorb = 0.0.obs;

  Future<void> initConnectivity() async {
    List<ConnectivityResult> conResult = [];
    late ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      conResult = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      d.log('Couldn\'t check connectivity status', error: e);
      return;
    }

    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(conResult);
  }

  Future<void> _updateConnectionStatus(List<ConnectivityResult> result) async {
    setState(() {
      if (result.contains(ConnectivityResult.mobile)) {
        _connectionStatus = ConnectivityResult.mobile;
      } else if (result.contains(ConnectivityResult.wifi)) {
        _connectionStatus = ConnectivityResult.wifi;
      } else if (result.contains(ConnectivityResult.ethernet)) {
        _connectionStatus = ConnectivityResult.ethernet;
      } else if (result.contains(ConnectivityResult.none)) {
        _connectionStatus = ConnectivityResult.none;
      }
    });
  }

  @override
  void initState() {
    initConnectivity();

    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (listCarbonB.isNotEmpty) listCarbonB.clear();
    if (listCarbonC.isNotEmpty) listCarbonC.clear();

    if (listCarbonDPohon.isNotEmpty) listCarbonDPohon.clear();
    if (listCarbonDNekromas.isNotEmpty) listCarbonDNekromas.clear();
    if (listCarbonDTanah.isNotEmpty) listCarbonDTanah.clear();

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
            updatedAt: DateFormat('yyyy-MM-dd HH:mm:ss').parse(
              today.toString(),
            ),
          );
        }
        // d.log('A submit $plotAFiltered', name: 'test-post');

        Get.snackbar(
          'CarbonRangers',
          'Sinkronisasi Sub-Plot A success!',
          backgroundColor: colorSecondaryGrey1,
        );
      }
    }

    if (widget.idB != '') {
      List<SubPlotAreaBModel> listB =
          _subPlotController.contactBBox.values.toList();

      for (var plotBFiltered in listB) {
        listCarbonB.add({
          'carbonValue': plotBFiltered.carbonValue,
          'carbonAbsorb': plotBFiltered.carbonAbsorb,
        });

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
            carbonValue: plotBFiltered.carbonValue,
            carbonAbsorb: plotBFiltered.carbonAbsorb,
            updatedAt: DateFormat('yyyy-MM-dd HH:mm:ss').parse(
              today.toString(),
            ),
          );

          Get.snackbar(
            'CarbonRangers',
            'Sinkronisasi Sub-Plot B success!',
            backgroundColor: colorSecondaryGrey1,
          );
        }
      }

      if (listB.isNotEmpty && listCarbonB.isNotEmpty) {
        int length = listB.length;
        int plotSize = 25;
        double sumAbsorb = 0.0;
        double sumCarbon = 0.0;

        for (Map<String, double> plotB in listCarbonB) {
          sumAbsorb += plotB['carbonAbsorb']!;
          sumCarbon += plotB['carbonValue']!;
        }

        valAbsorbB.value =
            ((sumAbsorb / length) * (length / plotSize) * 10000) / 1000;
        valCarbonB.value =
            ((sumCarbon / length) * (length / plotSize) * 10000) / 1000;
      }
    }

    if (widget.idC != '') {
      List<SubPlotAreaCModel> listC =
          _subPlotController.contactCBox.values.toList();

      for (var plotCFiltered in listC) {
        listCarbonC.add({
          'carbonValue': plotCFiltered.carbonValue,
          'carbonAbsorb': plotCFiltered.carbonAbsorb,
        });

        if (_connectionStatus == ConnectivityResult.mobile ||
            _connectionStatus == ConnectivityResult.wifi) {
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
            carbonValue: plotCFiltered.carbonValue,
            carbonAbsorb: plotCFiltered.carbonAbsorb,
            updatedAt: DateFormat('yyyy-MM-dd HH:mm:ss').parse(
              today.toString(),
            ),
          );

          Get.snackbar(
            'CarbonRangers',
            'Sinkronisasi Sub-Plot C success!',
            backgroundColor: colorSecondaryGrey1,
          );
        }
      }

      if (listC.isNotEmpty && listCarbonC.isNotEmpty) {
        int length = listC.length;
        int plotSize = 100;
        double sumAbsorb = 0.0;
        double sumCarbon = 0.0;

        for (Map<String, double> plotC in listCarbonC) {
          sumAbsorb += plotC['carbonAbsorb']!;
          sumCarbon += plotC['carbonValue']!;
        }

        valAbsorbC.value =
            ((sumAbsorb / length) * (length / plotSize) * 10000) / 1000;
        valCarbonC.value =
            ((sumCarbon / length) * (length / plotSize) * 10000) / 1000;
      }
    }

    if (widget.idD != '') {
      List<SubPlotAreaDModel> listD =
          _subPlotController.contactDBox.values.toList();
      List<SubPlotAreaDModel> listPlotDFiltered =
          listD.where((e) => e.uuid == widget.idD).toList();

      List<SubPlotAreaDPohonModel> listDPohon = _subPlotController
          .contactDPohonBox.values
          .where((e) => e.plotId == widget.plotId)
          .toList();
      List<SubPlotAreaDNekromasModel> listDNekromas = _subPlotController
          .contactDNekromasBox.values
          .where((e) => e.plotId == widget.plotId)
          .toList();
      List<SubPlotAreaDTanahModel> listDTanah = _subPlotController
          .contactDTanahBox.values
          .where((e) => e.plotId == widget.plotId)
          .toList();

      // Plot D
      for (var plotDFiltered in listPlotDFiltered) {
        if (_connectionStatus == ConnectivityResult.mobile ||
            _connectionStatus == ConnectivityResult.wifi) {
          _summaryController.postSubPlotD(
            uuid: plotDFiltered.uuid.toString(),
            plotId: plotDFiltered.plotId,
            areaName: plotDFiltered.areaName,
            plotName: plotDFiltered.plotName,
            updatedAt: DateFormat('yyyy-MM-dd HH:mm:ss').parse(
              today.toString(),
            ),
          );

          for (var plotPohon in listDPohon) {
            if (plotDFiltered.subPlotDModels![0] != null) {
              if (plotDFiltered.subPlotDModels![0].uuid == plotPohon.uuid) {
                listCarbonDPohon.add({
                  'carbonValue': plotPohon.carbonValue,
                  'carbonAbsorb': plotPohon.carbonAbsorb,
                });

                _summaryController.postSubPlotDPohon(
                  uuid: plotPohon.uuid.toString(),
                  plotDuuid: plotDFiltered.uuid.toString(),
                  plotId: plotPohon.plotId,
                  areaName: plotPohon.areaName,
                  plotName: plotPohon.plotName,
                  localName: plotPohon.localName,
                  bioName: plotPohon.bioName,
                  keliling: plotPohon.keliling,
                  diameter: plotPohon.diameter,
                  kerapatankayu: plotPohon.kerapatanKayu,
                  biomass: plotPohon.biomassLand,
                  carbonValue: plotPohon.carbonValue,
                  carbonAbsorb: plotPohon.carbonAbsorb,
                  updatedAt: DateFormat('yyyy-MM-dd HH:mm:ss').parse(
                    today.toString(),
                  ),
                );
              }
            }
          }

          for (var plotNekromas in listDNekromas) {
            if (plotDFiltered.subPlotDModels![1] != null) {
              if (plotDFiltered.subPlotDModels![1].uuid == plotNekromas.uuid) {
                listCarbonDNekromas.add({
                  'carbonValue': plotNekromas.carbonValue,
                  'carbonAbsorb': plotNekromas.carbonAbsorb,
                });

                _summaryController.postSubPlotDNekromas(
                  uuid: plotNekromas.uuid.toString(),
                  plotDuuid: plotDFiltered.uuid.toString(),
                  plotId: plotNekromas.plotId,
                  areaName: plotNekromas.areaName,
                  plotName: plotNekromas.plotName,
                  panjang: plotNekromas.panjang,
                  volume: plotNekromas.volume,
                  diameterPangkal: plotNekromas.diameterPangkal,
                  diameterUjung: plotNekromas.diameterUjung,
                  biomass: plotNekromas.biomassLand,
                  carbonValue: plotNekromas.carbonValue,
                  carbonAbsorb: plotNekromas.carbonAbsorb,
                  updatedAt: DateFormat('yyyy-MM-dd HH:mm:ss').parse(
                    today.toString(),
                  ),
                );
              }
            }
          }

          for (var plotTanah in listDTanah) {
            if (plotDFiltered.subPlotDModels![2] != null) {
              if (plotDFiltered.subPlotDModels![2].uuid == plotTanah.uuid) {
                listCarbonDTanah.add({
                  'carbonValue': plotTanah.carbonTonHa,
                  'carbonAbsorb': plotTanah.carbonAbsorb,
                });

                _summaryController.postSubPlotDTanah(
                  uuid: plotTanah.uuid.toString(),
                  plotDuuid: plotDFiltered.uuid.toString(),
                  plotId: plotTanah.plotId,
                  areaName: plotTanah.areaName,
                  plotName: plotTanah.plotName,
                  kedalamanSample: plotTanah.kedalamanSample,
                  beratJenis: plotTanah.beratJenisTanah,
                  organikCTanah: plotTanah.organicTanah,
                  carbonGrCm: plotTanah.carbonGrCm,
                  carbonTonHa: plotTanah.carbonTonHa,
                  carbonTon: plotTanah.carbonTon,
                  carbonAbsorb: plotTanah.carbonAbsorb,
                  updatedAt: DateFormat('yyyy-MM-dd HH:mm:ss').parse(
                    today.toString(),
                  ),
                );
              }
            }
          }

          Get.snackbar(
            'CarbonRangers',
            'Sinkronisasi Sub-Plot D success!',
            backgroundColor: colorSecondaryGrey1,
          );
        }
      }

      if (listDPohon.isNotEmpty && listCarbonDPohon.isNotEmpty) {
        int length = listDPohon.length;
        int plotSize = 400;
        double sumAbsorb = 0.0;
        double sumCarbon = 0.0;

        for (Map<String, double> plotPohon in listCarbonDPohon) {
          sumAbsorb += plotPohon['carbonAbsorb']!;
          sumCarbon += plotPohon['carbonValue']!;
        }

        valAbsorbDPohon.value =
            ((sumAbsorb / length) * (length / plotSize) * 10000) / 1000;
        valCarbonDPohon.value =
            ((sumCarbon / length) * (length / plotSize) * 10000) / 1000;
      }

      if (listDNekromas.isNotEmpty && listCarbonDNekromas.isNotEmpty) {
        int length = listDNekromas.length;
        int plotSize = 400;
        double sumAbsorb = 0.0;
        double sumCarbon = 0.0;

        for (Map<String, double> plotNekromas in listCarbonDNekromas) {
          sumAbsorb += plotNekromas['carbonAbsorb']!;
          sumCarbon += plotNekromas['carbonValue']!;
        }

        valAbsorbDNekromas.value =
            ((sumAbsorb / length) * (length / plotSize) * 10000) / 1000;
        valCarbonDNekromas.value =
            ((sumCarbon / length) * (length / plotSize) * 10000) / 1000;
      }

      if (listDTanah.isNotEmpty && listCarbonDTanah.isNotEmpty) {
        int length = listDTanah.length;
        int plotSize = 400;
        double sumAbsorb = 0.0;
        double sumCarbon = 0.0;

        for (Map<String, double> plotTanah in listCarbonDTanah) {
          sumAbsorb += plotTanah['carbonAbsorb']!;
          sumCarbon += plotTanah['carbonValue']!;
        }

        valAbsorbDTanah.value =
            ((sumAbsorb / length) * (length / plotSize) * 10000) / 1000;
        valCarbonDTanah.value = ((sumCarbon / length) * (length / plotSize));
      }
    }

    // subCarbonAbsorb.value = valAbsorbA + valAbsorbB + valAbsorbC + valAbsorbD;
    // subCarbonValue.value = valCarbonA + valCarbonB + valCarbonC + valCarbonD;

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
                height: 420.h,
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
                height: 420.h,
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
