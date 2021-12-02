import 'package:blaa/ui/router/blaa_router.gr.dart';
import 'package:flutter/material.dart';

class ApplicationBlaaa extends StatelessWidget {
  ApplicationBlaaa({Key? key}) : super(key: key);
  final _blaaRouter = BlaaRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: _blaaRouter.defaultRouteParser(),
      routerDelegate: _blaaRouter.delegate(),
      theme: ThemeData(primarySwatch: Colors.amber),
    );
  }
}
