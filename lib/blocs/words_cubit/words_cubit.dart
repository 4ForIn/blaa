import 'package:blaa/data/dummy/dummy_words.dart';
import 'package:blaa/data/model/word_m/word_m.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'words_state.dart';

class WordsCubit extends Cubit<WordsState> {
  WordsCubit() : super(const WordsInitial());

  final List<Word> _dummyList = dummyWords2;

  final List<WordsState> _prevState = <WordsState>[];

  List<Word> _prevWordsLoadedState() {
    List<Word> _previewState = <Word>[..._dummyList];
    if (_prevState.whereType<WordsLoaded>().isNotEmpty) {
      _previewState = _prevState.whereType<WordsLoaded>().last.words;
    }
    return _previewState;
  }

  @override
  void onChange(Change<WordsState> change) {
    _prevState.add(change.nextState);
    super.onChange(change);
  }

  void getWords() {
    try {
      emit(const WordsLoading());

      emit(WordsLoaded(_prevWordsLoadedState()));
    } on Exception {
      emit(const WordsError(-1, 'Error - no access to words list!'));
    }
  }

  void addNewWord(Word item) {
    try {
      emit(const WordsLoading());
      final List<Word> _prev = _prevWordsLoadedState();
      final List<Word> _newState = [item, ..._prev];
      emit(WordsLoaded(_newState));
    } on Exception {
      emit(const WordsError(-1, 'Error - word is not added!'));
    }
  }

  void triggerFavorite(Word item) {
    try {
      emit(const WordsLoading());
      final String _uid = item.uid;
      // if word is favored isFavorite = 1, if it is not isFavorite = 0
      final int _reversedIsFavored = item.isFavorite == 0 ? 1 : 0;
      final List<Word> _prev = _prevWordsLoadedState();
      List<Word> _newState = _prev
          .take(_prev.length)
          .map((Word i) =>
              i.uid == _uid ? i.copyWith(isFavorite: _reversedIsFavored) : i)
          .toList();

      emit(WordsLoaded(_newState));
    } on Exception {
      emit(const WordsError(
          -1, 'Error - word is not added/removed to/from favorite list!'));
    }
  }
}
