import 'dart:async';
import 'dart:convert';

import 'package:carbonstock/data/api/controllers/area/area_controller.dart';
import 'package:carbonstock/data/api/controllers/plot/plot_controller.dart';
import 'package:carbonstock/utils/shared_prefs.dart';
import 'package:carbonstock/views/views.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferenceService.init();

  Get.lazyPut(() => AreaController());
  Get.lazyPut(() => PlotController());

  await dotenv.load(fileName: 'assets/configs/.env');

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
  final SharedPreferenceService sharedPreferences = SharedPreferenceService();

  Future<Position> initializeLocationAndSave() async {
    // Ensure all permissions are collected for Locations
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied!');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied!');
    }

    // Ensure location service is enabled
    bool? serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('Location services are disabled!');
    }

    // Get capture the current user location
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    if (position.isMocked) {
      return Future.error('Location is mocked!');
    } else {
      // Store location and return the current location
      LatLng currentLatLng = LatLng(position.latitude, position.longitude);
      Map<String, LatLng> latLngMapper = {'currentLatLng': currentLatLng};

      sharedPreferences.putString('latLng', jsonEncode(latLngMapper));
      return await Geolocator.getCurrentPosition();
    }
  }

  @override
  void initState() {
    initializeLocationAndSave();

    Timer(
      const Duration(seconds: 3),
      () => Get.off(() => const PlotAreaScreenViews()),
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
