import 'package:auto_route/auto_route.dart';
import 'package:blaa/ui/router/tabs_routes.dart';
import 'package:flutter/material.dart';



class RootView extends StatelessWidget {
  const RootView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      backgroundColor: Colors.amber,
      routes: bottomTabs,
      appBarBuilder: (_, tRouter) => AppBar(
        elevation: 0.0,
        leading: const AutoBackButton(
          color: Colors.black,
        ),
      ),
      bottomNavigationBuilder: (_, tRouter) {
        return BottomNavigationBar(
          currentIndex: tRouter.activeIndex,
          onTap: tRouter.setActiveIndex,
          items: bottomBarItems);
      },
    );
  }
}