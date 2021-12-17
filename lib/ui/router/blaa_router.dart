import 'package:auto_route/auto_route.dart';
import 'package:blaa/ui/router/path_const.dart';
import 'package:blaa/ui/screens/auth_screen/auth_screen.dart';
import 'package:blaa/ui/screens/demo_screen/demo_screen.dart';
import 'package:blaa/ui/screens/home_screen/home_screen.dart';
import 'package:blaa/ui/screens/root_view/root_view.dart';
import 'package:blaa/ui/screens/settings_screen/settings_screen.dart';
import 'package:blaa/ui/screens/study_screen/study_screen.dart';
import 'package:blaa/ui/screens/words_list_screen/words_list_screen.dart';

@MaterialAutoRouter(replaceInRouteName: 'Screen,Route', routes: [
  AutoRoute(path: PathConst.root, page: RootView, children: [
    AutoRoute(name: 'HomeRouter', path: PathConst.home, page: EmptyRouterPage, children: [
      AutoRoute(path: '', page: HomeScreen),

    ]),
    AutoRoute(path: PathConst.study, page: EmptyRouterPage, name: 'StudyRouter', children: [
      AutoRoute(page: StudyScreen, initial: true),
      AutoRoute(path: PathConst.words, page: WordsListScreen),
      AutoRoute(path: PathConst.demo, page: DemoScreen),
    ]),
    AutoRoute(path: PathConst.settings, page: EmptyRouterPage, name: 'SettingsRouter', children: [
      AutoRoute(page: SettingsScreen, initial: true),
      AutoRoute(path: PathConst.auth, page: AuthScreen),
    ]),
  ]),
])
class $BlaaRouter {}

/*
flutter pub run build_runner build --delete-conflicting-outputs
class RoutesConst {
  static const String add = 'add';
  static const String auth = 'auth';
  static const String demo = 'demo';
  static const String exercises = 'exercises';
  static const String home = 'home';
  static const String profile = 'profile';
  static const String root = '/';
  static const String settings = 'settings';
  static const String signIn = 'sign_in';
  static const String signUp = 'sign_up';
  static const String study = 'study';
  static const String words = 'words';
}
 */
