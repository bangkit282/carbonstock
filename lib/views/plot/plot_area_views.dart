part of '../views.dart';

class PlotAreaScreenViews extends StatefulWidget {
  const PlotAreaScreenViews({super.key});

  @override
  State<PlotAreaScreenViews> createState() => _PlotAreaScreenViewsState();
}

class _PlotAreaScreenViewsState extends State<PlotAreaScreenViews> {
  final PlotController _plotController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: fetchPlotListData(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: colorSecondaryGreen,
        centerTitle: false,
        title: Text(
          'Plot Area',
          style: TextStyle(
            fontSize: 20.sp,
            color: colorPrimaryWhite,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        onPressed: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (_, __, ___) => const AddPlotScreenViews(),
              transitionsBuilder: (_, animation, __, child) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
            ),
          );
        },
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

  StreamBuilder fetchPlotListData() {
    return StreamBuilder<List<PlotModel>>(
      stream: _plotController.readAllPlotAsStream(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text('Error loading data ${snapshot.error}'),
          );
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(
            child: SizedBox(
              width: 1.sw,
              height: 300.h,
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
                    'Silakan input data plot area terlebih dahulu',
                    style: TextStyle(
                      color: colorSecondaryGrey2,
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        final plot = snapshot.requireData;

        return Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          width: 1.sw,
          height: 1.sh - 80.h,
          child: ListView.builder(
            itemCount: plot.length,
            itemBuilder: (context, index) {
              return buildPlotWidget(index);
            },
          ),
        );
      },
    );
  }

  Card buildPlotWidget(int index) {
    String plotName = 'Plot ${index + 1}';

    return Card(
      elevation: 0.5,
      color: colorPrimaryWhite,
      child: InkWell(
        onTap: () {
          Get.to(
            () => SubPlotAreaScreenViews(
              areaName: 'Area Dayeuhkolot',
              plotName: plotName,
            ),
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
