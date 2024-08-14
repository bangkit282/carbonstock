part of '../../views.dart';

class SubPlotAreaScreenViews extends StatefulWidget {
  const SubPlotAreaScreenViews({
    super.key,
    required this.areaName,
    required this.plotData,
  });

  final Datum plotData;
  final String areaName;

  @override
  State<SubPlotAreaScreenViews> createState() => _SubPlotAreaScreenViewsState();
}

class _SubPlotAreaScreenViewsState extends State<SubPlotAreaScreenViews> {
  final SubPlotController _controller = Get.find();
  final RxInt clicked = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPrimaryBackground,
      extendBody: true,
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: Text(
          'Sub Plot',
          style: TextStyle(
            color: colorPrimaryWhite,
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pushReplacement(
            PageRouteBuilder(
              pageBuilder: (_, __, ___) => const PlotAreaScreenViews(),
              transitionsBuilder: (_, animation, __, child) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
            ),
          ),
          icon: const Icon(
            CupertinoIcons.back,
            color: Colors.white,
          ),
        ),
        backgroundColor: colorSecondaryGreen,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(24.r),
              child: Column(
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
            ),
            fetchSubPlotListData(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => SummaryPageViews(
                        idA: _controller.contactABox.values.toList().isNotEmpty
                            ? _controller.contactABox.values
                                        .toList()
                                        .indexWhere((element) =>
                                            element.plotId ==
                                            widget.plotData.id.toString()) !=
                                    -1
                                ? _controller.contactABox
                                    .getAt(_controller.contactABox.values
                                        .toList()
                                        .indexWhere((element) =>
                                            element.plotId ==
                                            widget.plotData.id.toString()))
                                    ?.uuid
                                    .toString()
                                : ''
                            : '',
                        idB: _controller.contactBBox.values.toList().isNotEmpty
                            ? _controller.contactBBox.values
                                        .toList()
                                        .indexWhere((element) =>
                                            element.plotId ==
                                            widget.plotData.id.toString()) !=
                                    -1
                                ? _controller.contactBBox
                                    .getAt(_controller.contactBBox.values
                                        .toList()
                                        .indexWhere((element) =>
                                            element.plotId ==
                                            widget.plotData.id.toString()))
                                    ?.uuid
                                    .toString()
                                : ''
                            : '',
                        idC: _controller.contactCBox.values.toList().isNotEmpty
                            ? _controller.contactCBox.values
                                        .toList()
                                        .indexWhere((element) =>
                                            element.plotId ==
                                            widget.plotData.id.toString()) !=
                                    -1
                                ? _controller.contactCBox
                                    .getAt(_controller.contactCBox.values
                                        .toList()
                                        .indexWhere((element) =>
                                            element.plotId ==
                                            widget.plotData.id.toString()))
                                    ?.uuid
                                    .toString()
                                : ''
                            : '',
                        idD: _controller.contactDBox.values.toList().isNotEmpty
                            ? _controller.contactDBox.values
                                        .toList()
                                        .indexWhere((element) =>
                                            element.plotId ==
                                            widget.plotData.id.toString()) !=
                                    -1
                                ? _controller.contactDBox
                                    .getAt(_controller.contactDBox.values
                                        .toList()
                                        .indexWhere((element) =>
                                            element.plotId ==
                                            widget.plotData.id.toString()))
                                    ?.uuid
                                    .toString()
                                : ''
                            : '',
                        plotId: widget.plotData.id.toString(),
                        plotData: widget.plotData,
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
                            '${widget.plotData.namaPlot}, ${widget.areaName}',
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
      return ValueListenableBuilder(
        valueListenable: _controller.contactABox.listenable(),
        builder: (context, box, _) {
          RxInt indexA = 0.obs;
          RxInt indexSemai = 0.obs;
          RxInt indexSeresah = 0.obs;
          RxInt indexTumbuhan = 0.obs;

          RxList<SubPlotAreaAModel> list = _controller.contactABox.values
              .where(
                  (element) => element.plotId == widget.plotData.id.toString())
              .toList()
              .obs;

          RxList<SubPlotAreaASemaiModel> listSemai = _controller
              .contactASemaiBox.values
              .where(
                  (element) => element.plotId == widget.plotData.id.toString())
              .toList()
              .obs;

          RxList<SubPlotAreaASeresahModel> listSeresah = _controller
              .contactASeresahBox.values
              .where(
                  (element) => element.plotId == widget.plotData.id.toString())
              .toList()
              .obs;

          RxList<SubPlotAreaATumbuhanBawahModel> listTumbuhan = _controller
              .contactATumbuhanBox.values
              .where(
                  (element) => element.plotId == widget.plotData.id.toString())
              .toList()
              .obs;

          if (list.isNotEmpty) {
            indexA.value = list.lastIndexWhere(
                (e) => e.plotId == widget.plotData.id.toString());

            if (listSemai.isNotEmpty) {
              indexSemai.value = listSemai.lastIndexWhere(
                  (e) => e.plotId == widget.plotData.id.toString());
            }

            if (listSeresah.isNotEmpty) {
              indexSeresah.value = listSeresah.lastIndexWhere(
                  (e) => e.plotId == widget.plotData.id.toString());
            }

            if (listTumbuhan.isNotEmpty) {
              indexTumbuhan.value = listTumbuhan.lastIndexWhere(
                  (e) => e.plotId == widget.plotData.id.toString());
            }
          }

          return Obx(
            () {
              // d.log('list: $list', name: 'plot');
              return list.isNotEmpty
                  ? Container(
                      margin: EdgeInsets.only(left: 16.w),
                      child: TextButton(
                        onPressed: () {
                          // d.log('$list ${widget.plotData.id.toString()}', name: 'plot');

                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, __, ___) =>
                                  DetailSubPlotAPageScreen(
                                indexA: indexA.value,
                                indexSemai: indexSemai.value,
                                indexSeresah: indexSeresah.value,
                                indexTumbuhan: indexTumbuhan.value,
                                plotId: widget.plotData.id.toString(),
                                areaName: widget.areaName,
                                plotName: widget.plotData.namaPlot,
                                plotAList: SubPlotAreaDB.getAllSubPlotA(),
                                semaiList: SubPlotAreaDB.getAllSubPlotSemai(),
                                seresahList:
                                    SubPlotAreaDB.getAllSubPlotSeresah(),
                                tumbuhanList:
                                    SubPlotAreaDB.getAllSubPlotBawah(),
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
                        child: const Text(
                          'Edit',
                          style: TextStyle(
                            color: colorPrimaryWhite,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    )
                  : TextButton(
                      onPressed: () {
                        // d.log('$list ${widget.plotData.id.toString()}',
                        //     name: 'plot');

                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) =>
                                DetailSubPlotAPageScreen(
                              indexA: indexA.value,
                              indexSemai: indexSemai.value,
                              indexSeresah: indexSeresah.value,
                              indexTumbuhan: indexTumbuhan.value,
                              plotId: widget.plotData.id.toString(),
                              areaName: widget.areaName,
                              plotName: widget.plotData.namaPlot,
                              plotAList: SubPlotAreaDB.getAllSubPlotA(),
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
                      child: const Text(
                        'Tambah',
                        style: TextStyle(
                          color: colorPrimaryWhite,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    );
            },
          );
        },
      );
    } else if (plotAlphabet == 'B') {
      return ValueListenableBuilder(
        valueListenable: _controller.contactBBox.listenable(),
        builder: (context, box, _) {
          RxList list = box.values
              .where(
                  (element) => element.plotId == widget.plotData.id.toString())
              .toList()
              .obs;

          return Obx(
            () {
              return list.isNotEmpty
                  ? Container(
                      margin: EdgeInsets.only(left: 16.w),
                      child: TextButton(
                        onPressed: () {
                          Get.to(
                            () => SubPlotBListPageViews(
                              plotData: widget.plotData,
                              areaName: widget.areaName,
                            ),
                          );
                        },
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          backgroundColor: colorButtonAccentGreen,
                        ),
                        child: const Text(
                          'Edit',
                          style: TextStyle(
                            color: colorPrimaryWhite,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    )
                  : TextButton(
                      onPressed: () {
                        Get.to(
                          () => SubPlotBListPageViews(
                            plotData: widget.plotData,
                            areaName: widget.areaName,
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        backgroundColor: colorButtonAccentGreen,
                      ),
                      child: const Text(
                        'Tambah',
                        style: TextStyle(
                          color: colorPrimaryWhite,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    );
            },
          );
        },
      );
    } else if (plotAlphabet == 'C') {
      return ValueListenableBuilder(
        valueListenable: _controller.contactCBox.listenable(),
        builder: (context, box, _) {
          RxInt indexC = 0.obs;

          RxList list = box.values
              .where(
                  (element) => element.plotId == widget.plotData.id.toString())
              .toList()
              .obs;

          if (list.isNotEmpty) {
            indexC.value = list
                .indexWhere((e) => e.plotId == widget.plotData.id.toString());
          }

          return Obx(
            () {
              return list.isNotEmpty
                  ? Container(
                      margin: EdgeInsets.only(left: 16.w),
                      child: TextButton(
                        onPressed: () {
                          Get.to(
                            () => SubPlotCListPageViews(
                              plotData: widget.plotData,
                              areaName: widget.areaName,
                            ),
                          );
                        },
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          backgroundColor: colorButtonAccentGreen,
                        ),
                        child: const Text(
                          'Edit',
                          style: TextStyle(
                            color: colorPrimaryWhite,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    )
                  : TextButton(
                      onPressed: () {
                        Get.to(
                          () => SubPlotCListPageViews(
                            plotData: widget.plotData,
                            areaName: widget.areaName,
                          ),
                        );
                        // Navigator.push(
                        //   context,
                        //   PageRouteBuilder(
                        //     pageBuilder: (_, __, ___) =>
                        //         DetailSubPlotCPageScreen(
                        //       indexC: indexC.value,
                        //       plotId: widget.plotData.id.toString(),
                        //       areaName: widget.areaName,
                        //       plotName: widget.plotData.namaPlot,
                        //     ),
                        //     transitionsBuilder: (_, animation, __, child) {
                        //       return FadeTransition(
                        //         opacity: animation,
                        //         child: child,
                        //       );
                        //     },
                        //   ),
                        // );
                      },
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        backgroundColor: colorButtonAccentGreen,
                      ),
                      child: const Text(
                        'Tambah',
                        style: TextStyle(
                          color: colorPrimaryWhite,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    );
            },
          );
        },
      );
    } else if (plotAlphabet == 'D') {
      return ValueListenableBuilder(
        valueListenable: _controller.contactDBox.listenable(),
        builder: (context, box, _) {
          RxInt indexD = 0.obs;
          RxInt indexPohon = 0.obs;
          RxInt indexNekromas = 0.obs;
          RxInt indexTanah = 0.obs;

          RxList<SubPlotAreaDModel> list = _controller.contactDBox.values
              .where(
                  (element) => element.plotId == widget.plotData.id.toString())
              .toList()
              .obs;

          RxList<SubPlotAreaDPohonModel> listPohon = _controller
              .contactDPohonBox.values
              .where(
                  (element) => element.plotId == widget.plotData.id.toString())
              .toList()
              .obs;

          RxList<SubPlotAreaDNekromasModel> listNekromas = _controller
              .contactDNekromasBox.values
              .where(
                  (element) => element.plotId == widget.plotData.id.toString())
              .toList()
              .obs;

          RxList<SubPlotAreaDTanahModel> listTanah = _controller
              .contactDTanahBox.values
              .where(
                  (element) => element.plotId == widget.plotData.id.toString())
              .toList()
              .obs;

          if (list.isNotEmpty) {
            indexD.value = list.lastIndexWhere(
                (e) => e.plotId == widget.plotData.id.toString());

            if (listPohon.isNotEmpty) {
              indexPohon.value = listPohon.lastIndexWhere(
                  (e) => e.plotId == widget.plotData.id.toString());
            }

            if (listNekromas.isNotEmpty) {
              indexNekromas.value = listNekromas.lastIndexWhere(
                  (e) => e.plotId == widget.plotData.id.toString());
            }

            if (listTanah.isNotEmpty) {
              indexTanah.value = listTanah.lastIndexWhere(
                  (e) => e.plotId == widget.plotData.id.toString());
            }
          }

          return Obx(
            () {
              return list.isNotEmpty
                  ? Container(
                      margin: EdgeInsets.only(left: 16.w),
                      child: TextButton(
                        onPressed: () {
                          Get.to(
                            () => SubPlotDListPageViews(
                              areaName: widget.areaName,
                              plotData: widget.plotData,
                            ),
                          );

                          // Navigator.push(
                          //   context,
                          //   PageRouteBuilder(
                          //     pageBuilder: (_, __, ___) =>
                          //         DetailSubPlotDPageScreen(
                          //       type: 1,
                          //       indexD: indexD.value,
                          //       indexPohon: indexPohon.value,
                          //       indexNekromas: indexNekromas.value,
                          //       indexTanah: indexTanah.value,
                          //       plotId: widget.plotData.id.toString(),
                          //       areaName: widget.areaName,
                          //       plotName: widget.plotData.namaPlot,
                          //       subPlotDList: SubPlotAreaDB.getAllSubPlotD(),
                          //       subPlotDPohonList:
                          //           SubPlotAreaDB.getAllSubPlotPohon(),
                          //       subPlotDNekromasList:
                          //           SubPlotAreaDB.getAllSubPlotNekromas(),
                          //       subPlotDTanahList:
                          //           SubPlotAreaDB.getAllSubPlotTanah(),
                          //     ),
                          //     transitionsBuilder: (_, animation, __, child) {
                          //       return FadeTransition(
                          //         opacity: animation,
                          //         child: child,
                          //       );
                          //     },
                          //   ),
                          // );
                        },
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          backgroundColor: colorButtonAccentGreen,
                        ),
                        child: const Text(
                          'Edit',
                          style: TextStyle(
                            color: colorPrimaryWhite,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    )
                  : TextButton(
                      onPressed: () {
                        Get.to(
                          () => SubPlotDListPageViews(
                            areaName: widget.areaName,
                            plotData: widget.plotData,
                          ),
                        );

                        // Navigator.push(
                        //   context,
                        //   PageRouteBuilder(
                        //     pageBuilder: (_, __, ___) =>
                        //         DetailSubPlotDPageScreen(
                        //       type: 0,
                        //       indexD: indexD.value,
                        //       indexPohon: indexPohon.value,
                        //       indexNekromas: indexNekromas.value,
                        //       indexTanah: indexTanah.value,
                        //       plotId: widget.plotData.id.toString(),
                        //       plotName: widget.plotData.namaPlot,
                        //       areaName: widget.areaName,
                        //       subPlotDList: SubPlotAreaDB.getAllSubPlotD(),
                        //       subPlotDPohonList:
                        //           SubPlotAreaDB.getAllSubPlotPohon(),
                        //       subPlotDNekromasList:
                        //           SubPlotAreaDB.getAllSubPlotNekromas(),
                        //       subPlotDTanahList:
                        //           SubPlotAreaDB.getAllSubPlotTanah(),
                        //     ),
                        //     transitionsBuilder: (_, animation, __, child) {
                        //       return FadeTransition(
                        //         opacity: animation,
                        //         child: child,
                        //       );
                        //     },
                        //   ),
                        // );
                      },
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        backgroundColor: colorButtonAccentGreen,
                      ),
                      child: const Text(
                        'Tambah',
                        style: TextStyle(
                          color: colorPrimaryWhite,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    );
            },
          );
        },
      );
    } else {
      return Container();
    }
  }
}
