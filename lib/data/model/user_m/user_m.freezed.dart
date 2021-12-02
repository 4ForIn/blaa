// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_m.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
class _$UserTearOff {
  const _$UserTearOff();

  _User call(
      {required String created,
      required String email,
      String? imageAsString,
      String? imageUrl,
      required String langToLearn,
      String name = 'User',
      required String nativeLang,
      required String password,
      required String uid}) {
    return _User(
      created: created,
      email: email,
      imageAsString: imageAsString,
      imageUrl: imageUrl,
      langToLearn: langToLearn,
      name: name,
      nativeLang: nativeLang,
      password: password,
      uid: uid,
    );
  }

  User fromJson(Map<String, Object?> json) {
    return User.fromJson(json);
  }
}

/// @nodoc
const $User = _$UserTearOff();

/// @nodoc
mixin _$User {
  String get created => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get imageAsString => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String get langToLearn => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get nativeLang => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call(
      {String created,
      String email,
      String? imageAsString,
      String? imageUrl,
      String langToLearn,
      String name,
      String nativeLang,
      String password,
      String uid});
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object? created = freezed,
    Object? email = freezed,
    Object? imageAsString = freezed,
    Object? imageUrl = freezed,
    Object? langToLearn = freezed,
    Object? name = freezed,
    Object? nativeLang = freezed,
    Object? password = freezed,
    Object? uid = freezed,
  }) {
    return _then(_value.copyWith(
      created: created == freezed
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      imageAsString: imageAsString == freezed
          ? _value.imageAsString
          : imageAsString // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      langToLearn: langToLearn == freezed
          ? _value.langToLearn
          : langToLearn // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      nativeLang: nativeLang == freezed
          ? _value.nativeLang
          : nativeLang // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) then) =
      __$UserCopyWithImpl<$Res>;
  @override
  $Res call(
      {String created,
      String email,
      String? imageAsString,
      String? imageUrl,
      String langToLearn,
      String name,
      String nativeLang,
      String password,
      String uid});
}

/// @nodoc
class __$UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(_User _value, $Res Function(_User) _then)
      : super(_value, (v) => _then(v as _User));

  @override
  _User get _value => super._value as _User;

  @override
  $Res call({
    Object? created = freezed,
    Object? email = freezed,
    Object? imageAsString = freezed,
    Object? imageUrl = freezed,
    Object? langToLearn = freezed,
    Object? name = freezed,
    Object? nativeLang = freezed,
    Object? password = freezed,
    Object? uid = freezed,
  }) {
    return _then(_User(
      created: created == freezed
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      imageAsString: imageAsString == freezed
          ? _value.imageAsString
          : imageAsString // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      langToLearn: langToLearn == freezed
          ? _value.langToLearn
          : langToLearn // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      nativeLang: nativeLang == freezed
          ? _value.nativeLang
          : nativeLang // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_User implements _User {
  const _$_User(
      {required this.created,
      required this.email,
      this.imageAsString,
      this.imageUrl,
      required this.langToLearn,
      this.name = 'User',
      required this.nativeLang,
      required this.password,
      required this.uid});

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override
  final String created;
  @override
  final String email;
  @override
  final String? imageAsString;
  @override
  final String? imageUrl;
  @override
  final String langToLearn;
  @JsonKey(defaultValue: 'User')
  @override
  final String name;
  @override
  final String nativeLang;
  @override
  final String password;
  @override
  final String uid;

  @override
  String toString() {
    return 'User(created: $created, email: $email, imageAsString: $imageAsString, imageUrl: $imageUrl, langToLearn: $langToLearn, name: $name, nativeLang: $nativeLang, password: $password, uid: $uid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _User &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.imageAsString, imageAsString) ||
                other.imageAsString == imageAsString) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.langToLearn, langToLearn) ||
                other.langToLearn == langToLearn) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.nativeLang, nativeLang) ||
                other.nativeLang == nativeLang) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.uid, uid) || other.uid == uid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, created, email, imageAsString,
      imageUrl, langToLearn, name, nativeLang, password, uid);

  @JsonKey(ignore: true)
  @override
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(this);
  }
}

abstract class _User implements User {
  const factory _User(
      {required String created,
      required String email,
      String? imageAsString,
      String? imageUrl,
      required String langToLearn,
      String name,
      required String nativeLang,
      required String password,
      required String uid}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  String get created;
  @override
  String get email;
  @override
  String? get imageAsString;
  @override
  String? get imageUrl;
  @override
  String get langToLearn;
  @override
  String get name;
  @override
  String get nativeLang;
  @override
  String get password;
  @override
  String get uid;
  @override
  @JsonKey(ignore: true)
  _$UserCopyWith<_User> get copyWith => throw _privateConstructorUsedError;
}
