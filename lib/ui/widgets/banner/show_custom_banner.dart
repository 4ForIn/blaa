import 'package:flutter/material.dart';

void showBanner(BuildContext context, String? msg) {
  final String _info = msg ?? 'Ups, something went wrong';
  ScaffoldMessenger.of(context)
    ..removeCurrentMaterialBanner()
    ..showMaterialBanner(_buildMaterialBanner(context, _info));
}

MaterialBanner _buildMaterialBanner(BuildContext context, String txt) {
  return MaterialBanner(
      backgroundColor: Theme.of(context).backgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      leading: const Icon(Icons.error),
      actions: [
        TextButton(
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
            },
            child: const Text('OK', style: TextStyle(color: Colors.purple)))
      ],
      content: Text(txt),
      contentTextStyle: const TextStyle(
          fontSize: 14, fontWeight: FontWeight.bold, color: Colors.indigo));
}
