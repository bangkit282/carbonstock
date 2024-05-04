import 'dart:async';
import 'dart:convert';

import 'package:carbonstock/data/api/controllers/area/area_controller.dart';
import 'package:carbonstock/data/api/controllers/auth/auth_controller.dart';
import 'package:carbonstock/data/api/controllers/plot/plot_controller.dart';
import 'package:carbonstock/data/api/controllers/subplot/sub_plot_controller.dart';
import 'package:carbonstock/data/api/controllers/subplot/summary_controller.dart';
import 'package:carbonstock/data/local/localdb/area/area_db.dart';
import 'package:carbonstock/data/local/localdb/auth/auth_db.dart';
import 'package:carbonstock/data/local/localdb/plot/plot_db.dart';
import 'package:carbonstock/data/local/localdb/subplot/sub_plot_db.dart';
import 'package:carbonstock/data/local/model/area/area_model.dart';
import 'package:carbonstock/data/local/model/auth/user_model.dart';
import 'package:carbonstock/data/local/model/plot/plot_model.dart';
import 'package:carbonstock/data/local/model/subplot/sub_plot_a_model.dart';
import 'package:carbonstock/data/local/model/subplot/sub_plot_b_model.dart';
import 'package:carbonstock/data/local/model/subplot/sub_plot_c_model.dart';
import 'package:carbonstock/data/local/model/subplot/sub_plot_d_model.dart';
import 'package:carbonstock/utils/shared_prefs.dart';
import 'package:carbonstock/views/views.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferenceService.init();
  await Hive.initFlutter();

  // if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
  //   await InAppWebViewController.setWebContentsDebuggingEnabled(kDebugMode);
  // }

  Hive.registerAdapter(UserModelAdapter());

  Hive.registerAdapter(AreaModelAdapter());
  Hive.registerAdapter(PlotModelAdapter());

  Hive.registerAdapter(SubPlotAreaAModelAdapter());
  Hive.registerAdapter(SubPlotAreaASemaiModelAdapter());
  Hive.registerAdapter(SubPlotAreaASeresahModelAdapter());
  Hive.registerAdapter(SubPlotAreaATumbuhanBawahModelAdapter());

  Hive.registerAdapter(SubPlotAreaBModelAdapter());
  Hive.registerAdapter(SubPlotAreaCModelAdapter());

  Hive.registerAdapter(SubPlotAreaDModelAdapter());
  Hive.registerAdapter(SubPlotAreaDPohonModelAdapter());
  Hive.registerAdapter(SubPlotAreaDNekromasModelAdapter());
  Hive.registerAdapter(SubPlotAreaDTanahModelAdapter());

  await AreaDB.init();
  await AuthDB.init();
  await PlotDB.init();
  await SubPlotAreaDB.init();

  Get.put(AreaController(), permanent: true);
  Get.put(AuthController(), permanent: true);
  Get.put(PlotController(), permanent: true);
  Get.put(SubPlotController(), permanent: true);
  Get.put(SummarySubplotController(), permanent: true);

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
        title: 'CarbonRangers',
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
  final SharedPreferenceService _sharedPref = SharedPreferenceService();

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

    // if (position.isMocked) {
    //   return Future.error('Location is mocked!');
    // } else {
    //   // Store location and return the current location
    //   LatLng currentLatLng = LatLng(position.latitude, position.longitude);
    //   Map<String, LatLng> latLngMapper = {'currentLatLng': currentLatLng};

    //   sharedPreferences.putString('latLng', jsonEncode(latLngMapper));
    //   return await Geolocator.getCurrentPosition();
    // }

    // Store location and return the current location
    // GeoPoint currentGeoPoint = GeoPoint(
    //   latitude: position.latitude,
    //   longitude: position.longitude,
    // );

    LatLng currentLatLng = LatLng(position.latitude, position.longitude);
    Map<String, LatLng> latLngMapper = {'currentLatLng': currentLatLng};

    _sharedPref.putString('latLng', jsonEncode(latLngMapper));
    return await Geolocator.getCurrentPosition();
  }

  @override
  void initState() {
    initializeLocationAndSave();

    Timer(
      const Duration(seconds: 3),
      () => _sharedPref.checkKey('isLogin')
          ? _sharedPref.getInt('isLogin') == 1
              ? Get.off(() => const PlotAreaScreenViews())
              : Get.off(() => const LoginScreenViews())
          : Get.off(() => const LoginScreenViews()),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('assets/images/carbon-rangers_logo.png'),
      ),
    );
  }
}
