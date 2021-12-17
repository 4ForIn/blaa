import 'package:blaa/blocs/user_cubit/user_cubit.dart';
import 'package:blaa/blocs/words_cubit/words_cubit.dart';
import 'package:blaa/ui/router/blaa_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApplicationBlaaa extends StatelessWidget {
  ApplicationBlaaa({Key? key}) : super(key: key);
  final UserCubit _userCubit = UserCubit();
  final WordsCubit _wordsCub = WordsCubit();
  final _blaaRouter = BlaaRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: <BlocProvider>[
          BlocProvider<UserCubit>(
            create: (BuildContext context) => _userCubit,
            lazy: false,
          ),
          BlocProvider<WordsCubit>(
              create: (BuildContext context) => _wordsCub..fetchWords())
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routeInformationParser: _blaaRouter.defaultRouteParser(),
          routerDelegate: _blaaRouter.delegate(),
          theme: ThemeData(primarySwatch: Colors.amber),
        ));
  }
}
