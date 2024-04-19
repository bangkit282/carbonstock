part of '../../views.dart';

class SummaryPageViews extends StatefulWidget {
  const SummaryPageViews({super.key});

  @override
  State<SummaryPageViews> createState() => _SummaryPageViewsState();
}

class _SummaryPageViewsState extends State<SummaryPageViews> {
  final SubPlotController _subPlotController = Get.find();
  final PlotController _plotController = Get.find();

  final RxDouble? subCarbonValue = 0.0.obs;
  final RxDouble? subCarbonAbsorb = 0.0.obs;

  @override
  Widget build(BuildContext context) {
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
                height: 235.h,
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
                            const Spacer(),
                            // Text(
                            //   'Edit Plot Data',
                            //   style: TextStyle(
                            //     fontSize: 14.sp,
                            //     color: const Color.fromRGBO(255, 168, 0, 1),
                            //     fontWeight: FontWeight.w700,
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
                  fontSize: 16.sp,
                  color: colorPrimaryBlack,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 16.h),
              SizedBox(
                width: 1.sw,
                height: 360.h,
                child: Card(
                  elevation: 0,
                  child: Padding(
                    padding: EdgeInsets.all(16.r),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Kandungan Karbon (Ton C/Ha)',
                              style: TextStyle(
                                fontSize: 18.sp,
                                color: colorPrimaryBlack,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const Spacer(),
                            // Text(
                            //   'Edit Plot Data',
                            //   style: TextStyle(
                            //     fontSize: 14.sp,
                            //     color: const Color.fromRGBO(255, 168, 0, 1),
                            //     fontWeight: FontWeight.w700,
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
                        buildTotalKarbonDetail(),
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
                    '${box.getAt(box.length - 1)?.plotLat}, ${box.getAt(box.length - 1)?.plotLng}',
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
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Text(
        //       'Total Kandungan Carbon',
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
        //             subCarbonValue.toString(),
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
        //       'Total Serapan CO2',
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
        //             subCarbonAbsorb.toString(),
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
      ],
    );
  }
}
