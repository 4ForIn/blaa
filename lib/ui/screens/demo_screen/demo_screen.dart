import 'package:blaa/blocs/words_cubit/words_cubit.dart';
import 'package:blaa/data/model/word_m/word_m.dart';
import 'package:blaa/ui/widgets/empty_words_list_info/empty_words_list_info.dart';
import 'package:blaa/ui/widgets/words_list_item/words_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DemoScreen extends StatelessWidget {
  const DemoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Expanded(
        flex: 1,
        child: ListView(
            key: const Key('DemoScreen-searching-control-topBar'),
            children: [
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
        child: BlocBuilder<WordsCubit, WordsState>(
            builder: (BuildContext context, WordsState state) {
          switch (state.status) {
            case WordsStateStatus.loading:
              return Center(
                child: Column(children: const <Widget>[
                  CircularProgressIndicator(color: Colors.green)
                ]),
              );
            case WordsStateStatus.success:
              final List<Word> _list = state.words;
              final int _c = _list.length;
              return ListView.builder(
                  key: const Key('DemoScreen-wordsList_builder'),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  // if list is empty, need to show EmptyWordsListInfo - one item
                  itemCount: _c < 1 ? 1 : _c,
                  itemBuilder: (BuildContext context, int index) {
                    if (_list.isEmpty) {
                      return const EmptyWordsListInfo();
                    } else {
                      final Word _word = _list[index];
                      return WordsListItem(
                        key: Key('DemoScreen-wordsListItem-${_word.uid}'),
                        item: _word,
                      );
                    }
                  });
            case WordsStateStatus.failure:
              return Center(
                child: Column(
                  children: const <Widget>[
                    CircularProgressIndicator(
                      color: Colors.green,
                    ),
                    Text('Please, try again. 🙄 😮'),
                    Text('Error: ___'),
                  ],
                ),
              );
            default:
              return Center(
                child: Column(children: const <Widget>[
                  CircularProgressIndicator(color: Colors.red),
                  Text('Please, try again. Something go wrong 🙄 😮'),
                ]),
              );
          }
        }),
      ),
    ]);
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
                const Expanded(
                    flex: 4,
                    child: Padding(
                      padding: EdgeInsets.only(left: 4.0),
                      child: Text('Only favorites'),
                    )),
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
      const Expanded(
          flex: 2,
          child: Text.rich(TextSpan(
              style: TextStyle(fontWeight: FontWeight.bold),
              text: 'First:  ',
              children: <InlineSpan>[
                TextSpan(
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.green,
                    ),
                    text: 'newest')
              ]))),
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
            child: Text('oldest', style: TextStyle(color: Colors.indigo)),
          )),
      Expanded(
        flex: 1,
        child: Radio(
            activeColor: Colors.indigo,
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
