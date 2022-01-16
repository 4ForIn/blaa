import 'package:flutter/material.dart';

InputDecoration buildSearchInputDecoration() {
  return const InputDecoration(
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
    floatingLabelStyle: TextStyle(color: Colors.green, decorationThickness: 5),
    // labelText: 'word')
  );
}
