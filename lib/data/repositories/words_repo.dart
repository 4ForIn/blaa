import 'package:blaa/data/model/word_m/word_m.dart';
import 'package:blaa/data/providers/db/db_interface/words_local_database_interface.dart';
import 'package:blaa/domain/repository/words_repo_i.dart';
import 'package:blaa/locator.dart';

class WordsRepo implements WordsRepoI<Word> {
  // WordsRepo(this.database);

  final WordsLocalDatabaseInterface _database =
      locator<WordsLocalDatabaseInterface>();

  @override
  Future<Word> create(Word item) async {
    // word item has fields: category, clue, inNative, and inTranslation given from Form,
    // and fields: langToLearn and nativeLang and user (email) given from Authentication Bloc
    // Word object do not have properties: created and id (id will be set by database)
    // WordsRepo has to set created
    // before that word.id = null !
    Word _noIdItem = item.copyWith(
      id: null,
      created: _makeTimeStamp(),
      clue: item.clue != '' ? item.clue : null,
      category: item.category != '' ? item.category : null,
    );
    Map<String, dynamic> _json = _noIdItem.toJson();
    // print('JSON: $_json');
    Map<String, dynamic> _res = await _database.createWord(_json);
    return Word.fromJson(_res);
  }

  @override
  Future<void> delete(int id) async {
    // Future.delayed(const Duration(microseconds: 20),
    //     () => print('word id: $id was deleted'));
    await _database.deleteWord(id);
  }

  @override
  Future<void> deleteAll(int userId) async {}

  @override
  Future<void> edit(Word item) {
    // TODO: implement edit
    throw UnimplementedError();
  }

  @override
  Future<List<Word>> getAll(int userId) async {
    List<Word> _allWords = [];
    final List<Map<String, dynamic>> _jsonResponse =
        await _database.getWords(userId);
    if (_jsonResponse.isNotEmpty) {
      _allWords =
          _jsonResponse.map((element) => Word.fromJson(element)).toList();
    }
    return _allWords;
  }

  @override
  Future<List<Word>> search(String query, int userId) {
    // TODO: implement search
    throw UnimplementedError();
  }

  @override
  Future<Word> triggerIsFavorite(int id) async {
    Map<String, dynamic> _response = await _database.triggerIsFavorite(id);
    return Word.fromJson(_response);
  }

  String _makeTimeStamp() => DateTime.now().toIso8601String();
}
