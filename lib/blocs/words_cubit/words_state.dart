part of 'words_cubit.dart';

enum WordsStateStatus { loading, success, failure }

class WordsState extends Equatable {
  const WordsState._({
    this.words = const <Word>[],
    this.status = WordsStateStatus.loading,
    this.errorText,
  });

  final List<Word> words;
  final WordsStateStatus status;
  final String? errorText;

  const WordsState.loading() : this._();

  const WordsState.success(List<Word> i)
      : this._(status: WordsStateStatus.success, words: i);

  const WordsState.failure(String? message)
      : this._(status: WordsStateStatus.failure, errorText: message);

  @override
  List<Object> get props => [words, status];
}
