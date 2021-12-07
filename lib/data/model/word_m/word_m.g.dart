// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_m.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Word _$$_WordFromJson(Map<String, dynamic> json) => _$_Word(
      category: json['category'] as String?,
      created: json['created'] as String,
      clue: json['clue'] as String?,
      imageAsString: json['imageAsString'] as String?,
      inNative: json['inNative'] as String,
      inTranslation: json['inTranslation'] as String,
      isFavorite: json['isFavorite'] as int? ?? 0,
      langToLearn: json['langToLearn'] as String,
      nativeLang: json['nativeLang'] as String,
      points: json['points'] as int? ?? 0,
      uid: json['uid'] as String,
    );

Map<String, dynamic> _$$_WordToJson(_$_Word instance) => <String, dynamic>{
      'category': instance.category,
      'created': instance.created,
      'clue': instance.clue,
      'imageAsString': instance.imageAsString,
      'inNative': instance.inNative,
      'inTranslation': instance.inTranslation,
      'isFavorite': instance.isFavorite,
      'langToLearn': instance.langToLearn,
      'nativeLang': instance.nativeLang,
      'points': instance.points,
      'uid': instance.uid,
    };
