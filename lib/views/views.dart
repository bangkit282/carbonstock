import 'dart:developer';
import 'dart:io';

import 'package:carbonstock/data/api/controllers/area_controller.dart';
import 'package:carbonstock/data/api/controllers/plot_controller.dart';
import 'package:carbonstock/data/local/model/area_model.dart';
import 'package:carbonstock/data/local/model/plot_model.dart';
import 'package:carbonstock/utils/style_theme.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// Home
part 'home/home_views.dart';
part 'home/add_home_views.dart';

// Plot
part 'plot/plot_area_views.dart';
part 'plot/add_plot_views.dart';

part 'auth/login_views.dart';
part 'auth/auth_views.dart';

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
