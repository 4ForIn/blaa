import 'package:flutter/material.dart';

class ListOrderingWrapper extends StatelessWidget {
  const ListOrderingWrapper(
      {Key? key,
      required this.onlyFavoriteCheckbox,
      required this.fromNewestRadio,
      required this.fromOldestRadio})
      : super(key: key);
  final Checkbox onlyFavoriteCheckbox;
  final Radio fromNewestRadio;
  final Radio fromOldestRadio;

  @override
  Widget build(BuildContext context) {
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
                        child: onlyFavoriteCheckbox))
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
          padding: const EdgeInsets.only(right: 5.0), child: fromNewestRadio),
      const Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.only(left: 4.0),
            child: Text(
              'oldest',
              style: TextStyle(color: Colors.indigo),
            ),
          )),
      Expanded(flex: 1, child: fromOldestRadio)
    ]);
  }
}
