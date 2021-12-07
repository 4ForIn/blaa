import 'package:freezed_annotation/freezed_annotation.dart';

part 'word_m.freezed.dart';
part 'word_m.g.dart';

@freezed
class Word with _$Word {
  const factory Word({
    String? category,
    required String created,
    String? clue,
    String? imageAsString,
    required String inNative,
    required String inTranslation,
    @Default(0) int isFavorite,
    required String langToLearn,
    required String nativeLang,
    @Default(0) int points,
    required String uid,
  }) = _Word;

  factory Word.fromJson(Map<String, dynamic> json) =>
      _$WordFromJson(json);
}