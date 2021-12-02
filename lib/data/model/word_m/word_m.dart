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
    String? imageUrl,
    @Default(0) int isFavorite,
    required String nativeLang,
    @Default(0) int points,
    required String translation,
    required String uid,
  }) = _Word;

  factory Word.fromJson(Map<String, dynamic> json) =>
      _$WordFromJson(json);
}