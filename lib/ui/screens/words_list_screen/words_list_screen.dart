import 'package:blaa/ui/screens/words_list_screen/widgets/words_list.dart';
import 'package:blaa/utils/constants/img_const.dart';
import 'package:flutter/material.dart';

class WordsListScreen extends StatelessWidget {
  const WordsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: ListView(children: [
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
                child: Column(children: [
                  _buildSearchTexInput(_controller),
                  _buildSearchRadioBtn(),
                  const SizedBox(height: 10),
                ]))
          ]),
        ),
        const Expanded(
          flex: 3,
          child: WordsList(),
        ),
      ],
    );
  }

  Row _buildSearchRadioBtn() {
    return Row(children: [
      const Expanded(flex: 2, child: Text('Only favorites')),
      Expanded(
        flex: 1,
        child: Checkbox(
          activeColor: Colors.green.shade400,
          value: true,
          onChanged: (bool? value) {},
        ),
      ),
      const Expanded(flex: 2, child: Text('First:  newest')),
      Padding(
        padding: const EdgeInsets.only(right: 5.0),
        child: Radio(
            activeColor: Colors.green,
            value: 1,
            groupValue: 1,
            onChanged: (v) {}),
      ),
      const Expanded(flex: 1, child: Padding(
        padding: EdgeInsets.only(left: 4.0),
        child: Text('oldest'),
      )),
      Expanded(
        flex: 1,
        child: Radio(
            activeColor: Colors.green,
            value: 0,
            groupValue: 1,
            onChanged: (v) {}),
      )
    ]);
  }

  TextFormField _buildSearchTexInput(TextEditingController _controller) {
    return TextFormField(
      autofocus: false,
        cursorColor: Colors.black,
        controller: _controller,
        decoration: const InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(color: Color(0xff0E9447), width: 2.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(color: Color(0xff0E9447), width: 2.0),
          ),
          label: Text('Find the word you looking for'),
          labelStyle: TextStyle(letterSpacing: 2.0),
          floatingLabelStyle:
              TextStyle(color: Colors.green, decorationThickness: 5),
          // labelText: 'word')
        ));
  }
}
