part of '../../views.dart';

class SubPlotCListPageViews extends StatefulWidget {
  const SubPlotCListPageViews({
    super.key,
    required this.areaName,
    required this.plotData,
  });

  final String areaName;
  final Datum plotData;

  @override
  State<SubPlotCListPageViews> createState() => _SubPlotCListPageViewsState();
}

class _SubPlotCListPageViewsState extends State<SubPlotCListPageViews> {
  final SubPlotController _controller = Get.find();
  RxInt indexC = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPrimaryBackground,
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: colorSecondaryGreen,
        title: Text(
          'Sub Plot C - Tiang',
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (_, __, ___) => DetailSubPlotCPageScreen(
                type: 0,
                indexC: indexC.value,
                plot: widget.plotData,
                areaName: widget.areaName,
                model: null,
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
        elevation: 0,
        shape: const CircleBorder(),
        backgroundColor: colorButtonAccentGreen,
        child: const Icon(
          CupertinoIcons.add,
          color: colorPrimaryWhite,
          size: 36,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 24.h),
        child: fetchTiangList(),
      ),
    );
  }

  ValueListenableBuilder fetchTiangList() {
    return ValueListenableBuilder<Box<SubPlotAreaCModel>>(
      valueListenable: _controller.contactCBox.listenable(),
      builder: (context, box, _) {
        RxList<SubPlotAreaCModel> list = box.values
            .where((element) => element.plotId == widget.plotData.id.toString())
            .toList()
            .obs;

        if (list.isNotEmpty) {
          indexC.value = list.indexWhere(
            (e) => e.plotId == widget.plotData.id.toString(),
          );

          return SizedBox(
            width: 1.sw,
            height: 1.sh,
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                // d.log(
                //   '${list.toString()}',
                //   name: 'length',
                // );

                return buildTiangWidget(list[index], index);
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
                    'Data sub-plot Pancang belum ada',
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

  Card buildTiangWidget(SubPlotAreaCModel model, int index) {
    return Card(
      elevation: 0.5,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (_, __, ___) => DetailSubPlotCPageScreen(
                type: 1,
                indexC: index,
                plot: widget.plotData,
                areaName: widget.areaName,
                model: model,
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
                  'Tiang ${indexC.value + 1}',
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
