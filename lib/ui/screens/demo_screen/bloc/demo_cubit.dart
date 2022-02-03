import 'package:blaa/data/model/word_m/word_m.dart';
import 'package:blaa/domain/repository/demo_words_repository_i.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'demo_state.dart';

class DemoCubit extends Cubit<DemoState> {
  DemoCubit(this.repository) : super(const DemoState.loading());

  final DemoWordsRepositoryI<Word> repository;

  List<Word> _getCurrentDemoState() {
    final List<Word> _currentState = state.words;
    return _currentState;
  }

  void fetchWords() {
    emit(const DemoState.loading());
    try {
      List<Word> _newState = [];
      if (_getCurrentDemoState().isEmpty) {
        final List<Word> _data = repository.getDemoWords();
        _newState = [..._data];
      } else {
        _newState = _getCurrentDemoState();
      }
      emit(DemoState.success(_newState));
      // emit(DemoState.success(state.words));
    } on Exception {
      emit(const DemoState.failure('Something went wrong. Please try again'));

    }
  }

  void addNewWord(Word item) {
    //final List<Word> _currentState = _getCurrentDemoState();
    emit(const DemoState.loading());
    try {
      final List<Word> _newState = [item, ...state.words];
      emit(DemoState.success(_newState));
    } on Exception {
      emit(const DemoState.failure('Error - word is not added!'));
    }
  }

  void delete(int id) {
    final List<Word> _currentState = _getCurrentDemoState();
    emit(const DemoState.loading());
    try {
      List<Word> _newState =
          List.of(_currentState..removeWhere((e) => e.id == id));
      emit(DemoState.success(_newState));
    } on Exception {
      emit(const DemoState.failure('Error - word is not deleted!'));
    }
  }

  void triggerFavorite(Word item) {
    final List<Word> _currentState = _getCurrentDemoState();
    final int _itemId = item.id!;
    // if word is favored isFavorite = 1, if it is not isFavorite = 0
    final int _reversedIsFavored = item.isFavorite == 0 ? 1 : 0;
    try {
      List<Word> _newState = _currentState
          .take(_currentState.length)
          .map((Word i) =>
              i.id == _itemId ? i.copyWith(isFavorite: _reversedIsFavored) : i)
          .toList();
      emit(DemoState.success(_newState));
    } on Exception {
      emit(const DemoState.failure(
          'Error - word is not added/removed to/from favorite list!'));
    }
  }
}
