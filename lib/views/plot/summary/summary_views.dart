part of '../../views.dart';

class SummaryPageViews extends StatefulWidget {
  const SummaryPageViews({
    super.key,
    required this.plotId,
  });

  final String plotId;

  @override
  State<SummaryPageViews> createState() => _SummaryPageViewsState();
}

class _SummaryPageViewsState extends State<SummaryPageViews> {
  final SharedPreferenceService _sharedPref = SharedPreferenceService();

  final SubPlotController _subPlotController = Get.find();
  final PlotController _plotController = Get.find();

  final RxDouble subCarbonValue = 0.0.obs;
  final RxDouble subCarbonAbsorb = 0.0.obs;

  void totalCarbonValue() {
    double carbonSemai = _sharedPref.getDouble('karbon_a_semai');
    double carbonSeresah = _sharedPref.getDouble('karbon_a_seresah');
    double carbonTumbuhan = _sharedPref.getDouble('karbon_a_tumbuhan');

    double carbonPancang = _sharedPref.getDouble('karbon_b');
    double carbonTiang = _sharedPref.getDouble('karbon_c');

    double carbonPohon = _sharedPref.getDouble('karbon_d_pohon');
    double carbonNekromas = _sharedPref.getDouble('karbon_d_nekromas');
    double carbonTanah = _sharedPref.getDouble('karbon_d_tanah');

    subCarbonValue.value = carbonSemai +
        carbonSeresah +
        carbonTumbuhan +
        carbonPancang +
        carbonTiang +
        carbonPohon +
        carbonNekromas +
        carbonTanah;
  }

  void totalAbsorbValue() {
    double absorbSemai = _sharedPref.getDouble('absorb_a_semai');
    double absorbSeresah = _sharedPref.getDouble('absorb_a_seresah');
    double absorbTumbuhan = _sharedPref.getDouble('absorb_a_tumbuhan');

    double absorbPancang = _sharedPref.getDouble('absorb_b');
    double absorbTiang = _sharedPref.getDouble('absorb_c');

    double absorbPohon = _sharedPref.getDouble('absorb_d_pohon');
    double absorbNekromas = _sharedPref.getDouble('absorb_d_nekromas');
    double absorbTanah = _sharedPref.getDouble('absorb_d_tanah');

    subCarbonAbsorb.value = absorbSemai +
        absorbSeresah +
        absorbTumbuhan +
        absorbPancang +
        absorbTiang +
        absorbPohon +
        absorbNekromas +
        absorbTanah;
  }

  @override
  Widget build(BuildContext context) {
    totalCarbonValue();
    totalAbsorbValue();

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
