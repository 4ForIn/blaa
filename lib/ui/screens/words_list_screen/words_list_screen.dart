import 'package:auto_route/auto_route.dart';
import 'package:blaa/blocs/words_cubit/words_cubit.dart';
import 'package:blaa/data/model/word_m/word_m.dart';
import 'package:blaa/ui/router/blaa_router.gr.dart';
import 'package:blaa/ui/screens/words_list_screen/widgets/custom_search_delegate/custom_search_delegate.dart';
import 'package:blaa/ui/widgets/order_bar/order_bar.dart';
import 'package:blaa/ui/widgets/words_list_item/words_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WordsListScreen extends StatelessWidget {
  const WordsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String _search = '${AppLocalizations.of(context)?.wordsListSearch}...';
    return CustomScrollView(slivers: [
      SliverAppBar(
        automaticallyImplyLeading: false,
        floating: true,
        snap: true,
        title: Text(_search),
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
          OrderBar(
              handleOnlyFavorite:
                  context.read<WordsCubit>().toggleShowOnlyFavored,
              handleOrder: context.read<WordsCubit>().orderItemsListByCreated),
        ]),
      ),
      BlocBuilder<WordsCubit, WordsState>(
        builder: (context, state) {

          /// TODO: check for state.status - if failure show state.errorText
          /// if user has no permission show state.errorText
          List<Word> _itemsToDisplay = state.words;
          late List<Word> _filteredItems;
          final bool _onlyFav = state.isShowOnlyFavored;
          if (_onlyFav) {
            _filteredItems = List.of(_itemsToDisplay)
              ..removeWhere((e) => e.isFavorite == 0);
          } else {
            _filteredItems = _itemsToDisplay;
          }
          return SliverList(
              delegate: SliverChildBuilderDelegate(
            (BuildContext context, int i) {
              Word _item = _filteredItems[i];
              return WordsListItem(
                  key: Key('WordsListScreen-wordsListItem-${_item.id}'),
                  item: _item,
                  favHandle: () =>
                      context.read<WordsCubit>().triggerFavorite(_item.id),
                  deleteHandle: () =>
                      context.read<WordsCubit>().delete(_item.id),
                  onTapHandle: () => context.router
                      .push(EditWordRoute(word: _item, id: _item.id)));
            },
            childCount: _filteredItems.length,
          ));
        },
      )
    ]);
  }
}
