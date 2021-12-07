import 'package:blaa/ui/router/blaa_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

class StudyScreen extends StatelessWidget {
  const StudyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _buildBtn(() => context.router.push(const WordsListRoute()),
            'All Your words', Icons.assignment_outlined),
        _buildBtn(() => _noPageDialog(context), 'Let\'s do exercises',
            Icons.accessibility_new),
      ],
    );
  }

  Card _buildBtn(VoidCallback handleOnPressed, String txt, IconData icon) {
    return Card(
      color: Colors.grey.shade300,
      child: MaterialButton(
        onPressed: handleOnPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            children: [
              Icon(icon, size: 27),
              Text(txt, style: const TextStyle(fontSize: 18))
            ],
          ),
        ),
      ),
    );
  }

  _noPageDialog(BuildContext ctx) => showDialog(
      barrierDismissible: true,
      context: ctx,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('It will be ready soon'),
          actions: [
            TextButton(
              onPressed: () => context.router.pop(),
              child: const Text('Close'),
            )
          ],
        );
      });
}
