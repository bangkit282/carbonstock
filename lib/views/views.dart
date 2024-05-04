import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:developer' as d;

import 'package:carbonstock/data/api/controllers/auth/auth_controller.dart';
import 'package:carbonstock/data/api/controllers/plot/plot_controller.dart';
import 'package:carbonstock/data/api/controllers/subplot/sub_plot_controller.dart';
import 'package:carbonstock/data/api/controllers/subplot/summary_controller.dart';
import 'package:carbonstock/data/local/localdb/subplot/sub_plot_db.dart';
import 'package:carbonstock/data/local/model/area/area_model.dart';
import 'package:carbonstock/data/local/model/auth/user_model.dart';
import 'package:carbonstock/data/local/model/plot/plot_model.dart';
import 'package:carbonstock/data/local/model/subplot/sub_plot_a_model.dart';
import 'package:carbonstock/data/local/model/subplot/sub_plot_b_model.dart';
import 'package:carbonstock/data/local/model/subplot/sub_plot_c_model.dart';
import 'package:carbonstock/data/local/model/subplot/sub_plot_d_model.dart';
import 'package:carbonstock/utils/shared_prefs.dart';
import 'package:carbonstock/utils/style_theme.dart';
import 'package:carbonstock/views/easter/easter_egg_views.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:uuid/uuid.dart';

// Home
part 'home/home_views.dart';
part 'home/detail_home_views.dart';

// Plot
part 'plot/plot_area_views.dart';
part 'plot/detail_plot_views.dart';

// Sub-Plot
part 'plot/subplot/sub_plot_area_views.dart';
part 'plot/subplot/details/detail_sub_plot_a_views.dart';
part 'plot/subplot/details/detail_sub_plot_b_views.dart';
part 'plot/subplot/details/detail_sub_plot_c_views.dart';
part 'plot/subplot/details/detail_sub_plot_d_views.dart';
part 'plot/summary/summary_views.dart';

part 'auth/login_views.dart';
part 'auth/register_web_views.dart';

class PageSetup extends StatefulWidget {
  const PageSetup({super.key});

  @override
  State<PageSetup> createState() => _PageSetupState();
}

class _PageSetupState extends State<PageSetup> {
  int _selectedIndex = 0;

  final List<Widget> _pageViews = [
    const HomeScreenViews(),
    const PlotAreaScreenViews(),
    Container(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageViews.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        onTap: _onItemTapped,
        enableFeedback: false,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: colorSecondaryGreen,
        unselectedItemColor: colorButtonAccentGreen,
        selectedItemColor: colorPrimaryWhite,
        iconSize: 24.sp,
        items: const [
          BottomNavigationBarItem(
            label: 'Dashboard',
            icon: Icon(Icons.home_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Plot Area',
            icon: Icon(Icons.location_on_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(Icons.person_2_outlined),
          ),
        ],
      ),
    );
  }
}
