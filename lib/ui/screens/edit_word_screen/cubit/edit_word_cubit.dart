import 'package:blaa/data/model/word_m/word_m.dart';
import 'package:blaa/domain/repository/words_repo_i.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'edit_word_state.dart';

class EditWordCubit extends Cubit<EditWordState> {
  EditWordCubit(this.repository, Word wordItem)
      : super(EditWordState(item: wordItem));

  final WordsRepoI<Word> repository;

  Future<void> triggerFavorite(int id) async {
    print('EditWordCubit - triggerFavorite');
    try {
      final Word _response = await repository.triggerIsFavorite(id);
      emit(state.copyWith(item: _response, msg: null));
    } on Exception {
      emit(state.copyWith(msg: 'Error - favorite words list was NOT updated!'));
    }
  }

  // EditionBottomModal onPressed: () { widget.handle(itemId, _ctr.value.text);}
  Future<void> editInNative(int id, String newValue) async {
    print('EditWordCubit - editInNative');
    Word _newState = state.item.copyWith(inNative: newValue);
    try {
      await repository.update(_newState);
      emit(state.copyWith(item: _newState, msg: null));
    } on Exception {
      emit(state.copyWith(
          msg: 'Error - something went wrong. Try to restart application'));
    }
  }

  Future<void> editInTranslation(int id, String newValue) async {
    print('EditWordCubit - editInTranslation');
    Word _newState = state.item.copyWith(inTranslation: newValue);
    try {
      await repository.update(_newState);
      emit(state.copyWith(item: _newState, msg: null));
    } on Exception {
      emit(state.copyWith(
          msg: 'Error - something went wrong. Try to restart application'));
    }
  }

  Future<void> editCategory(int id, String newValue) async {
    print('EditWordCubit - editCategory');
    Word _newState = state.item.copyWith(category: newValue);
    try {
      await repository.update(_newState);
      emit(state.copyWith(item: _newState, msg: null));
    } on Exception {
      emit(state.copyWith(
          msg: 'Error - something went wrong. Try to restart application'));
    }
  }

  Future<void> editClue(int id, String newValue) async {
    print('EditWordCubit - editClue');
    Word _newState = state.item.copyWith(clue: newValue);
    try {
      await repository.update(_newState);
      emit(state.copyWith(item: _newState, msg: null));
    } on Exception {
      emit(state.copyWith(
          msg: 'Error - something went wrong. Try to restart application'));
    }
  }

  Future<void> resetPoints(int id) async {
    print('EditWordCubit - reset points');
    Word _newState = state.item.copyWith(points: 0);
    try {
      await repository.update(_newState);
      emit(state.copyWith(item: _newState, msg: null));
    } on Exception {
      emit(state.copyWith(
          msg: 'Error - something went wrong. Try to restart application'));
    }
  }
}
