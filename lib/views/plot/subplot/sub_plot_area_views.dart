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
                  Icon(
                    CupertinoIcons.arrow_clockwise,
                    color: colorPrimaryBlack,
                    size: 32.sp,
                  ),
                ],
              ),
            ),
            fetchSubPlotListData(),
          ],
        ),
      ),
    );
  }

  Widget fetchSubPlotListData() {
    return Container(
      height: 400.h,
      width: 1.sw,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 4,
        itemBuilder: (context, index) {
          String subPlotAlphabet = String.fromCharCode(index + 65);

          return Container(
            width: 1.sw,
            height: 85.h,
            margin: EdgeInsets.symmetric(vertical: 8.h),
            child: Card(
              elevation: 0.5,
              color: colorPrimaryWhite,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
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
                          width: 170.w,
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
                          width: 170.w,
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
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) =>
                                const DetailSubPlotAPageScreen(),
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
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
