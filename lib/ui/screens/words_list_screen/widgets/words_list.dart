import 'package:blaa/utils/constants/assets_const.dart';
import 'package:flutter/material.dart';

class WordsList extends StatelessWidget {
  const WordsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      key: key,
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        children: [
          ListTile(
            key: key,
              tileColor: Colors.deepPurple,
              minVerticalPadding: 5,
              horizontalTitleGap: 20,
              isThreeLine: true,
              shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.black, width: 0.5),
                  borderRadius: BorderRadius.circular(20)),
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              leading: ClipRRect(
                clipBehavior: Clip.hardEdge,
                borderRadius: BorderRadius.circular(25),
                child: Container(
                  color: Colors.grey.shade400,
                  height: 50,
                  width: 50,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const <Widget>[
                          Text('new', style: TextStyle(fontSize: 10)),
                          Icon(
                            Icons.add,
                            size: 16,
                            color: Colors.black,
                          ),
                          Text('word', style: TextStyle(fontSize: 10))
                        ]),
                  ),
                ),
              ),
              title: const Text(
                'You have no words yet',
                textAlign: TextAlign.center,
              ),
              subtitle: Column(
                children: const [
                  Text(' ⟪ use "+ new word" to add new one'),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text('you can add to favorite or delete ⟫'),
                  ),
                ],
              ),
              trailing: _buildTrailingIcons(context))
        ]);
  }

  Padding _buildTrailingIcons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
              flex: 1,
              child: Image.asset(AssetsConst.iconHeartRed['path']!)),
          const SizedBox(height: 8,),
          const Expanded(
              flex: 1,
              child: Icon(Icons.delete_forever),)
        ],
      ),
    );
  }
}
