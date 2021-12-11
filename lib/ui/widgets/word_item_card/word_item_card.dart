import 'package:blaa/utils/constants/img_const.dart';
import 'package:flutter/material.dart';

class WordItemCard extends StatelessWidget {
  const WordItemCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.grey.shade300,
        elevation: 2,
        shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.black, width: 0.5),
            borderRadius: BorderRadius.circular(10)),
        child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            leading: Hero(
                tag: ImgConst.bag['description']!,
                child: Image.asset(ImgConst.bag['path']!)),
            title: const Text('list tile title'),
            subtitle: const Text('list tile subtitle'),
            trailing: _buildTrailingIcons()));
  }

  Padding _buildTrailingIcons() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
              flex: 2,
              child: IconButton(
                  onPressed: () {},
                  icon: Image.asset(ImgConst.iconHeart['path']!))),
          Expanded(
              flex: 1,
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.delete_forever),
                  iconSize: 17))
        ],
      ),
    );
  }
}