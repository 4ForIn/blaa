// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i2;
import 'package:flutter/material.dart' as _i10;

import '../screens/add_word_modal/add_word_modal.dart' as _i5;
import '../screens/auth_screen/auth_screen.dart' as _i9;
import '../screens/demo_screen/demo_screen.dart' as _i4;
import '../screens/home_screen/home_screen.dart' as _i3;
import '../screens/root_view/root_view.dart' as _i1;
import '../screens/settings_screen/settings_screen.dart' as _i8;
import '../screens/study_screen/study_screen.dart' as _i6;
import '../screens/words_list_screen/words_list_screen.dart' as _i7;

class BlaaRouter extends _i2.RootStackRouter {
  BlaaRouter([_i10.GlobalKey<_i10.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    RootView.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.RootView());
    },
    HomeRouter.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    StudyRouter.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    SettingsRouter.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    HomeRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.HomeScreen());
    },
    DemoRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.DemoScreen());
    },
    AddWordModal.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.AddWordModal());
    },
    StudyRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.StudyScreen());
    },
    WordsListRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.WordsListScreen());
    },
    SettingsRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.SettingsScreen());
    },
    AuthRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.AuthScreen());
    }
  };

  @override
  List<_i2.RouteConfig> get routes => [
        _i2.RouteConfig(RootView.name, path: '/', children: [
          _i2.RouteConfig(HomeRouter.name,
              path: 'home',
              parent: RootView.name,
              children: [
                _i2.RouteConfig(HomeRoute.name,
                    path: '', parent: HomeRouter.name),
                _i2.RouteConfig(DemoRoute.name,
                    path: 'demo', parent: HomeRouter.name),
                _i2.RouteConfig(AddWordModal.name,
                    path: 'add', parent: HomeRouter.name)
              ]),
          _i2.RouteConfig(StudyRouter.name,
              path: 'study',
              parent: RootView.name,
              children: [
                _i2.RouteConfig(StudyRoute.name,
                    path: '', parent: StudyRouter.name),
                _i2.RouteConfig(WordsListRoute.name,
                    path: 'words', parent: StudyRouter.name)
              ]),
          _i2.RouteConfig(SettingsRouter.name,
              path: 'settings',
              parent: RootView.name,
              children: [
                _i2.RouteConfig(SettingsRoute.name,
                    path: '', parent: SettingsRouter.name),
                _i2.RouteConfig(AuthRoute.name,
                    path: 'auth', parent: SettingsRouter.name)
              ])
        ])
      ];
}

/// generated route for [_i1.RootView]
class RootView extends _i2.PageRouteInfo<void> {
  const RootView({List<_i2.PageRouteInfo>? children})
      : super(name, path: '/', initialChildren: children);

  static const String name = 'RootView';
}

/// generated route for [_i2.EmptyRouterPage]
class HomeRouter extends _i2.PageRouteInfo<void> {
  const HomeRouter({List<_i2.PageRouteInfo>? children})
      : super(name, path: 'home', initialChildren: children);

  static const String name = 'HomeRouter';
}

/// generated route for [_i2.EmptyRouterPage]
class StudyRouter extends _i2.PageRouteInfo<void> {
  const StudyRouter({List<_i2.PageRouteInfo>? children})
      : super(name, path: 'study', initialChildren: children);

  static const String name = 'StudyRouter';
}

/// generated route for [_i2.EmptyRouterPage]
class SettingsRouter extends _i2.PageRouteInfo<void> {
  const SettingsRouter({List<_i2.PageRouteInfo>? children})
      : super(name, path: 'settings', initialChildren: children);

  static const String name = 'SettingsRouter';
}

/// generated route for [_i3.HomeScreen]
class HomeRoute extends _i2.PageRouteInfo<void> {
  const HomeRoute() : super(name, path: '');

  static const String name = 'HomeRoute';
}

/// generated route for [_i4.DemoScreen]
class DemoRoute extends _i2.PageRouteInfo<void> {
  const DemoRoute() : super(name, path: 'demo');

  static const String name = 'DemoRoute';
}

/// generated route for [_i5.AddWordModal]
class AddWordModal extends _i2.PageRouteInfo<void> {
  const AddWordModal() : super(name, path: 'add');

  static const String name = 'AddWordModal';
}

/// generated route for [_i6.StudyScreen]
class StudyRoute extends _i2.PageRouteInfo<void> {
  const StudyRoute() : super(name, path: '');

  static const String name = 'StudyRoute';
}

/// generated route for [_i7.WordsListScreen]
class WordsListRoute extends _i2.PageRouteInfo<void> {
  const WordsListRoute() : super(name, path: 'words');

  static const String name = 'WordsListRoute';
}

/// generated route for [_i8.SettingsScreen]
class SettingsRoute extends _i2.PageRouteInfo<void> {
  const SettingsRoute() : super(name, path: '');

  static const String name = 'SettingsRoute';
}

/// generated route for [_i9.AuthScreen]
class AuthRoute extends _i2.PageRouteInfo<void> {
  const AuthRoute() : super(name, path: 'auth');

  static const String name = 'AuthRoute';
}
