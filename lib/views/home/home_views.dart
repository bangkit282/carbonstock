part of '../views.dart';

class HomeScreenViews extends StatefulWidget {
  const HomeScreenViews({super.key});

  @override
  State<HomeScreenViews> createState() => _HomeScreenViewsState();
}

class _HomeScreenViewsState extends State<HomeScreenViews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: fetchAreaListData(),
      appBar: AppBar(
        backgroundColor: colorSecondaryGreen,
        title: Text(
          'Dashboard',
          style: TextStyle(
            color: colorPrimaryWhite,
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (_, __, ___) => AddAreaScreenViews(),
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
  //       builder: (context, snapshot) {
  //         if (!snapshot.hasData) return const SizedBox();

  //         final area = snapshot.requireData;

  //         return SizedBox(
  //           width: 1.sw,
  //           height: 1.sh - 80.h,
  //           child: ListView.builder(
  //             itemCount: area.length,
  //             itemBuilder: (context, index) {
  //               return buildAreaWidget(area[index]);
  //             },
  //           ),
  //         );
  //       });
  // }

  ListTile buildAreaWidget(AreaModel area) {
    return ListTile(
      title: Text(
        area.areaName,
        style: TextStyle(
          color: colorPrimaryBlack,
          fontSize: 14.sp,
        ),
      ),
      subtitle: Row(
        children: [
          Image.asset('assets/images/dummy_image.png'),
          Text(
            area.areaLocation,
            style: TextStyle(
              color: colorPrimaryBlack,
              fontSize: 10.sp,
            ),
          ),
        ],
      ),
    );
  }
}
