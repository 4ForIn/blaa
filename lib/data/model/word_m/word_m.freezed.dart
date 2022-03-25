// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'word_m.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Word _$WordFromJson(Map<String, dynamic> json) {
  return _Word.fromJson(json);
}

/// @nodoc
class _$WordTearOff {
  const _$WordTearOff();

  _Word call(
      {String? category,
      String? created,
      String? clue,
      required int id,
      String? imageAsString,
      required String inNative,
      required String inTranslation,
      int isFavorite = 0,
      String langToLearn = 'Polish',
      String nativeLang = 'English',
      int points = 0,
      String? user}) {
    return _Word(
      category: category,
      created: created,
      clue: clue,
      id: id,
      imageAsString: imageAsString,
      inNative: inNative,
      inTranslation: inTranslation,
      isFavorite: isFavorite,
      langToLearn: langToLearn,
      nativeLang: nativeLang,
      points: points,
      user: user,
    );
  }

  Word fromJson(Map<String, Object?> json) {
    return Word.fromJson(json);
  }
}

/// @nodoc
const $Word = _$WordTearOff();

/// @nodoc
mixin _$Word {
  String? get category => throw _privateConstructorUsedError;
  String? get created => throw _privateConstructorUsedError;
  String? get clue => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  String? get imageAsString => throw _privateConstructorUsedError;
  String get inNative => throw _privateConstructorUsedError;
  String get inTranslation => throw _privateConstructorUsedError;
  int get isFavorite => throw _privateConstructorUsedError;
  String get langToLearn => throw _privateConstructorUsedError;
  String get nativeLang => throw _privateConstructorUsedError;
  int get points => throw _privateConstructorUsedError;
  String? get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WordCopyWith<Word> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordCopyWith<$Res> {
  factory $WordCopyWith(Word value, $Res Function(Word) then) =
      _$WordCopyWithImpl<$Res>;
  $Res call(
      {String? category,
      String? created,
      String? clue,
      int id,
      String? imageAsString,
      String inNative,
      String inTranslation,
      int isFavorite,
      String langToLearn,
      String nativeLang,
      int points,
      String? user});
}

/// @nodoc
class _$WordCopyWithImpl<$Res> implements $WordCopyWith<$Res> {
  _$WordCopyWithImpl(this._value, this._then);

  final Word _value;
  // ignore: unused_field
  final $Res Function(Word) _then;

  @override
  $Res call({
    Object? category = freezed,
    Object? created = freezed,
    Object? clue = freezed,
    Object? id = freezed,
    Object? imageAsString = freezed,
    Object? inNative = freezed,
    Object? inTranslation = freezed,
    Object? isFavorite = freezed,
    Object? langToLearn = freezed,
    Object? nativeLang = freezed,
    Object? points = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      created: created == freezed
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as String?,
      clue: clue == freezed
          ? _value.clue
          : clue // ignore: cast_nullable_to_non_nullable
              as String?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      imageAsString: imageAsString == freezed
          ? _value.imageAsString
          : imageAsString // ignore: cast_nullable_to_non_nullable
              as String?,
      inNative: inNative == freezed
          ? _value.inNative
          : inNative // ignore: cast_nullable_to_non_nullable
              as String,
      inTranslation: inTranslation == freezed
          ? _value.inTranslation
          : inTranslation // ignore: cast_nullable_to_non_nullable
              as String,
      isFavorite: isFavorite == freezed
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as int,
      langToLearn: langToLearn == freezed
          ? _value.langToLearn
          : langToLearn // ignore: cast_nullable_to_non_nullable
              as String,
      nativeLang: nativeLang == freezed
          ? _value.nativeLang
          : nativeLang // ignore: cast_nullable_to_non_nullable
              as String,
      points: points == freezed
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$WordCopyWith<$Res> implements $WordCopyWith<$Res> {
  factory _$WordCopyWith(_Word value, $Res Function(_Word) then) =
      __$WordCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? category,
      String? created,
      String? clue,
      int id,
      String? imageAsString,
      String inNative,
      String inTranslation,
      int isFavorite,
      String langToLearn,
      String nativeLang,
      int points,
      String? user});
}

/// @nodoc
class __$WordCopyWithImpl<$Res> extends _$WordCopyWithImpl<$Res>
    implements _$WordCopyWith<$Res> {
  __$WordCopyWithImpl(_Word _value, $Res Function(_Word) _then)
      : super(_value, (v) => _then(v as _Word));

  @override
  _Word get _value => super._value as _Word;

  @override
  $Res call({
    Object? category = freezed,
    Object? created = freezed,
    Object? clue = freezed,
    Object? id = freezed,
    Object? imageAsString = freezed,
    Object? inNative = freezed,
    Object? inTranslation = freezed,
    Object? isFavorite = freezed,
    Object? langToLearn = freezed,
    Object? nativeLang = freezed,
    Object? points = freezed,
    Object? user = freezed,
  }) {
    return _then(_Word(
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      created: created == freezed
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as String?,
      clue: clue == freezed
          ? _value.clue
          : clue // ignore: cast_nullable_to_non_nullable
              as String?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      imageAsString: imageAsString == freezed
          ? _value.imageAsString
          : imageAsString // ignore: cast_nullable_to_non_nullable
              as String?,
      inNative: inNative == freezed
          ? _value.inNative
          : inNative // ignore: cast_nullable_to_non_nullable
              as String,
      inTranslation: inTranslation == freezed
          ? _value.inTranslation
          : inTranslation // ignore: cast_nullable_to_non_nullable
              as String,
      isFavorite: isFavorite == freezed
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as int,
      langToLearn: langToLearn == freezed
          ? _value.langToLearn
          : langToLearn // ignore: cast_nullable_to_non_nullable
              as String,
      nativeLang: nativeLang == freezed
          ? _value.nativeLang
          : nativeLang // ignore: cast_nullable_to_non_nullable
              as String,
      points: points == freezed
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Word implements _Word {
  const _$_Word(
      {this.category,
      this.created,
      this.clue,
      required this.id,
      this.imageAsString,
      required this.inNative,
      required this.inTranslation,
      this.isFavorite = 0,
      this.langToLearn = 'Polish',
      this.nativeLang = 'English',
      this.points = 0,
      this.user});

  factory _$_Word.fromJson(Map<String, dynamic> json) => _$$_WordFromJson(json);

  @override
  final String? category;
  @override
  final String? created;
  @override
  final String? clue;
  @override
  final int id;
  @override
  final String? imageAsString;
  @override
  final String inNative;
  @override
  final String inTranslation;
  @JsonKey()
  @override
  final int isFavorite;
  @JsonKey()
  @override
  final String langToLearn;
  @JsonKey()
  @override
  final String nativeLang;
  @JsonKey()
  @override
  final int points;
  @override
  final String? user;

  @override
  String toString() {
    return 'Word(category: $category, created: $created, clue: $clue, id: $id, imageAsString: $imageAsString, inNative: $inNative, inTranslation: $inTranslation, isFavorite: $isFavorite, langToLearn: $langToLearn, nativeLang: $nativeLang, points: $points, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Word &&
            const DeepCollectionEquality().equals(other.category, category) &&
            const DeepCollectionEquality().equals(other.created, created) &&
            const DeepCollectionEquality().equals(other.clue, clue) &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.imageAsString, imageAsString) &&
            const DeepCollectionEquality().equals(other.inNative, inNative) &&
            const DeepCollectionEquality()
                .equals(other.inTranslation, inTranslation) &&
            const DeepCollectionEquality()
                .equals(other.isFavorite, isFavorite) &&
            const DeepCollectionEquality()
                .equals(other.langToLearn, langToLearn) &&
            const DeepCollectionEquality()
                .equals(other.nativeLang, nativeLang) &&
            const DeepCollectionEquality().equals(other.points, points) &&
            const DeepCollectionEquality().equals(other.user, user));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(category),
      const DeepCollectionEquality().hash(created),
      const DeepCollectionEquality().hash(clue),
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(imageAsString),
      const DeepCollectionEquality().hash(inNative),
      const DeepCollectionEquality().hash(inTranslation),
      const DeepCollectionEquality().hash(isFavorite),
      const DeepCollectionEquality().hash(langToLearn),
      const DeepCollectionEquality().hash(nativeLang),
      const DeepCollectionEquality().hash(points),
      const DeepCollectionEquality().hash(user));

  @JsonKey(ignore: true)
  @override
  _$WordCopyWith<_Word> get copyWith =>
      __$WordCopyWithImpl<_Word>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WordToJson(this);
  }
}

abstract class _Word implements Word {
  const factory _Word(
      {String? category,
      String? created,
      String? clue,
      required int id,
      String? imageAsString,
      required String inNative,
      required String inTranslation,
      int isFavorite,
      String langToLearn,
      String nativeLang,
      int points,
      String? user}) = _$_Word;

  factory _Word.fromJson(Map<String, dynamic> json) = _$_Word.fromJson;

  @override
  String? get category;
  @override
  String? get created;
  @override
  String? get clue;
  @override
  int get id;
  @override
  String? get imageAsString;
  @override
  String get inNative;
  @override
  String get inTranslation;
  @override
  int get isFavorite;
  @override
  String get langToLearn;
  @override
  String get nativeLang;
  @override
  int get points;
  @override
  String? get user;
  @override
  @JsonKey(ignore: true)
  _$WordCopyWith<_Word> get copyWith => throw _privateConstructorUsedError;
}
