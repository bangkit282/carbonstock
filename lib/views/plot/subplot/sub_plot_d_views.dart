part of '../../views.dart';

class SubPlotDListPageViews extends StatefulWidget {
  const SubPlotDListPageViews({
    super.key,
    required this.areaName,
    required this.plotData,
  });

  final String areaName;
  final Datum plotData;

  @override
  State<SubPlotDListPageViews> createState() => _SubPlotDListPageViewsState();
}

class _SubPlotDListPageViewsState extends State<SubPlotDListPageViews>
    with SingleTickerProviderStateMixin {
  final SubPlotController _controller = Get.find();

  RxInt indexPohon = 0.obs;
  RxInt indexNekromas = 0.obs;
  RxInt indexTanah = 0.obs;
  RxInt currentPage = 0.obs;

  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);

    tabController.addListener(() {
      setState(() {
        currentPage.value = tabController.index;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: colorSecondaryGreen,
        title: Text(
          'Sub Plot D',
          style: TextStyle(
            fontSize: 20.sp,
            color: colorPrimaryWhite,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pushReplacement(
            PageRouteBuilder(
              pageBuilder: (_, __, ___) => SubPlotAreaScreenViews(
                areaName: widget.areaName,
                plotData: widget.plotData,
              ),
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
        bottom: TabBar(
          controller: tabController,
          unselectedLabelColor: colorPrimaryBlack,
          indicatorColor: colorPrimaryBlack,
          labelColor: colorPrimaryBlack,
          labelStyle: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
          tabs: const [
            Tab(text: 'Pohon'),
            Tab(text: 'Nekromas'),
            Tab(text: 'Tanah'),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 16.w,
              right: 16.w,
              top: 24.h,
            ),
            child: fetchPohonList(),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 16.w,
              right: 16.w,
              top: 24.h,
            ),
            child: fetchNekromasList(),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 16.w,
              right: 16.w,
              top: 24.h,
            ),
            child: fetchTanahList(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (currentPage.value == 0) {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (_, __, ___) => DetailDPohonPageScreen(
                  type: 0,
                  indexD: null,
                  indexPohon: null,
                  plotData: widget.plotData,
                  areaName: widget.areaName,
                  subPlotDModel: null,
                  subPlotDPohonModel: null,
                ),
              ),
            );
          } else if (currentPage.value == 1) {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (_, __, ___) => DetailNekromasPageScreen(
                  type: 0,
                  indexD: null,
                  indexNekromas: null,
                  plotData: widget.plotData,
                  areaName: widget.areaName,
                  subPlotDModel: null,
                  subPlotDNekromasModel: null,
                ),
              ),
            );
          } else if (currentPage.value == 2) {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (_, __, ___) => DetailTanahPageScreen(
                  type: 0,
                  indexD: null,
                  indexTanah: null,
                  plotData: widget.plotData,
                  areaName: widget.areaName,
                  subPlotDModel: null,
                  subPlotDTanahModel: null,
                ),
              ),
            );
          }
        },
        elevation: 0,
        shape: const CircleBorder(),
        backgroundColor: colorButtonAccentGreen,
        child: const Icon(
          CupertinoIcons.add,
          color: colorPrimaryWhite,
          size: 36,
        ),
      ),
    );
  }

  ValueListenableBuilder fetchPohonList() {
    return ValueListenableBuilder<Box<SubPlotAreaDPohonModel>>(
      valueListenable: _controller.contactDPohonBox.listenable(),
      builder: (context, box, _) {
        if (_controller.contactDPohonBox.values.isNotEmpty) {
          return SizedBox(
            width: 1.sw,
            height: 1.sh,
            child: GetBuilder<SubPlotController>(
              builder: (controller) {
                return ListView.builder(
                  itemCount: controller.contactDPohonBox.values.length,
                  itemBuilder: (context, index) {
                    indexPohon.value =
                        controller.contactDPohonBox.values.toList().indexWhere(
                              (e) => e.plotId == widget.plotData.id.toString(),
                            );

                    SubPlotAreaDModel? subPlotDModel =
                        controller.contactDBox.values.toList().firstWhereOrNull(
                            (e) => e.plotId == '${widget.plotData.id}');

                    if (subPlotDModel != null) {
                      return buildPohonWidget(
                        subPlotDModel,
                        controller.contactDPohonBox.values.toList()[index],
                        index,
                      );
                    } else {
                      return Center(
                        child: SizedBox(
                          width: 1.sw,
                          height: 600.h,
                          child: Column(
                            children: [
                              Image.asset(
                                  'assets/images/placeholder_isempty.png'),
                              const SizedBox(height: 8),
                              Text(
                                'Data Masih Kosong',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: colorPrimaryBlack,
                                  fontSize: 16.sp,
                                ),
                              ),
                              SizedBox(height: 8.h),
                              Text(
                                'Data sub-plot Nekromas belum ada',
                                style: TextStyle(
                                  color: colorSecondaryGrey3,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                  },
                );
              },
            ),
          );
        } else {
          return Center(
            child: SizedBox(
              width: 1.sw,
              height: 600.h,
              child: Column(
                children: [
                  Image.asset('assets/images/placeholder_isempty.png'),
                  const SizedBox(height: 8),
                  Text(
                    'Data Masih Kosong',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: colorPrimaryBlack,
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Data sub-plot Pohon belum ada',
                    style: TextStyle(
                      color: colorSecondaryGrey3,
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }

  ValueListenableBuilder fetchNekromasList() {
    return ValueListenableBuilder<Box<SubPlotAreaDNekromasModel>>(
      valueListenable: _controller.contactDNekromasBox.listenable(),
      builder: (context, box, _) {
        if (_controller.contactDNekromasBox.values.isNotEmpty) {
          return SizedBox(
            width: 1.sw,
            height: 1.sh,
            child: GetBuilder<SubPlotController>(
              builder: (controller) {
                return ListView.builder(
                  itemCount: controller.contactDNekromasBox.values.length,
                  itemBuilder: (context, index) {
                    indexNekromas.value = controller.contactDNekromasBox.values
                        .toList()
                        .indexWhere(
                          (e) => e.plotId == widget.plotData.id.toString(),
                        );

                    SubPlotAreaDModel? subPlotDModel =
                        controller.contactDBox.values.toList().firstWhereOrNull(
                            (e) => e.plotId == '${widget.plotData.id}');

                    if (subPlotDModel != null) {
                      return buildNekromasWidget(
                        subPlotDModel,
                        controller.contactDNekromasBox.values.toList()[index],
                        index,
                      );
                    } else {
                      return Center(
                        child: SizedBox(
                          width: 1.sw,
                          height: 600.h,
                          child: Column(
                            children: [
                              Image.asset(
                                  'assets/images/placeholder_isempty.png'),
                              const SizedBox(height: 8),
                              Text(
                                'Data Masih Kosong',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: colorPrimaryBlack,
                                  fontSize: 16.sp,
                                ),
                              ),
                              SizedBox(height: 8.h),
                              Text(
                                'Data sub-plot Nekromas belum ada',
                                style: TextStyle(
                                  color: colorSecondaryGrey3,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                  },
                );
              },
            ),
          );
        } else {
          return Center(
            child: SizedBox(
              width: 1.sw,
              height: 600.h,
              child: Column(
                children: [
                  Image.asset('assets/images/placeholder_isempty.png'),
                  const SizedBox(height: 8),
                  Text(
                    'Data Masih Kosong',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: colorPrimaryBlack,
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Data sub-plot Nekromas belum ada',
                    style: TextStyle(
                      color: colorSecondaryGrey3,
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }

  ValueListenableBuilder fetchTanahList() {
    return ValueListenableBuilder<Box<SubPlotAreaDTanahModel>>(
      valueListenable: _controller.contactDTanahBox.listenable(),
      builder: (context, box, _) {
        if (_controller.contactDTanahBox.values.isNotEmpty) {
          indexTanah.value =
              _controller.contactDTanahBox.values.toList().indexWhere(
                    (e) => e.plotId == widget.plotData.id.toString(),
                  );

          return SizedBox(
            width: 1.sw,
            height: 1.sh,
            child: GetBuilder<SubPlotController>(
              builder: (controller) {
                return ListView.builder(
                  itemCount: controller.contactDTanahBox.values.length,
                  itemBuilder: (context, index) {
                    indexTanah.value =
                        controller.contactDTanahBox.values.toList().indexWhere(
                              (e) => e.plotId == widget.plotData.id.toString(),
                            );

                    SubPlotAreaDModel? subPlotDModel =
                        controller.contactDBox.values.toList().firstWhereOrNull(
                            (e) => e.plotId == '${widget.plotData.id}');

                    if (subPlotDModel != null) {
                      return buildTanahWidget(
                        subPlotDModel,
                        controller.contactDTanahBox.values.toList()[index],
                        index,
                      );
                    } else {
                      return Center(
                        child: SizedBox(
                          width: 1.sw,
                          height: 600.h,
                          child: Column(
                            children: [
                              Image.asset(
                                  'assets/images/placeholder_isempty.png'),
                              const SizedBox(height: 8),
                              Text(
                                'Data Masih Kosong',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: colorPrimaryBlack,
                                  fontSize: 16.sp,
                                ),
                              ),
                              SizedBox(height: 8.h),
                              Text(
                                'Data sub-plot Tanah belum ada',
                                style: TextStyle(
                                  color: colorSecondaryGrey3,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                  },
                );
              },
            ),
          );
        } else {
          return Center(
            child: SizedBox(
              width: 1.sw,
              height: 600.h,
              child: Column(
                children: [
                  Image.asset('assets/images/placeholder_isempty.png'),
                  const SizedBox(height: 8),
                  Text(
                    'Data Masih Kosong',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: colorPrimaryBlack,
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Data sub-plot Tanah belum ada',
                    style: TextStyle(
                      color: colorSecondaryGrey3,
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }

  Card buildPohonWidget(
    SubPlotAreaDModel dataModel,
    SubPlotAreaDPohonModel dataModelPohon,
    int index,
  ) {
    // d.log(dataModelPohon.toString(), name: 'test');

    return Card(
      elevation: 0.5,
      child: InkWell(
        onTap: () {
          if (_controller.contactDBox.values.toList().isNotEmpty) {
            if (_controller.contactDPohonBox.values.toList().isNotEmpty) {
              int indexD = _controller.contactDBox.values
                  .toList()
                  .indexWhere((element) => element == dataModel);

              Get.to(
                () => DetailDPohonPageScreen(
                  type: 1,
                  indexD: indexD,
                  indexPohon: indexPohon.value,
                  plotData: widget.plotData,
                  areaName: widget.areaName,
                  subPlotDModel: dataModel,
                  subPlotDPohonModel: dataModelPohon,
                ),
              );
            }
          }

          // Navigator.push(
          //   context,
          //   PageRouteBuilder(
          //     pageBuilder: (_, __, ___) => DetailSubPlotDPageScreen(
          //       type: 1,
          //       indexD: indexPohon.value,
          //       indexPohon: indexPohon.value,
          //       indexNekromas: indexNekromas.value,
          //       indexTanah: indexTanah.value,
          //       plotId: widget.plotData.id.toString(),
          //       plotName: widget.plotData.namaPlot,
          //       areaName: widget.areaName,
          //       subPlotDModel: dataModel,
          //       subPlotDPohonModel: dataModelPohon,
          //       subPlotDNekromasModel: null,
          //       subPlotDTanahModel: null,
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
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            children: [
              Container(
                width: 70.w,
                height: 70.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/scatter_plot.png'),
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              SizedBox(
                width: 1.sw - 200.w,
                child: Text(
                  'Pohon ${index + 1}',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: colorPrimaryBlack,
                    fontSize: 14.sp,
                  ),
                ),
              ),
              const Spacer(),
              Icon(
                CupertinoIcons.arrow_right,
                color: colorPrimaryBlack,
                size: 24.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Card buildNekromasWidget(
    SubPlotAreaDModel dataModel,
    SubPlotAreaDNekromasModel dataModelNekromas,
    int index,
  ) {
    // d.log(dataModelNekromas.toString(), name: 'test');

    return Card(
      elevation: 0.5,
      child: InkWell(
        onTap: () {
          if (_controller.contactDBox.values.toList().isNotEmpty) {
            if (_controller.contactDNekromasBox.values.toList().isNotEmpty) {
              int indexD = _controller.contactDBox.values
                  .toList()
                  .indexWhere((element) => element == dataModel);

              Get.to(
                () => DetailNekromasPageScreen(
                  type: 1,
                  indexD: indexD,
                  indexNekromas: indexNekromas.value,
                  plotData: widget.plotData,
                  areaName: widget.areaName,
                  subPlotDModel: dataModel,
                  subPlotDNekromasModel: dataModelNekromas,
                ),
              );
            }
          }

          // Navigator.push(
          //   context,
          //   PageRouteBuilder(
          //     pageBuilder: (_, __, ___) => DetailSubPlotDPageScreen(
          //       type: 1,
          //       indexD: indexPohon.value,
          //       indexPohon: indexPohon.value,
          //       indexNekromas: indexNekromas.value,
          //       indexTanah: indexTanah.value,
          //       plotId: widget.plotData.id.toString(),
          //       plotName: widget.plotData.namaPlot,
          //       areaName: widget.areaName,
          //       subPlotDModel: dataModel,
          //       subPlotDPohonModel: null,
          //       subPlotDNekromasModel: dataModelNekromas,
          //       subPlotDTanahModel: null,
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
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            children: [
              Container(
                width: 70.w,
                height: 70.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/scatter_plot.png'),
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              SizedBox(
                width: 1.sw - 200.w,
                child: Text(
                  'Nekromas ${index + 1}',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: colorPrimaryBlack,
                    fontSize: 14.sp,
                  ),
                ),
              ),
              const Spacer(),
              Icon(
                CupertinoIcons.arrow_right,
                color: colorPrimaryBlack,
                size: 24.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Card buildTanahWidget(
    SubPlotAreaDModel dataModel,
    SubPlotAreaDTanahModel dataModelTanah,
    int index,
  ) {
    // d.log(dataModelTanah.toString(), name: 'test');

    return Card(
      elevation: 0.5,
      child: InkWell(
        onTap: () {
          if (_controller.contactDBox.values.toList().isNotEmpty) {
            if (_controller.contactDTanahBox.values.toList().isNotEmpty) {
              int indexD = _controller.contactDBox.values
                  .toList()
                  .indexWhere((element) => element == dataModel);

              Get.to(
                () => DetailTanahPageScreen(
                  type: 1,
                  indexD: indexD,
                  indexTanah: indexTanah.value,
                  plotData: widget.plotData,
                  areaName: widget.areaName,
                  subPlotDModel: dataModel,
                  subPlotDTanahModel: dataModelTanah,
                ),
              );
            }
          }

          // Navigator.push(
          //   context,
          //   PageRouteBuilder(
          //     pageBuilder: (_, __, ___) => DetailSubPlotDPageScreen(
          //       type: 1,
          //       indexD: indexPohon.value,
          //       indexPohon: indexPohon.value,
          //       indexNekromas: indexNekromas.value,
          //       indexTanah: indexTanah.value,
          //       plotId: widget.plotData.id.toString(),
          //       plotName: widget.plotData.namaPlot,
          //       areaName: widget.areaName,
          //       subPlotDModel: dataModel,
          //       subPlotDPohonModel: null,
          //       subPlotDNekromasModel: null,
          //       subPlotDTanahModel: dataModelTanah,
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
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            children: [
              Container(
                width: 70.w,
                height: 70.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/scatter_plot.png'),
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              SizedBox(
                width: 1.sw - 200.w,
                child: Text(
                  'Tanah ${index + 1}',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: colorPrimaryBlack,
                    fontSize: 14.sp,
                  ),
                ),
              ),
              const Spacer(),
              Icon(
                CupertinoIcons.arrow_right,
                color: colorPrimaryBlack,
                size: 24.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
