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

  Future<void> addNewWord(Word item) async {
    final List<Word> _currentState = state.words;
    emit(state.copyWith(status: WordsStateStatus.loading));
    Word _newWord = item.copyWith(
      user: state.currentUser.email,
      nativeLang: state.currentUser.nativeLang,
      langToLearn: state.currentUser.langToLearn,
    );
    try {
      // Words Repository will store the word into local database
      Word _response = await repository.create(_newWord);
      print('WordsCubit addNewWord id: ${_response.id} ');
      final List<Word> _newState = [_response, ..._currentState];
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

  Future<void> triggerFavorite(Word item) async {
    final List<Word> _currentState = state.words;
    final int _itemId = item.id!;
    // if word is favored isFavorite = 1, if it is not isFavorite = 0
    final int _reversedIsFavored = item.isFavorite == 0 ? 1 : 0;
    try {
      final Word _response = await repository.triggerIsFavorite(_itemId);
      List<Word> _newState = _currentState
          .take(_currentState.length)
          .map((Word i) =>
              i.id == _itemId ? _response : i)
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
