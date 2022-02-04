import 'package:blaa/data/model/word_m/word_m.dart';
import 'package:blaa/domain/repository/demo_words_repository_i.dart';

class DemoWordsRepo implements DemoWordsRepositoryI<Word> {

  // tests check to see if it returns an empty array
    @override
  List<Word> getDemoWords() {
    try {
      // ?
      return [];
    } catch (e) {
      throw Exception(e);
    }
  }
}
