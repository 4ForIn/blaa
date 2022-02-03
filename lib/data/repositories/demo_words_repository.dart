import 'package:blaa/data/model/word_m/word_m.dart';
import 'package:blaa/domain/repository/demo_words_repository_i.dart';

class DemoWordsRepo implements DemoWordsRepositoryI<Word> {
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
