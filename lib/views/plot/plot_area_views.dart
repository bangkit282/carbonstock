part of '../views.dart';

class PlotAreaScreenViews extends StatefulWidget {
  const PlotAreaScreenViews({super.key});

  @override
  State<PlotAreaScreenViews> createState() => _PlotAreaScreenViewsState();
}

class _PlotAreaScreenViewsState extends State<PlotAreaScreenViews> {
  final PlotController _plotController = Get.find();
  final AuthController _authController = Get.find();

  final SharedPreferenceService _sharedPrefs = SharedPreferenceService();

  Rx<Plot> plotObs = Plot().obs;

  Future<void> _onRefresh() async {
    await Future.delayed(const Duration(seconds: 2));
    plotObs.value = await _plotController.getAllPlot();
  }

  @override
  void initState() {
    _plotController.getAllPlot();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPrimaryBackground,
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: colorSecondaryGreen,
        title: Text(
          'Plot Area',
          style: TextStyle(
            fontSize: 20.sp,
            color: colorPrimaryWhite,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 16.w),
            child: ElevatedButton(
              onPressed: () {
                Get.dialog(
                  AlertDialog(
                    title: Text(
                      'Logout',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18.sp,
                      ),
                    ),
                    content: Text(
                      'Anda yakin untuk Logout dari CarbonRangers?',
                      style: TextStyle(
                        fontSize: 14.sp,
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                            color: colorPrimaryBlack,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.snackbar(
                            'CarbonRangers',
                            'See you later, ${_authController.getSingleUser(
                                  _sharedPrefs.getString('id'),
                                ).nama}!',
                            backgroundColor: colorSecondaryGrey1,
                          );

                          Navigator.of(context).pushReplacement(
                            PageRouteBuilder(
                              pageBuilder: (_, __, ___) =>
                                  const LoginScreenViews(),
                              transitionsBuilder: (_, animation, __, child) {
                                return FadeTransition(
                                  opacity: animation,
                                  child: child,
                                );
                              },
                            ),
                          );

                          _sharedPrefs.putInt('isLogin', 0);
                          _sharedPrefs.removeKey('id');
                        },
                        child: Text(
                          'Logout',
                          style: TextStyle(
                            color: Colors.redAccent,
                            fontWeight: FontWeight.w700,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: colorPrimaryBackground,
              ),
              child: Row(
                children: [
                  Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontWeight: FontWeight.w700,
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Icon(
                    CupertinoIcons.arrowshape_turn_up_right_fill,
                    color: Colors.redAccent,
                    size: 16.sp,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: fetchPlotList(),
      ),
    );
  }

  Widget fetchPlotList() {
    if (_sharedPrefs.checkKey('id')) {
      String id = _sharedPrefs.getString('id');
      UserModel user = _authController.getSingleUser(id);

      return FutureBuilder(
        future: _plotController.getAllPlot(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.connectionState == ConnectionState.done) {
              Plot data = snapshot.data!;
              List<int> indices = List.empty(growable: true);

              // d.log(data.toString(), name: 'plot-where-error-is-found');

              for (int i = 0; i < data.data!.length; i++) {
                for (int j = 0; j < user.listplot.length; j++) {
                  if (data.data![i].id == user.listplot[j].id) {
                    indices.add(i);
                    break;
                  }
                }
              }

              // d.log(data.data!.length.toString(),
              // name: 'plot-where-error-is-found');

              if (data.data!.isNotEmpty) {
                plotObs.value = data;

                return SizedBox(
                  width: 1.sw,
                  height: 1.sh,
                  child: ListView.builder(
                    itemCount: plotObs.value.data?.length,
                    itemBuilder: (context, index) {
                      int filteredIndex = user.listplot.indexWhere(
                        (element) => element.id == data.data![index].id,
                      );

                      return filteredIndex != -1
                          ? buildPlotWidget(
                              data,
                              data.data![indices[filteredIndex]],
                            )
                          : Container();
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
                          'Data plot area belum ada, silakan hubungi admin',
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
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator.adaptive());
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
                        'Koneksi Error',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: colorPrimaryBlack,
                          fontSize: 16.sp,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        'Fetching data plot area gagal!',
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
                      'Data plot area belum ada, silakan hubungi admin',
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
                'Data plot area belum ada, silakan hubungi admin',
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
  }

  Card buildPlotWidget(Plot plot, Datum plotData) {
    String plotName = 'Plot ${plotData.namaPlot}';

    return Card(
      elevation: 0.5,
      color: colorPrimaryWhite,
      child: InkWell(
        onTap: () {
          Get.to(
            () => DetailPlotScreenViews(plot: plot, plotData: plotData),
            transition: Transition.cupertino,
          );
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
                  plotName,
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
