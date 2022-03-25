abstract class WordsLocalDatabaseInterface {
  Future<Map<String, dynamic>> createWord(Map<String, dynamic> newWord);
  Future<List<Map<String, dynamic>>> getWords(String userEmail);
  Future<Map<String, dynamic>> getSingle(int id);
  Future<void> deleteWord(int wordId);
  Future<int> updateWord(int wordId, Map<String, dynamic> item);
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
