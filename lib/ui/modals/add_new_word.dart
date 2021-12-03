import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class AddNewWord extends StatefulWidget {
  const AddNewWord({Key? key}) : super(key: key);

  @override
  _AddNewWordState createState() => _AddNewWordState();
}

class _AddNewWordState extends State<AddNewWord> {
  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
      TextFormField(
          decoration: const InputDecoration(
              isCollapsed: true,
              floatingLabelStyle: TextStyle(color: Colors.green),
              labelText: 'Input1')),
      TextFormField(
          decoration: const InputDecoration(
              floatingLabelStyle: TextStyle(color: Colors.green),
              labelText: 'Input2')),
      TextFormField(
          decoration: const InputDecoration(
              floatingLabelStyle: TextStyle(color: Colors.green),
              labelText: 'Input3')),
      const SizedBox(height: 15),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
              onPressed: () => context.router.pop(),
              child: const Text('Cancel')),
          TextButton(onPressed: () {}, child: const Text('Submit')),
        ],
      ),
    ]));
  }
}
