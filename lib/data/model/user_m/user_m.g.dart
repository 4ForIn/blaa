// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_m.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      created: json['created'] as String,
      email: json['email'] as String,
      imageAsString: json['imageAsString'] as String?,
      imageUrl: json['imageUrl'] as String?,
      langToLearn: json['langToLearn'] as String,
      name: json['name'] as String? ?? 'User',
      nativeLang: json['nativeLang'] as String,
      password: json['password'] as String?,
      uid: json['uid'] as String,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'created': instance.created,
      'email': instance.email,
      'imageAsString': instance.imageAsString,
      'imageUrl': instance.imageUrl,
      'langToLearn': instance.langToLearn,
      'name': instance.name,
      'nativeLang': instance.nativeLang,
      'password': instance.password,
      'uid': instance.uid,
    };
