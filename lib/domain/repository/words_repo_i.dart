import 'dart:async';
abstract class WordsRepoI<T> {
  Future<void> add(T item);
  Future<List<T>> getAllWords(int userId);
  Future<List<T>> search(String query, int userId);
  Future<void> delete(int itemId);
  Future<void> deleteAll(int userId);
  Future<void> triggerIsFavorite(int itemId);
  Future<void> edit(T item);
}