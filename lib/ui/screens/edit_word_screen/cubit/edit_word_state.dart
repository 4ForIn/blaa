part of 'edit_word_cubit.dart';

enum WordsStateStatus { loading, success, failure }

class EditWordState extends Equatable {
  const EditWordState({required this.item, this.msg});

  final Word item;
  final String? msg;

  @override
  List<Object?> get props => [item, msg];

  EditWordState copyWith({
    Word? item,
    String? msg,
  }) {
    return EditWordState(item: item ?? this.item, msg: msg ?? this.msg);
  }
}
