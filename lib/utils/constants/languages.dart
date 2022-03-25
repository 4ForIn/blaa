import 'package:blaa/data/model/language_m/language_m.dart';
/*
all supported languages contains: utils/enums/supported_lang.dart
getFullLanguageString(String shortcut) returns full language name
getFullLanguageString(en) returns 'English'
use a country code, for example:
Poland: pl, USA: us, Great Britain: gbr, Bulgaria: bg
 */
class SupportedLanguages {
  // static const String en = 'English';
  // static const String bg = 'Bulgarian';
  // static const String pl = 'Polish';
  // static const String tr = 'Turkish';
  static const List<Language> list = [
    Language(name: 'English', shortcut: 'us'),
    Language(name: 'Polish', shortcut: 'pl'),
    Language(name: 'Turkish', shortcut: 'tr'),
  ];
  static final List<String> names = list.map((e) => e.name).toList();
  static final List<String> shortcuts = list.map((e) => e.shortcut).toList();


  /*static final List<String> _allSupported = [];

  static List<String> getAllSupported() {
    for (var element in SupportedLang.values) {
      _allSupported.add(element.toString().split('.').elementAt(1));
    }
    return _allSupported;
  }*/
}
