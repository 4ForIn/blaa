import 'package:blaa/blocs/words_cubit/words_cubit.dart';
import 'package:blaa/data/model/word_m/word_m.dart';
import 'package:blaa/utils/constants/assets_const.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:provider/src/provider.dart';

class WordsListItem extends StatelessWidget {
  const WordsListItem({Key? key, required this.item}) : super(key: key);

  final Word item;

  @override
  Widget build(BuildContext context) {
    return Card(
      key: key,
      color: Colors.grey.shade300,
      elevation: 2,
      shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.black, width: 0.5),
          borderRadius: BorderRadius.circular(10)),
      child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          leading: Hero(
            tag: item.uid,
            child: _buildHeroChild(),
          ),
          title: Text(item.inTranslation),
          subtitle: Text(item.inNative),
          trailing: _buildTrailingIcons(context)),
    );
  }

  ClipRRect _buildHeroChild() {
    return ClipRRect(
      clipBehavior: Clip.hardEdge,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        color: Colors.white,
        height: 35,
        width: 35,
        child: Align(
          alignment: Alignment.center,
          child: Text(item.inTranslation[0].toUpperCase(),
              style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w800,
                  fontSize: 24,
                  decoration: TextDecoration.underline)),
        ),
      ),
    );
  }

  Padding _buildTrailingIcons(BuildContext context) {
    final bool isFavorite = item.isFavorite == 1 ? true : false;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
              flex: 2,
              child: IconButton(
                  onPressed: () =>
                      context.read<WordsCubit>().triggerFavorite(item),
                  icon: isFavorite
                      ? Image.asset(AssetsConst.iconHeartRed['path']!)
                      : Image.asset(AssetsConst.iconHeart['path']!))),
          Expanded(
              flex: 1,
              child: IconButton(
                  onPressed: () => _onDeleteDialog(context, item.inTranslation),
                  icon: const Icon(Icons.delete_forever),
                  iconSize: 17))
        ],
      ),
    );
  }

  _onDeleteDialog(BuildContext ctx, String word) => showDialog(
      barrierDismissible: true,
      context: ctx,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Text(word)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: const <Widget>[
              Text(
                'Are you sure, you want to delete this word? ',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12),
              ),
              Text(
                'You cannot undo deleting!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Colors.red),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => {
                context.read<WordsCubit>().delete(item.uid),
                context.router.pop()
              },
              child: const Text('Yes, delete',
                  style: TextStyle(color: Colors.red)),
            ),
            TextButton(
              onPressed: () => context.router.pop(),
              child: const Text('No, cancel'),
            )
          ],
        );
      });
}
