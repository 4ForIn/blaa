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
      imageUrl: json['imageUrl'] as String?,
      isFavorite: json['isFavorite'] as int? ?? 0,
      nativeLang: json['nativeLang'] as String,
      points: json['points'] as int? ?? 0,
      translation: json['translation'] as String,
      uid: json['uid'] as String,
    );

Map<String, dynamic> _$$_WordToJson(_$_Word instance) => <String, dynamic>{
      'category': instance.category,
      'created': instance.created,
      'clue': instance.clue,
      'imageAsString': instance.imageAsString,
      'imageUrl': instance.imageUrl,
      'isFavorite': instance.isFavorite,
      'nativeLang': instance.nativeLang,
      'points': instance.points,
      'translation': instance.translation,
      'uid': instance.uid,
    };
