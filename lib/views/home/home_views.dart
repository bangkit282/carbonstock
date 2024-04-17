part of '../views.dart';

class HomeScreenViews extends StatefulWidget {
  const HomeScreenViews({super.key});

  @override
  State<HomeScreenViews> createState() => _HomeScreenViewsState();
}

class _HomeScreenViewsState extends State<HomeScreenViews> {
  final AreaController _areaController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: fetchAreaListData(),
      backgroundColor: colorPrimaryBackground,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: colorSecondaryGreen,
        title: Text(
          'Dashboard',
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
              pageBuilder: (_, __, ___) => const AddHomeScreenViews(),
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

  // StreamBuilder fetchAreaListData() {
  //   return StreamBuilder<List<AreaModel>>(
  //     stream: _areaController.readAllAreaAsStream(),
  //     builder: (context, snapshot) {
  //       if (snapshot.hasError) {
  //         return Center(
  //           child: Text('Error loading data ${snapshot.error}'),
  //         );
  //       }

  //       if (!snapshot.hasData || snapshot.data!.isEmpty) {
  //         return const Center(
  //           child: Text('No data available'),
  //         );
  //       }

  //       final area = snapshot.requireData;
  //       // log('Builder function called with $area');

  //       return Container(
  //         margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
  //         width: 1.sw,
  //         height: 1.sh - 80.h,
  //         child: ListView.builder(
  //           itemCount: area.length,
  //           itemBuilder: (context, index) {
  //             return buildAreaWidget(area[index]);
  //           },
  //         ),
  //       );
  //     },
  //   );
  // }

  Card buildAreaWidget(AreaModel area) {
    return Card(
      elevation: 1,
      color: colorPrimaryWhite,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        child: Row(
          children: [
            Container(
              width: 70.w,
              height: 70.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                image: DecorationImage(image: FileImage(File(area.areaImage))),
              ),
            ),
            SizedBox(width: 16.w),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 1.sw - 200.w,
                  child: Text(
                    area.areaName,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: colorPrimaryBlack,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                SizedBox(height: 4.h),
                SizedBox(
                  width: 1.sw - 200.w,
                  child: Text(
                    area.areaLocation,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: colorPrimaryBlack,
                      fontSize: 10.sp,
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            const Icon(
              CupertinoIcons.arrow_right,
              color: colorPrimaryBlack,
            ),
          ],
        ),
      ),
    );
  }
}
