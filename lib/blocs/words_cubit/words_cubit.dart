import 'dart:async';

import 'package:blaa/blocs/authentication_bloc/authentication_bloc.dart';
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
    _repositorySub = repository.change.listen((event) {
      fetchWords();
    });
  }

  final WordsRepoI<Word> repository;
  final AuthenticationBloc _ab;
  late StreamSubscription<AuthenticationState> _authBlocSub;
  late StreamSubscription<String> _repositorySub;

  @override
  Future<void> close() async {
    repository.dispose();
    _authBlocSub.cancel();
    _repositorySub.cancel();
    return super.close();
  }

// default: email: 'demo@user'. nativeLang: 'English', langToLearn: 'Polish'
  void onCurrentUserChanged(User? user) {
    print('WordsCubit-onCurrentUserChanged -- user.email: ${user?.email}');
    User _currentUser = user ?? const User();
    emit(state.copyWith(currentUser: _currentUser));
    fetchWords();
  }

  Future<void> fetchWords() async {
    emit(state.copyWith(status: WordsStateStatus.loading));
    print('WordCubit fetch email: ${state.currentUser.email}');
    if (state.currentUser.email == 'demo@user') {
      emit(state.copyWith(
          status: WordsStateStatus.failure,
          errorText: 'Error - no access to words list! Try to login again'));
    } else {
      try {
        List<Word> _newState = await repository.getAll(state.currentUser.email);
        emit(
            state.copyWith(status: WordsStateStatus.success, words: _newState));
      } on Exception {
        emit(state.copyWith(
            status: WordsStateStatus.failure,
            errorText: 'Error - no access to words list!'));
      }
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

  Future<void> triggerFavorite(int id) async {
    print('WC - triggerFavorite');
    final List<Word> _currentState = state.words;
    // final int _itemId = item.id;
    // if word is favored isFavorite = 1, if it is not isFavorite = 0
    try {
      final Word _response = await repository.triggerIsFavorite(id);
      List<Word> _newState = _currentState
          .take(_currentState.length)
          .map((Word i) => i.id == id ? _response : i)
          .toList();
      emit(state.copyWith(status: WordsStateStatus.success, words: _newState));
    } on Exception {
      emit(state.copyWith(
          status: WordsStateStatus.failure,
          errorText: 'Error - favorite words list was NOT updated!'));
    }
  }

  // FILTERING:
  void orderItemsListByCreated(bool isFromOldest) {
    // by default database returns items ordered from the most recent
    final List<Word> _st = state.words;
    emit(state.copyWith(status: WordsStateStatus.loading));
    if (isFromOldest) {
      _st.sort((a, b) => a.created!.compareTo(b.created!));
    } else {
      _st.sort((a, b) => b.created!.compareTo(a.created!));
    }
    emit(state.copyWith(status: WordsStateStatus.success, words: _st));
  }

  void toggleShowOnlyFavored(bool isOnlyFavored) {
    emit(state.copyWith(isShowOnlyFavored: isOnlyFavored));
  }
}
