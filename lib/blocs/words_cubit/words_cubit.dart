import 'dart:async';

import 'package:blaa/blocs/user_cubit/user_cubit.dart';
import 'package:blaa/data/dummy/dummy_words.dart';
import 'package:blaa/data/model/word_m/word_m.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'words_state.dart';

class WordsCubit extends Cubit<WordsState> {
  WordsCubit() : super(const WordsState.loading());

  List<Word> _getCurrentWordsState() {
    final List<Word> _currentState = state.words;
    return _currentState;
  }

  void fetchWords() {
    // List<Word> _newState = [];
    // if(_getCurrentWordsState().isEmpty) {
    //   final List<Word> _dummyList = dummyWords2;
    //   _newState = [..._dummyList];
    // }
    emit(const WordsState.loading());
    try {
      emit(WordsState.success(_getCurrentWordsState()));
    } on Exception {
      emit(const WordsState.failure('Error - no access to words list!'));
    }
  }

  void addNewWord(Word item) {
    final List<Word> _currentState = _getCurrentWordsState();
    emit(const WordsState.loading());
    try {
      final List<Word> _newState = [item, ..._currentState];
      emit(WordsState.success(_newState));
    } on Exception {
      emit(const WordsState.failure('Error - word is not added!'));
    }
  }

  void delete(String id) {
    final List<Word> _currentState = _getCurrentWordsState();
    emit(const WordsState.loading());
    try {
      List<Word> _newState =
          List.of(_currentState..removeWhere((e) => e.uid == id));
      emit(WordsState.success(_newState));
    } on Exception {
      emit(const WordsState.failure('Error - word is not deleted!'));
    }
  }

  void triggerFavorite(Word item) {
    final List<Word> _currentState = _getCurrentWordsState();
    final String _uid = item.uid;
    // if word is favored isFavorite = 1, if it is not isFavorite = 0
    final int _reversedIsFavored = item.isFavorite == 0 ? 1 : 0;
    try {
      List<Word> _newState = _currentState
          .take(_currentState.length)
          .map((Word i) =>
              i.uid == _uid ? i.copyWith(isFavorite: _reversedIsFavored) : i)
          .toList();
      emit(WordsState.success(_newState));
    } on Exception {
      emit(const WordsState.failure(
          'Error - word is not added/removed to/from favorite list!'));
    }
  }
}
