import 'package:blaa/blocs/words_cubit/words_cubit.dart';
import 'package:blaa/ui/router/blaa_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApplicationBlaaa extends StatelessWidget {
  ApplicationBlaaa({Key? key}) : super(key: key);
  final _blaaRouter = BlaaRouter();
  final WordsCubit _wordsCub = WordsCubit();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: <BlocProvider>[
          BlocProvider<WordsCubit>(create: (BuildContext context) => _wordsCub)
        ],
        child: BlocBuilder<WordsCubit, WordsState>(
          builder: (BuildContext context, WordsState state) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              routeInformationParser: _blaaRouter.defaultRouteParser(),
              routerDelegate: _blaaRouter.delegate(),
              theme: ThemeData(primarySwatch: Colors.amber),
            );
          },
        ));
  }
}
/*
Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: _blaaRouter.defaultRouteParser(),
      routerDelegate: _blaaRouter.delegate(),
      theme: ThemeData(primarySwatch: Colors.amber),
    );
  }
 */
