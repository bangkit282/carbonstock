import 'dart:async';
import 'dart:convert';

import 'package:carbonstock/data/api/controllers/area_controller.dart';
import 'package:carbonstock/data/api/controllers/plot_controller.dart';
import 'package:carbonstock/utils/shared_prefs.dart';
import 'package:carbonstock/views/views.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
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

  void initializeLocationAndSave() async {
    // Ensure all permissions are collected for Locations
    Location location = Location();
    bool? serviceEnabled;
    PermissionStatus? permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
    }

    // Get capture the current user location
    LocationData locationData = await location.getLocation();
    LatLng currentLatLng =
        LatLng(locationData.latitude!, locationData.longitude!);

    // Store the user location in sharedPreferences
    sharedPreferences.putDouble('latitude', locationData.latitude!);
    sharedPreferences.putDouble('longitude', locationData.longitude!);

    Map<String, LatLng> latLngMapper = {'currentLatLng': currentLatLng};
    sharedPreferences.putString('latLng', jsonEncode(latLngMapper));
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
