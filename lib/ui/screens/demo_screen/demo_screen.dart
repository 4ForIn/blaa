import 'package:blaa/ui/widgets/word_item_card/word_item_card.dart';
import 'package:flutter/material.dart';

class DemoScreen extends StatelessWidget {
  const DemoScreen({Key? key}) : super(key: key);

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
                  // const SizedBox(height: 10),
                  const Padding(
                      padding: EdgeInsets.only(top: 15.0),
                      child: Text(
                        'DEMO MODE',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.deepPurple),
                      )),
                ]))
          ]),
        ),
        Expanded(
          flex: 3,
          child: ListView.builder(
            itemCount: 12,
            itemBuilder: (BuildContext context, int index) {
              return const WordItemCard();
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSearchRadioBtn() {
    return Row(children: [
      Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 4.0, 4.0, 0.0),
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                border: Border.all(),
              ),
              child: Row(children: [
                const Expanded(flex: 4, child: Text('Only favorites')),
                Expanded(
                    flex: 1,
                    child: Padding(
                        padding: const EdgeInsets.only(right: 2.0),
                        child: Checkbox(
                          activeColor: Colors.green.shade400,
                          value: true,
                          onChanged: (bool? value) {},
                        )))
              ]),
            ),
          )),
      const Expanded(flex: 2, child: Text('First:  newest')),
      Padding(
        padding: const EdgeInsets.only(right: 5.0),
        child: Radio(
            activeColor: Colors.green,
            value: 1,
            groupValue: 1,
            onChanged: (v) {}),
      ),
      const Expanded(
          flex: 1,
          child: Padding(
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
