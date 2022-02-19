import 'dart:async';
abstract class WordsRepoI<T> {
  Future<T> create(T item);
  Future<List<T>> getAll(int userId);
  Future<List<T>> search(String query, int userId);
  Future<void> delete(int itemId);
  Future<void> deleteAll(int userId);
  Future<T> triggerIsFavorite(int itemId);
  Future<void> edit(T item);
}