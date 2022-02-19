abstract class WordsLocalDatabaseInterface {
  Future<Map<String, dynamic>> createWord(Map<String, dynamic> newWord);
  Future<List<Map<String, dynamic>>> getWords(int userId);
  Future<void> deleteWord(int wordId);
  Future<Map<String, dynamic>> triggerIsFavorite(int wordId);
  Future close();
}

/*
abstract class WordsLocalDatabaseInterface<T> {
  Future<T?> createWord(T newWord);
  Future<List<T>> getWords(int userId);
  Future<void> deleteWord(int wordId);
  Future<void> triggerIsFavorite(int wordId);
}

 */
