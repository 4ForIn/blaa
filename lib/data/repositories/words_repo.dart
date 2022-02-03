import 'package:blaa/data/model/word_m/word_m.dart';
import 'package:blaa/domain/repository/words_repo_i.dart';

class WordsRepo implements WordsRepoI<Word> {

  @override
  Future<void> add(Word item) async {
    // word item has fields: category, clue, inNative, and inTranslation given from Form,
    // and fields: langToLearn and nativeLang and user (email) given from Authentication Bloc
    // Word object do not have properties: created and id (will be set by database)
    // temporary id value is equal to inNative.

  }

  @override
  Future<void> delete(int id) {
    // TODO: implement delete
    throw UnimplementedError();
  }
  @override
  Future<void> deleteAll(int userId) async {

  }

  @override
  Future<void> edit(Word item) {
    // TODO: implement edit
    throw UnimplementedError();
  }

  @override
  Future<List<Word>> getAllWords(int userId) {
    // try {
    //   return Future.delayed(
    //     const Duration(milliseconds: 300),
    //         () => [],
    //   );
    // } on Exception(e) {
    //   throw Exception(e)
    // }
    return Future.delayed(
            const Duration(milliseconds: 300),
                () => [],
           );
  }

  @override
  Future<List<Word>> search(String query, int userId) {
    // TODO: implement search
    throw UnimplementedError();
  }

  @override
  Future<void> triggerIsFavorite(int id) {
    // TODO: implement triggerIsFavorite
    throw UnimplementedError();
  }
}
