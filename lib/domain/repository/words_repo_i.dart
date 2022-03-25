import 'dart:async';
abstract class WordsRepoI<T> {
  Future<T> create(T item);
  Future<List<T>> getAll(String userEmail);
  Future<List<T>> search(String query, int userId);
  Future<void> delete(int itemId);
  Future<void> deleteAll(int userId);
  Future<T> triggerIsFavorite(int itemId);
  Future<void> update(T item);
  Stream<String> get change;
  void dispose();
}