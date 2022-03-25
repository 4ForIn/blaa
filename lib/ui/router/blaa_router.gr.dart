// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i2;
import 'package:flutter/material.dart' as _i12;

import '../../data/model/word_m/word_m.dart' as _i13;
import '../screens/demo_screen/demo_screen.dart' as _i7;
import '../screens/edit_word_screen/edit_word_screen.dart' as _i6;
import '../screens/home_screen/home_screen.dart' as _i3;
import '../screens/login_screen/login_screen.dart' as _i10;
import '../screens/registration_screen/registration_screen.dart' as _i11;
import '../screens/root_view/root_view.dart' as _i1;
import '../screens/settings_screen/settings_screen.dart' as _i9;
import '../screens/study_screen/study_screen.dart' as _i4;
import '../screens/words_list_screen/words_list_screen.dart' as _i5;
import '../screens/demo_screen/single_screen/single_screen.dart' as _i8;

class BlaaRouter extends _i2.RootStackRouter {
  BlaaRouter([_i12.GlobalKey<_i12.NavigatorState>? navigatorKey])
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
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.HomeScreen(key: args.key));
    },
    StudyRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.StudyScreen());
    },
    WordsListRouter.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    DemoRouter.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    WordsListRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.WordsListScreen());
    },
    EditWordRoute.name: (routeData) {
      final args = routeData.argsAs<EditWordRouteArgs>();
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData,
          child:
              _i6.EditWordScreen(key: args.key, word: args.word, id: args.id));
    },
    DemoRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.DemoScreen());
    },
    SingleRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<SingleRouteArgs>(
          orElse: () => SingleRouteArgs(itemId: pathParams.getInt('itemId')));
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i8.SingleScreen(key: args.key, itemId: args.itemId));
    },
    SettingsRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.SettingsScreen());
    },
    LoginRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.LoginScreen());
    },
    RegistrationRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.RegistrationScreen());
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
                    path: '', parent: HomeRouter.name)
              ]),
          _i2.RouteConfig(StudyRouter.name,
              path: 'study',
              parent: RootView.name,
              children: [
                _i2.RouteConfig(StudyRoute.name,
                    path: '', parent: StudyRouter.name),
                _i2.RouteConfig(WordsListRouter.name,
                    path: 'words',
                    parent: StudyRouter.name,
                    children: [
                      _i2.RouteConfig(WordsListRoute.name,
                          path: '', parent: WordsListRouter.name),
                      _i2.RouteConfig(EditWordRoute.name,
                          path: ':id', parent: WordsListRouter.name)
                    ]),
                _i2.RouteConfig(DemoRouter.name,
                    path: 'demo',
                    parent: StudyRouter.name,
                    children: [
                      _i2.RouteConfig(DemoRoute.name,
                          path: '', parent: DemoRouter.name),
                      _i2.RouteConfig(SingleRoute.name,
                          path: ':itemId', parent: DemoRouter.name)
                    ])
              ]),
          _i2.RouteConfig(SettingsRouter.name,
              path: 'settings',
              parent: RootView.name,
              children: [
                _i2.RouteConfig(SettingsRoute.name,
                    path: '', parent: SettingsRouter.name),
                _i2.RouteConfig(LoginRoute.name,
                    path: 'login', parent: SettingsRouter.name),
                _i2.RouteConfig(RegistrationRoute.name,
                    path: 'sign-up', parent: SettingsRouter.name)
              ])
        ])
      ];
}

/// generated route for
/// [_i1.RootView]
class RootView extends _i2.PageRouteInfo<void> {
  const RootView({List<_i2.PageRouteInfo>? children})
      : super(RootView.name, path: '/', initialChildren: children);

