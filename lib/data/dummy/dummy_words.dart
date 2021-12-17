import 'package:blaa/data/model/word_m/word_m.dart';
import 'package:blaa/utils/constants/languages.dart';

const dummyWords2 = <Word>[
  Word(
    created: '11855',
    uid: '1',
    inNative: 'first',
    inTranslation: 'firstTR',
    isFavorite: 0,
    langToLearn: SupportedLanguages.tr,
    nativeLang: SupportedLanguages.en,
  ),
  Word(
    created: '11887',
    category: 'animal',
    uid: '2',
    inNative: 'second',
    inTranslation: 'secondTR',
    isFavorite: 1,
    langToLearn: SupportedLanguages.tr,
    nativeLang: SupportedLanguages.en,
  ),
  Word(
    created: '11888',
    uid: '3',
    inNative: 'third',
    inTranslation: 'thirdTR',
    isFavorite: 0,
    langToLearn: SupportedLanguages.tr,
    nativeLang: SupportedLanguages.en,
  ),
];
