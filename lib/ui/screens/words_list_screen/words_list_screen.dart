import 'package:blaa/blocs/words_cubit/words_cubit.dart';
import 'package:blaa/data/model/word_m/word_m.dart';
import 'package:blaa/ui/screens/words_list_screen/widgets/custom_search_delegate/custom_search_delegate.dart';
import 'package:blaa/ui/widgets/list_ordering_wrapper/list_ordering_wrapper.dart';
import 'package:blaa/ui/widgets/words_list_item/words_list_item.dart';
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
      SliverList(
        delegate: SliverChildListDelegate([
          ListOrderingWrapper(
            onlyFavoriteCheckbox: Checkbox(
              activeColor: Colors.green.shade400,
              value: true,
              onChanged: (bool? value) {},
            ),
            fromNewestRadio: Radio(
                activeColor: Colors.green,
                value: 1,
                groupValue: 1,
                onChanged: (v) {}),
            fromOldestRadio: Radio(
                activeColor: Colors.indigo,
                value: 0,
                groupValue: 1,
                onChanged: (v) {}),
          ),
        ]),
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
                favHandle: () =>
                    context.read<WordsCubit>().triggerFavorite(_item),
                deleteHandle: () =>
                    context.read<WordsCubit>().delete(_item.id!),
              );
            },
            childCount: state.words.length,
          ));
        },
      )
    ]);
  }
}
