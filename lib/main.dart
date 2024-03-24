import 'dart:async';

import 'package:carbonstock/data/api/controllers/area_controller.dart';
import 'package:carbonstock/data/api/controllers/plot_controller.dart';
import 'package:carbonstock/utils/shared_prefs.dart';
import 'package:carbonstock/views/views.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferenceService.init();

  Get.lazyPut(() => AreaController());
  Get.lazyPut(() => PlotController());

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.light,
              statusBarBrightness: Brightness.dark,
            ),
            iconTheme: IconThemeData(color: Colors.black),
          ),
          fontFamily: 'Poppins',
        ),
        home: const SplashScreenViews(),
      ),
    );
  }
}

class SplashScreenViews extends StatefulWidget {
  const SplashScreenViews({super.key});

  @override
  State<SplashScreenViews> createState() => _SplashScreenViewsState();
}

class _SplashScreenViewsState extends State<SplashScreenViews> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 3),
      () => Get.off(() => const PageSetup()),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('assets/images/carbon_stock_logo.png'),
      ),
    );
  }
}
