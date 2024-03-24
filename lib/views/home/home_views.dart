part of '../views.dart';

class HomeScreenViews extends StatefulWidget {
  const HomeScreenViews({super.key});

  @override
  State<HomeScreenViews> createState() => _HomeScreenViewsState();
}

class _HomeScreenViewsState extends State<HomeScreenViews> {
  final AreaController _areaController = Get.find();

  @override
  void dispose() {
    AreaDB.instance.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: fetchAreaListData(),
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
              pageBuilder: (_, __, ___) => const AddAreaScreenViews(),
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

  StreamBuilder fetchAreaListData() {
    return StreamBuilder<List<AreaModel>>(
      stream: _areaController.readAllAreaAsStream(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text('Error loading data'), // Show an error message
          );
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text('No data available'), // Show a message for empty data
          );
        }

        // Data is available, build your ListView
        final area = snapshot.requireData;
        log("Builder function called with ${area.length} items");

        return SizedBox(
          width: 1.sw,
          height: 1.sh - 80.h,
          child: ListView.builder(
            itemCount: area.length,
            itemBuilder: (context, index) {
              return buildAreaWidget(area[index]);
            },
          ),
        );
      },
    );
  }

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
          // Image.file(File(area.areaImage)),
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
