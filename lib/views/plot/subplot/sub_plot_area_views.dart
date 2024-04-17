part of '../../views.dart';

class SubPlotAreaScreenViews extends StatefulWidget {
  const SubPlotAreaScreenViews({
    super.key,
    required this.areaName,
    required this.plotName,
  });

  final String areaName;
  final String plotName;

  @override
  State<SubPlotAreaScreenViews> createState() => _SubPlotAreaScreenViewsState();
}

class _SubPlotAreaScreenViewsState extends State<SubPlotAreaScreenViews> {
  // final SharedPreferenceService _sharedPref = SharedPreferenceService();
  // final SubPlotController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Sub Plot',
          style: TextStyle(
            color: colorPrimaryWhite,
            fontSize: 20.sp,
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(24.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Data Sub Plot',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'Masukkan data zona yang akan dituju',
                        style: TextStyle(fontSize: 12.sp),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            fetchSubPlotListData(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              child: ElevatedButton(
                onPressed: () {
                  Get.snackbar(
                    'CarbonStock',
                    'Still in development!',
                    backgroundColor: colorSecondaryGrey1,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorButtonAccentGreen,
                  fixedSize: Size(1.sw, 45.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                child: Text(
                  'Lihat Summary',
                  style: TextStyle(
                    color: colorPrimaryWhite,
                    fontWeight: FontWeight.w700,
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget fetchSubPlotListData() {
    return Container(
      height: 370.h,
      width: 1.sw,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      child: ListView.builder(
        itemCount: 4,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          String subPlotAlphabet = String.fromCharCode(index + 65);

          return Container(
            width: 1.sw,
            height: 85.h,
            margin: EdgeInsets.only(top: 4.h),
            child: Card(
              elevation: 0.5,
              color: colorPrimaryWhite,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 16.h,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      CupertinoIcons.location_solid,
                      color: colorButtonAccentGreen,
                      size: 34.sp,
                    ),
                    SizedBox(width: 8.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 150.w,
                          child: Text(
                            'Sub Plot $subPlotAlphabet',
                            textAlign: TextAlign.left,
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 18.sp,
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 150.w,
                          child: Text(
                            '${widget.plotName}, ${widget.areaName}',
                            textAlign: TextAlign.left,
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 11.sp,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                    buildCardButton(subPlotAlphabet),
                
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildCardButton(String plotAlphabet) {
    if (plotAlphabet == 'A') {
      if (SubPlotAreaDB.getAllSubPlotSemai().isNotEmpty ||
          SubPlotAreaDB.getAllSubPlotSeresah().isNotEmpty ||
          SubPlotAreaDB.getAllSubPlotBawah().isNotEmpty) {
        return Container(
          margin: EdgeInsets.only(left: 16.w),
          child: TextButton(
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) => DetailSubPlotAPageScreen(
                    areaName: widget.areaName,  
                    plotName: widget.plotName,
                    semaiList: SubPlotAreaDB.getAllSubPlotSemai(),
                    seresahList: SubPlotAreaDB.getAllSubPlotSeresah(),
                    tumbuhanList: SubPlotAreaDB.getAllSubPlotBawah(),
                  ),
                  transitionsBuilder: (_, animation, __, child) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                ),
              );
            },
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
              backgroundColor: colorButtonAccentGreen,
            ),
            child: Text(
              'Edit',
              style: TextStyle(
                color: colorPrimaryWhite,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        );
      } else {
        return TextButton(
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (_, __, ___) => DetailSubPlotAPageScreen(
                  areaName: widget.areaName,
                  plotName: widget.plotName,
                  semaiList: SubPlotAreaDB.getAllSubPlotSemai(),
                  seresahList: SubPlotAreaDB.getAllSubPlotSeresah(),
                  tumbuhanList: SubPlotAreaDB.getAllSubPlotBawah(),
                ),
                transitionsBuilder: (_, animation, __, child) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
              ),
            );
          },
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
            backgroundColor: colorButtonAccentGreen,
          ),
          child: Text(
            'Tambah',
            style: TextStyle(
              color: colorPrimaryWhite,
              fontWeight: FontWeight.w600,
            ),
          ),
        );
      }
    } else if (plotAlphabet == 'B') {
      if (SubPlotAreaDB.getAllSubPlotB().isNotEmpty) {
        return Container(
          margin: EdgeInsets.only(left: 16.w),
          child: TextButton(
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) => DetailSubPlotBPageScreen(
                    areaName: widget.areaName,
                    plotName: widget.plotName,
                    subPlotBList: SubPlotAreaDB.getAllSubPlotB(),
                  ),
                  transitionsBuilder: (_, animation, __, child) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                ),
              );
            },
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
              backgroundColor: colorButtonAccentGreen,
            ),
            child: Text(
              'Edit',
              style: TextStyle(
                color: colorPrimaryWhite,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        );
      } else {
        return TextButton(
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (_, __, ___) => DetailSubPlotBPageScreen(
                  areaName: widget.areaName,
                  plotName: widget.plotName,
                  subPlotBList: SubPlotAreaDB.getAllSubPlotB(),
                ),
                transitionsBuilder: (_, animation, __, child) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
              ),
            );
          },
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
            backgroundColor: colorButtonAccentGreen,
          ),
          child: Text(
            'Tambah',
            style: TextStyle(
              color: colorPrimaryWhite,
              fontWeight: FontWeight.w600,
            ),
          ),
        );
      }
    } else if (plotAlphabet == 'C') {
      if (SubPlotAreaDB.getAllSubPlotC().isNotEmpty) {
        return Container(
          margin: EdgeInsets.only(left: 16.w),
          child: TextButton(
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) => DetailSubPlotCPageScreen(
                    areaName: widget.areaName,
                    plotName: widget.plotName,
                    subPlotCList: SubPlotAreaDB.getAllSubPlotC(),
                  ),
                  transitionsBuilder: (_, animation, __, child) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                ),
              );
            },
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
              backgroundColor: colorButtonAccentGreen,
            ),
            child: Text(
              'Edit',
              style: TextStyle(
                color: colorPrimaryWhite,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        );
      } else {
        return TextButton(
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (_, __, ___) => DetailSubPlotCPageScreen(
                  areaName: widget.areaName,
                  plotName: widget.plotName,
                  subPlotCList: SubPlotAreaDB.getAllSubPlotC(),
                ),
                transitionsBuilder: (_, animation, __, child) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
              ),
            );
          },
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
            backgroundColor: colorButtonAccentGreen,
          ),
          child: Text(
            'Tambah',
            style: TextStyle(
              color: colorPrimaryWhite,
              fontWeight: FontWeight.w600,
            ),
          ),
        );
      }
    } else if (plotAlphabet == 'D') {
      return Container();
    } else {
      return Container();
    }
  }

  // Widget buildButtonAByIndex(
  //   int index,
  //   String areaName,
  //   String plotName,
  //   List<dynamic>? listModelA,
  // ) {
  //   if (index == 0) {
  //     return Container(
  //       margin: EdgeInsets.only(left: 24.w),
  //       child: ElevatedButton(
  //         onPressed: () {
  //           Navigator.push(
  //             context,
  //             PageRouteBuilder(
  //               pageBuilder: (_, __, ___) => DetailSubPlotAPageScreen(
  //                 areaName: areaName,
  //                 plotName: plotName,
  //                 subPlotA: listModelA,
  //               ),
  //               transitionsBuilder: (_, animation, __, child) {
  //                 return FadeTransition(
  //                   opacity: animation,
  //                   child: child,
  //                 );
  //               },
  //             ),
  //           );
  //         },
  //         style: ElevatedButton.styleFrom(
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(8.r),
  //           ),
  //           backgroundColor: colorButtonAccentGreen,
  //         ),
  //         child: const Text(
  //           'Edit',
  //           style: TextStyle(
  //             color: colorPrimaryWhite,
  //             fontWeight: FontWeight.w600,
  //           ),
  //         ),
  //       ),
  //     );
  //   } else {
  //     return Container();
  //   }
  // }

  // Widget buildButtonByIndex(
  //   int index,
  //   String areaName,
  //   String plotName,
  //   SubPlotAreaBModel? modelB,
  //   SubPlotAreaCModel? modelC,
  // ) {
  //   if (index == 1) {
  //     return Container(
  //       margin: EdgeInsets.only(left: 24.w),
  //       child: ElevatedButton(
  //         onPressed: () {
  //           Navigator.push(
  //             context,
  //             PageRouteBuilder(
  //               pageBuilder: (_, __, ___) => DetailSubPlotBPageScreen(
  //                 subPlotB: modelB,
  //                 areaName: areaName,
  //                 plotName: plotName,
  //               ),
  //               transitionsBuilder: (_, animation, __, child) {
  //                 return FadeTransition(
  //                   opacity: animation,
  //                   child: child,
  //                 );
  //               },
  //             ),
  //           );
  //         },
  //         style: ElevatedButton.styleFrom(
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(8.r),
  //           ),
  //           backgroundColor: colorButtonAccentGreen,
  //         ),
  //         child: const Text(
  //           'Edit',
  //           style: TextStyle(
  //             color: colorPrimaryWhite,
  //             fontWeight: FontWeight.w600,
  //           ),
  //         ),
  //       ),
  //     );
  //   } else if (index == 2) {
  //     return Container(
  //       margin: EdgeInsets.only(left: 24.w),
  //       child: ElevatedButton(
  //         onPressed: () {
  //           Navigator.push(
  //             context,
  //             PageRouteBuilder(
  //               pageBuilder: (_, __, ___) => DetailSubPlotCPageScreen(
  //                 subPlotC: modelC,
  //                 areaName: areaName,
  //                 plotName: plotName,
  //               ),
  //               transitionsBuilder: (_, animation, __, child) {
  //                 return FadeTransition(
  //                   opacity: animation,
  //                   child: child,
  //                 );
  //               },
  //             ),
  //           );
  //         },
  //         style: ElevatedButton.styleFrom(
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(8.r),
  //           ),
  //           backgroundColor: colorButtonAccentGreen,
  //         ),
  //         child: const Text(
  //           'Edit',
  //           style: TextStyle(
  //             color: colorPrimaryWhite,
  //             fontWeight: FontWeight.w600,
  //           ),
  //         ),
  //       ),
  //     );
  //   } else {
  //     return Container(
  //       margin: EdgeInsets.only(left: 24.w),
  //       child: ElevatedButton(
  //         onPressed: () {
  //           Get.snackbar(
  //             'CarbonStock',
  //             'Still in development! Only Sub Plot B & C is ready!',
  //             backgroundColor: colorSecondaryGrey1,
  //           );

  // Navigator.push(
  //   context,
  //   PageRouteBuilder(
  //     pageBuilder: (_, __, ___) => DetailSubPlotBPageScreen(
  //       subPlotB: null,
  //       areaName: areaName,
  //       plotName: plotName,
  //     ),
  //     transitionsBuilder: (_, animation, __, child) {
  //       return FadeTransition(
  //         opacity: animation,
  //         child: child,
  //       );
  //     },
  //   ),
  // );
  // },
  //         style: ElevatedButton.styleFrom(
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(8.r),
  //           ),
  //           backgroundColor: colorButtonAccentGreen,
  //         ),
  //         child: const Text(
  //           'Edit',
  //           style: TextStyle(
  //             color: colorPrimaryWhite,
  //             fontWeight: FontWeight.w600,
  //           ),
  //         ),
  //       ),
  //     );
  //   }
  // }
}
