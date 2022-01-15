import 'package:blaa/blocs/words_cubit/words_cubit.dart';
import 'package:blaa/data/model/word_m/word_m.dart';
import 'package:blaa/ui/widgets/empty_words_list_info/empty_words_list_info.dart';
import 'package:blaa/ui/widgets/words_list_item/words_list_item.dart';
// import 'package:blaa/utils/constants/languages.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WordsListScreen extends StatelessWidget {
  const WordsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //  final WordsCubit _wordsCubit = BlocProvider.of<WordsCubit>(context);
    // final TextEditingController _controller = TextEditingController();
    return CustomScrollView(slivers: [
      SliverAppBar(
        automaticallyImplyLeading: false,
        floating: true,
        snap: true,
        title: const Text("Search App"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: CustomSearchDelegate());
              }),
        ],
      ),
      BlocBuilder<WordsCubit, WordsState>(
        builder: (context, state) {
          return SliverList(
              delegate: SliverChildBuilderDelegate(
            (BuildContext context, int i) {
              Word _item = state.words[i];
              return WordsListItem(
                  key: Key('WordsListScreen-wordsListItem-${_item.id}'),
                  item: _item,
                favHandle: () => context.read<WordsCubit>().triggerFavorite(_item),
                deleteHandle: () => context.read<WordsCubit>().delete(_item.id!),
              );
            },
            childCount: state.words.length,
          ));
        },
      )
    ]);
  }
}
// -----------------------

class CustomSearchDelegate extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    // assert(context != null);
    final ThemeData theme = Theme.of(context);
    // theme.copyWith(backgroundColor: Colors.amber);
    // assert(theme != null);
    return theme;
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return Container();
    /*IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );*/
  }

  @override
  Widget buildResults(BuildContext context) {
    //Add the search term to the searchBloc.
    //The Bloc will then handle the searching and add the results to the searchResults stream.
    //This is the equivalent of submitting the search term to whatever search service you are using

    return BlocBuilder<WordsCubit, WordsState>(
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
            final _results = _list
                .where((w) => w.inNative.toLowerCase().contains(query))
                .toList();
            return ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                key: const Key('WordsListScreen-wordsList_builder'),
                // if list is empty, need to show EmptyWordsListInfo - one item?
                itemCount: _results.length,
                itemBuilder: (BuildContext context, int index) {
                  if (_results.isEmpty) {
                    return const EmptyWordsListInfo();
                  } else {
                    final Word _word = _results[index];
                    return WordsListItem(
                        key: Key('WordsListScreen-wordsListItem-${_word.id}'),
                        item: _word);
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
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // This method is called everytime the search term changes.
    // If you want to add search suggestions as the user enters their search term,
    // this is the place to do that.

    return CustomScrollView(slivers: [
      SliverList(
        delegate: SliverChildListDelegate(
          [
            Column(
              children: [
                _buildSearchRadioBtn(),
                BlocBuilder<WordsCubit, WordsState>(
                    builder: (BuildContext context, WordsState state) {
                  if (state.words.isEmpty) {
                    return const Center(child: Text('No data'));
                  }
                  final _results = state.words
                      .where((w) => w.inNative.toLowerCase().contains(query))
                      .toList();
                  return ListView(
                    shrinkWrap: true,
                    children: _results
                        .map<Widget>((e) => WordsListItem(
                            key: Key('WordsListScreen-wordsListItem-${e.id}'),
                            item: e))
                        .toList(),
                  );
                }),
              ],
            )
          ],
        ),
      ),
    ]);
  }

  // ------ building methods: ------------

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
        child: Text.rich(
          TextSpan(
              style: TextStyle(fontWeight: FontWeight.bold),
              text: 'First:  ',
              children: <InlineSpan>[
                TextSpan(
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.green,
                    ),
                    text: 'newest'),
              ]),
        ),
      ),
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
            child: Text(
              'oldest',
              style: TextStyle(color: Colors.indigo),
            ),
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
}
