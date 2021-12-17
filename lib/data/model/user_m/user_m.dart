import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_m.freezed.dart';
part 'user_m.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String created,
    required String email,
    String? imageAsString,
    String? imageUrl,
    required String langToLearn,
    @Default('User') String name,
    required String nativeLang,
    String? password,
    required String uid,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);
}
