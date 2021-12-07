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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildFormField('in your language'),
          _buildFormField('in turkish'),
          _buildFormField('category'),
          _buildFormField('clue'),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  const Text('Favorite'),
                  Checkbox(
                    activeColor: Colors.green.shade400,
                    value: true,
                    onChanged: (bool? value) {},
                  ),
                ],
              ),
              TextButton(
                  onPressed: () => context.router.pop(),
                  child: const Text('Cancel')),
              TextButton(onPressed: () {}, child: const Text('Submit')),
            ],
          ),
        ],
      ),
    );
  }

  Padding _buildFormField(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15),
      child: TextFormField(
          maxLines: label == 'clue' ? 2 : 1,
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              borderSide: BorderSide(color: Color(0xff0E9447), width: 2.0),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              borderSide: BorderSide(color: Color(0xff0E9447), width: 2.0),
            ),
            // isCollapsed: true,
            floatingLabelStyle: const TextStyle(
              color: Colors.green,
            ),
            labelText: label,
            labelStyle: const TextStyle(fontSize: 12),
          )),
    );
  }
}
