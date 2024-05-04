part of '../../views.dart';

class SubPlotAreaScreenViews extends StatefulWidget {
  const SubPlotAreaScreenViews({
    super.key,
    required this.plotId,
    required this.areaName,
    required this.plotName,
  });

  final String plotId;
  final String areaName;
  final String plotName;

  @override
  State<SubPlotAreaScreenViews> createState() => _SubPlotAreaScreenViewsState();
}

class _SubPlotAreaScreenViewsState extends State<SubPlotAreaScreenViews> {
  final SubPlotController _controller = Get.find();
  final RxInt clicked = 0.obs;

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                clicked.value += 1;

                if (clicked.value == 3) {
                  Get.snackbar(
                    'CarbonStock',
                    'Wow, kamu berhasil menemukan Easter Egg!',
                    backgroundColor: Colors.amber,
                    colorText: Colors.black,
                  );

                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => const EasterEggPageViews(),
                      transitionsBuilder: (_, animation, __, child) {
                        return FadeTransition(
                          opacity: animation,
                          child: child,
                        );
                      },
                    ),
                  );

                  clicked.value = 0;
                }
              },
              child: Container(
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
                                .toList()[_controller.contactABox.values
                                    .toList()
                                    .indexWhere((element) =>
                                        element.plotId == widget.plotId)]
                                .uuid
                                .toString()
                            : '',
                        idB: _controller.contactBBox.values.toList().isNotEmpty
                            ? _controller.contactBBox.values
                                .toList()[_controller.contactBBox.values
                                    .toList()
                                    .indexWhere((element) =>
                                        element.plotId == widget.plotId)]
                                .uuid
                                .toString()
                            : '',
                        idC: _controller.contactCBox.values.toList().isNotEmpty
                            ? _controller.contactCBox.values
                                .toList()[_controller.contactCBox.values
                                    .toList()
                                    .indexWhere((element) =>
                                        element.plotId == widget.plotId)]
                                .uuid
                                .toString()
                            : '',
                        idD: _controller.contactDBox.values.toList().isNotEmpty
                            ? _controller.contactDBox.values
                                .toList()[_controller.contactDBox.values
                                    .toList()
                                    .indexWhere((element) =>
                                        element.plotId == widget.plotId)]
                                .uuid
                                .toString()
                            : '',
                        plotId: widget.plotId,
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
      return ValueListenableBuilder(
        valueListenable: _controller.contactABox.listenable(),
        builder: (context, box, _) {
          RxInt indexA = 0.obs;
          RxInt indexSemai = 0.obs;
          RxInt indexSeresah = 0.obs;
          RxInt indexTumbuhan = 0.obs;

          RxList<SubPlotAreaAModel> list = box.values
              .where((element) => element.plotId == widget.plotId)
              .toList()
              .obs;

          if (list.isNotEmpty) {
            for (var e in list) {
              indexA.value = list.indexWhere((e) => e.plotId == widget.plotId);
              indexSemai.value = e.subPlotAModels!
                  .indexWhere((element) => element.plotId == widget.plotId);
              indexSeresah.value = e.subPlotAModels!
                  .indexWhere((element) => element.plotId == widget.plotId);
              indexTumbuhan.value = e.subPlotAModels!
                  .indexWhere((element) => element.plotId == widget.plotId);
            }
          }

          return Obx(
            () {
              return list.isNotEmpty
                  ? Container(
                      margin: EdgeInsets.only(left: 16.w),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, __, ___) =>
                                  DetailSubPlotAPageScreen(
                                indexA: indexA.value,
                                indexSemai: indexSemai.value,
                                indexSeresah: indexSeresah.value,
                                indexTumbuhan: indexTumbuhan.value,
                                plotId: widget.plotId,
                                areaName: widget.areaName,
                                plotName: widget.plotName,
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
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) =>
                                DetailSubPlotAPageScreen(
                              indexA: indexA.value,
                              indexSemai: indexSemai.value,
                              indexSeresah: indexSeresah.value,
                              indexTumbuhan: indexTumbuhan.value,
                              plotId: widget.plotId,
                              areaName: widget.areaName,
                              plotName: widget.plotName,
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
          RxInt indexB = 0.obs;

          RxList list = box.values
              .where((element) => element.plotId == widget.plotId)
              .toList()
              .obs;

          if (list.isNotEmpty) {
            indexB.value = list.indexWhere((e) => e.plotId == widget.plotId);
          }

          return Obx(
            () {
              return list.isNotEmpty
                  ? Container(
                      margin: EdgeInsets.only(left: 16.w),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (_, __, ___) =>
                                  DetailSubPlotBPageScreen(
                                indexB: indexB.value,
                                plotId: widget.plotId,
                                areaName: widget.areaName,
                                plotName: widget.plotName,
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
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) =>
                                DetailSubPlotBPageScreen(
                              indexB: indexB.value,
                              plotId: widget.plotId,
                              areaName: widget.areaName,
                              plotName: widget.plotName,
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
    } else if (plotAlphabet == 'C') {
      return ValueListenableBuilder(
        valueListenable: _controller.contactCBox.listenable(),
        builder: (context, box, _) {
          RxInt indexC = 0.obs;

          RxList list = box.values
              .where((element) => element.plotId == widget.plotId)
              .toList()
              .obs;

          if (list.isNotEmpty) {
            indexC.value = list.indexWhere((e) => e.plotId == widget.plotId);
          }

          return Obx(
            () {
              return list.isNotEmpty
                  ? Container(
                      margin: EdgeInsets.only(left: 16.w),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (_, __, ___) =>
                                  DetailSubPlotCPageScreen(
                                indexC: indexC.value,
                                plotId: widget.plotId,
                                areaName: widget.areaName,
                                plotName: widget.plotName,
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
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) =>
                                DetailSubPlotCPageScreen(
                              indexC: indexC.value,
                              plotId: widget.plotId,
                              areaName: widget.areaName,
                              plotName: widget.plotName,
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
    } else if (plotAlphabet == 'D') {
      return ValueListenableBuilder(
        valueListenable: _controller.contactDBox.listenable(),
        builder: (context, box, _) {
          RxInt indexD = 0.obs;
          RxInt indexPohon = 0.obs;
          RxInt indexNekromas = 0.obs;
          RxInt indexTanah = 0.obs;

          RxList<SubPlotAreaDModel> list = box.values
              .where((element) => element.plotId == widget.plotId)
              .toList()
              .obs;

          if (list.isNotEmpty) {
            for (var e in list) {
              indexD.value = list.indexWhere((e) => e.plotId == widget.plotId);
              indexPohon.value = e.subPlotDModels!
                  .indexWhere((element) => element.plotId == widget.plotId);
              indexNekromas.value = e.subPlotDModels!
                  .indexWhere((element) => element.plotId == widget.plotId);
              indexTanah.value = e.subPlotDModels!
                  .indexWhere((element) => element.plotId == widget.plotId);
            }
          }

          return Obx(
            () {
              return list.isNotEmpty
                  ? Container(
                      margin: EdgeInsets.only(left: 16.w),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (_, __, ___) =>
                                  DetailSubPlotDPageScreen(
                                indexD: indexD.value,
                                indexPohon: indexPohon.value,
                                indexNekromas: indexNekromas.value,
                                indexTanah: indexTanah.value,
                                plotId: widget.plotId,
                                areaName: widget.areaName,
                                plotName: widget.plotName,
                                subPlotDList: SubPlotAreaDB.getAllSubPlotD(),
                                subPlotDNekromasList:
                                    SubPlotAreaDB.getAllSubPlotNekromas(),
                                subPlotDTanahList:
                                    SubPlotAreaDB.getAllSubPlotTanah(),
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
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) =>
                                DetailSubPlotDPageScreen(
                              indexD: indexD.value,
                              indexPohon: indexPohon.value,
                              indexNekromas: indexNekromas.value,
                              indexTanah: indexTanah.value,
                              plotId: widget.plotId,
                              plotName: widget.plotName,
                              areaName: widget.areaName,
                              subPlotDList: SubPlotAreaDB.getAllSubPlotD(),
                              subPlotDNekromasList:
                                  SubPlotAreaDB.getAllSubPlotNekromas(),
                              subPlotDTanahList:
                                  SubPlotAreaDB.getAllSubPlotTanah(),
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
    } else {
      return Container();
    }
  }
}
