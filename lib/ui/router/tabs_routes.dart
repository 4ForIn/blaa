import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'blaa_router.gr.dart';

const List<PageRouteInfo<dynamic>> bottomTabs = [
  HomeRouter(),
  StudyRouter(),
  SettingsRouter(),

];
const List<BottomNavigationBarItem> bottomBarItems = [
  BottomNavigationBarItem(
    label: "Home",
    icon: Icon(Icons.home),

  ),
  BottomNavigationBarItem(
    label: "Study",
    icon: Icon(Icons.search),
  ),
  BottomNavigationBarItem(
    label: "Settings",
    icon: Icon(Icons.grid_view),
  ),
];