  static const String name = 'RootView';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class HomeRouter extends _i2.PageRouteInfo<void> {
  const HomeRouter({List<_i2.PageRouteInfo>? children})
      : super(HomeRouter.name, path: 'home', initialChildren: children);

  static const String name = 'HomeRouter';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class StudyRouter extends _i2.PageRouteInfo<void> {
  const StudyRouter({List<_i2.PageRouteInfo>? children})
      : super(StudyRouter.name, path: 'study', initialChildren: children);

  static const String name = 'StudyRouter';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class SettingsRouter extends _i2.PageRouteInfo<void> {
  const SettingsRouter({List<_i2.PageRouteInfo>? children})
      : super(SettingsRouter.name, path: 'settings', initialChildren: children);

  static const String name = 'SettingsRouter';
}

/// generated route for
/// [_i3.HomeScreen]
class HomeRoute extends _i2.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({_i12.Key? key})
      : super(HomeRoute.name, path: '', args: HomeRouteArgs(key: key));

  static const String name = 'HomeRoute';
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.StudyScreen]
class StudyRoute extends _i2.PageRouteInfo<void> {
  const StudyRoute() : super(StudyRoute.name, path: '');

  static const String name = 'StudyRoute';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class WordsListRouter extends _i2.PageRouteInfo<void> {
  const WordsListRouter({List<_i2.PageRouteInfo>? children})
      : super(WordsListRouter.name, path: 'words', initialChildren: children);

  static const String name = 'WordsListRouter';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class DemoRouter extends _i2.PageRouteInfo<void> {
  const DemoRouter({List<_i2.PageRouteInfo>? children})
      : super(DemoRouter.name, path: 'demo', initialChildren: children);

  static const String name = 'DemoRouter';
}

/// generated route for
/// [_i5.WordsListScreen]
class WordsListRoute extends _i2.PageRouteInfo<void> {
  const WordsListRoute() : super(WordsListRoute.name, path: '');

  static const String name = 'WordsListRoute';
}

/// generated route for
/// [_i6.EditWordScreen]
class EditWordRoute extends _i2.PageRouteInfo<EditWordRouteArgs> {
  EditWordRoute({_i12.Key? key, required _i13.Word word, required int id})
      : super(EditWordRoute.name,
            path: ':id',
            args: EditWordRouteArgs(key: key, word: word, id: id),
            rawPathParams: {'id': id});

  static const String name = 'EditWordRoute';
}

class EditWordRouteArgs {
  const EditWordRouteArgs({this.key, required this.word, required this.id});

  final _i12.Key? key;

  final _i13.Word word;

  final int id;

  @override
  String toString() {
    return 'EditWordRouteArgs{key: $key, word: $word, id: $id}';
  }
}

/// generated route for
/// [_i7.DemoScreen]
class DemoRoute extends _i2.PageRouteInfo<void> {
  const DemoRoute() : super(DemoRoute.name, path: '');

  static const String name = 'DemoRoute';
}

/// generated route for
/// [_i8.SingleScreen]
class SingleRoute extends _i2.PageRouteInfo<SingleRouteArgs> {
  SingleRoute({_i12.Key? key, required int itemId})
      : super(SingleRoute.name,
            path: ':itemId',
            args: SingleRouteArgs(key: key, itemId: itemId),
            rawPathParams: {'itemId': itemId});

  static const String name = 'SingleRoute';
}

class SingleRouteArgs {
  const SingleRouteArgs({this.key, required this.itemId});

  final _i12.Key? key;

  final int itemId;

  @override
  String toString() {
    return 'SingleRouteArgs{key: $key, itemId: $itemId}';
  }
}

/// generated route for
/// [_i9.SettingsScreen]
class SettingsRoute extends _i2.PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: '');

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [_i10.LoginScreen]
class LoginRoute extends _i2.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: 'login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i11.RegistrationScreen]
class RegistrationRoute extends _i2.PageRouteInfo<void> {
  const RegistrationRoute() : super(RegistrationRoute.name, path: 'sign-up');

  static const String name = 'RegistrationRoute';
}
