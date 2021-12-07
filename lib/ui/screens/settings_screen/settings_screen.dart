import 'package:flutter/material.dart';

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
                  onPressed: () {},
                  child: const Text(
                    'Sign in',
                    style: TextStyle(fontSize: 27),
                  ),
                ),
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
                  onPressed: () {},
                  child: const Text(
                    'Sign up',
                    style: TextStyle(fontSize: 27),
                  ),
                ),
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
                  child: const Text(
                    'Log out',
                    style: TextStyle(fontSize: 27),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
            child: Container()),
      ],
    );
  }
}
