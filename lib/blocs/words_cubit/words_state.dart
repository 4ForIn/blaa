part of 'words_cubit.dart';

abstract class WordsState extends Equatable {
  const WordsState();
}

class WordsInitial extends WordsState {
  const WordsInitial();

  @override
  List<Object> get props => [];
}

class WordsLoading extends WordsState {
  const WordsLoading();

  @override
  List<Object> get props => [];
}

class WordsLoaded extends WordsState {
  const WordsLoaded(this.words);

  final List<Word> words;

  /*WordsLoaded copyWith({List<Word>? demoWords, List<Word>? words}) {
    return WordsLoaded(
        demoWords: demoWords ?? this.demoWords, words: words ?? this.words);
  }*/

  @override
  List<Object> get props => [words];
}

class WordsError extends WordsState {
  const WordsError(this.code, this.message);

  final int code;
  final String message;

  @override
  List<Object> get props => [code, message];
}
