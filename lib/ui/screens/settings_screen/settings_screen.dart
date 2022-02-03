import 'package:blaa/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:blaa/ui/router/blaa_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          flex: 1,
          child: ListView(
            key: const Key('settings-screen'),
            shrinkWrap: true,
            children: [
              const Divider(
                thickness: 1.2,
              ),
              ListTile(
                title: TextButton(
                    onPressed: () => context.router.push(const LoginRoute()),
                    child: const Text('Sign in',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                        textAlign: TextAlign.start)),
                leading: IconButton(
                  icon: const Icon(Icons.login),
                  onPressed: () => context.router.push(const LoginRoute()),
                ),
              ),
              const Divider(
                thickness: 1.2,
              ),
              ListTile(
                title: TextButton(
                    onPressed: () =>
                        context.router.push(const RegistrationRoute()),
                    child: const Text('Sign up',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                        textAlign: TextAlign.start)),
                leading: IconButton(
                  icon: const Icon(Icons.account_box_outlined),
                  onPressed: () =>
                      context.router.push(const RegistrationRoute()),
                ),
              ),
              const Divider(
                thickness: 1.2,
              ),
              BlocBuilder<AuthenticationBloc, AuthenticationState>(
                builder: (context, state) {
                  return ListTile(
                    title: TextButton(
                        onPressed: () => context
                            .read<AuthenticationBloc>()
                            .add(AuthenticationLogoutRequested()),
                        child: const Text('Sign out',
                            style: TextStyle(fontSize: 18, color: Colors.black),
                            textAlign: TextAlign.start)),
                    leading: IconButton(
                      icon: const Icon(Icons.logout),
                      onPressed: () => context
                          .read<AuthenticationBloc>()
                          .add(AuthenticationLogoutRequested()),
                    ),
                  );
                },
              ),
              const Divider(
                thickness: 1.2,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
