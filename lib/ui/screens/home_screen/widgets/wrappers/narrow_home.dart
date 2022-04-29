import 'package:flutter/material.dart';

class NarrowHomeSlideWrapper extends StatelessWidget {
  const NarrowHomeSlideWrapper({
    Key? key,
    required this.banner,
    required this.textInfo,
  }) : super(key: key);

  final Widget banner;
  final Widget textInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(flex: 2, child: banner),
        Expanded(
          flex: 3,
          child: textInfo,
        )
      ],
    );
  }
}