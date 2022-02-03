import 'dart:async';

import 'package:blaa/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:blaa/data/dummy/dummy_words.dart';
import 'package:blaa/data/model/user_m/user_m.dart';
import 'package:blaa/data/model/word_m/word_m.dart';
import 'package:blaa/domain/repository/words_repo_i.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'words_state.dart';

class WordsCubit extends Cubit<WordsState> {
  WordsCubit(this.repository, this._ab) : super(const WordsState()) {
    _authBlocSub = _ab.stream.listen((state) {
      onCurrentUserChanged(state.user);
    });
  }

  final WordsRepoI<Word> repository;
  final AuthenticationBloc _ab;
  late StreamSubscription<AuthenticationState> _authBlocSub;

// default: email: 'demoUser'. nativeLang: 'English', langToLearn: 'Polish'
  void onCurrentUserChanged(User? user) {
    emit(state.copyWith(currentUser: user));
  }

  @override
  Future<void> close() async {
    _authBlocSub.cancel();
    return super.close();
  }

  void fetchWords() {
    List<Word> _newState = [];
    if (state.words.isEmpty) {
      final List<Word> _dummyList = demo5WordsList;
      _newState = [..._dummyList];
    }
    emit(state.copyWith(status: WordsStateStatus.loading));
    try {
      emit(state.copyWith(status: WordsStateStatus.success, words: _newState));
      //  emit(WordsState.success(_getCurrentWordsState()));
    } on Exception {
      emit(state.copyWith(
          status: WordsStateStatus.failure,
          errorText: 'Error - no access to words list!'));
    }
  }

  void addNewWord(Word item) {
    final List<Word> _currentState = state.words;
    emit(state.copyWith(status: WordsStateStatus.loading));
    try {
      Word _newWord = item.copyWith(
          user: state.currentUser.email,
          nativeLang: state.currentUser.nativeLang,
          langToLearn: state.currentUser.langToLearn);
      final List<Word> _newState = [_newWord, ..._currentState];
      emit(state.copyWith(status: WordsStateStatus.success, words: _newState));
    } on Exception {
      print('Added word Exception ');
      emit(state.copyWith(
          status: WordsStateStatus.failure,
          errorText: 'Error - word is not added!'));
    }
  }

  void delete(int id) {
    final List<Word> _currentState = state.words;
    emit(state.copyWith(status: WordsStateStatus.loading));
    try {
      List<Word> _newState =
          List.of(_currentState..removeWhere((e) => e.id == id));
      emit(state.copyWith(status: WordsStateStatus.success, words: _newState));
    } on Exception {
      emit(state.copyWith(
          status: WordsStateStatus.failure,
          errorText: 'Error - word is not deleted!'));
    }
  }

  void triggerFavorite(Word item) {
    final List<Word> _currentState = state.words;
    final int _itemId = item.id!;
    // if word is favored isFavorite = 1, if it is not isFavorite = 0
    final int _reversedIsFavored = item.isFavorite == 0 ? 1 : 0;
    try {
      List<Word> _newState = _currentState
          .take(_currentState.length)
          .map((Word i) =>
              i.id == _itemId ? i.copyWith(isFavorite: _reversedIsFavored) : i)
          .toList();
      emit(state.copyWith(status: WordsStateStatus.success, words: _newState));
    } on Exception {
      emit(state.copyWith(
          status: WordsStateStatus.failure,
          errorText:
              'Error - word is not added/removed to/from favorite list!'));
    }
  }
}

class WordsRepositoryI {}
