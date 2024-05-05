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
      ),
      body: fetchPlotList(),
    );
  }

  Widget fetchPlotList() {
    String id = _sharedPrefs.getString('id');
    UserModel user = _authController.getSingleUser(id);

    return FutureBuilder(
      future: _plotController.getAllPlot(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.connectionState == ConnectionState.done) {
            Plot data = snapshot.data!;
            List<int> indices = List.empty(growable: true);

            for (int i = 0; i < data.data!.length; i++) {
              for (int j = 0; j < user.listplot.length; j++) {
                if (data.data![i].id == user.listplot[j].id) {
                  indices.add(i);
                  break;
                }
              }
            }

            return SizedBox(
              width: 1.sw,
              height: 1.sh,
              child: ListView.builder(
                itemCount: data.data?.length,
                itemBuilder: (context, index) {
                  int filteredIndex = user.listplot.indexWhere(
                    (element) => element.id == data.data![index].id,
                  );

                  return filteredIndex != -1
                      ? buildPlotWidget(data, data.data![indices[filteredIndex]])
                      : Container();
                },
              ),
            );
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
  }

  // ValueListenableBuilder fetchPlotListData() {
  //   return ValueListenableBuilder(
  //     valueListenable: _plotController.contactBox.listenable(),
  //     builder: (context, plotList, _) {
  //       if (plotList.isEmpty) {
  //         return Center(
  //           child: SizedBox(
  //             width: 1.sw,
  //             height: 600.h,
  //             child: Column(
  //               children: [
  //                 Image.asset('assets/images/placeholder_isempty.png'),
  //                 const SizedBox(height: 8),
  //                 Text(
  //                   'Data Masih Kosong',
  //                   style: TextStyle(
  //                     fontWeight: FontWeight.w700,
  //                     color: colorPrimaryBlack,
  //                     fontSize: 16.sp,
  //                   ),
  //                 ),
  //                 SizedBox(height: 8.h),
  //                 Text(
  //                   'Silakan input data plot area terlebih dahulu',
  //                   style: TextStyle(
  //                     color: colorSecondaryGrey2,
  //                     fontSize: 12.sp,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         );
  //       } else {
  //         return Container(
  //           margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
  //           width: 1.sw,
  //           height: 1.sh - 80.h,
  //           child: ListView.builder(
  //             itemCount: _plotController.contactBox.length,
  //             itemBuilder: (context, index) {
  //               return buildPlotWidget(plotList);
  //             },
  //           ),
  //         );
  //       }
  //     },
  //   );
  // }

  Card buildPlotWidget(Plot plot, Datum plotData) {
    String plotName = 'Plot ${plotData.namaPlot}';

    return Card(
      elevation: 0.5,
      color: colorPrimaryWhite,
      child: InkWell(
        onTap: () {
          // d.log('$plot', name: 'plot');

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
