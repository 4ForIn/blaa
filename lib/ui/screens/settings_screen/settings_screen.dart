import 'package:blaa/ui/router/blaa_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Divider(),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: MaterialButton(
                    color: Colors.green.shade200,
                    onPressed: () => context.router.push(const LoginRoute()),
                    child:
                        const Text('Sign in', style: TextStyle(fontSize: 27))),
              ),
            ],
          ),
        ),
        const Divider(),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: MaterialButton(
                    color: Colors.grey.shade400,
                    onPressed: () => context.router.push(const RegistrationRoute()),
                    child:
                        const Text('Sign up', style: TextStyle(fontSize: 27))),
              ),
            ],
          ),
        ),
        const Divider(),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: MaterialButton(
                    color: Colors.red.shade200,
                    onPressed: () {},
                    child:
                        const Text('Sign out', style: TextStyle(fontSize: 27))),
              ),
            ],
          ),
        ),
        Expanded(flex: 2, child: Container()),
      ],
    );
  }
}
