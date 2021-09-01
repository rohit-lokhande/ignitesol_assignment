// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genre.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Genre _$GenreFromJson(Map<String, dynamic> json) {
  return Genre(
    title: json['title'] as String,
    image: json['image'] as String,
    type: json['type'] as String,
  );
}

Map<String, dynamic> _$GenreToJson(Genre instance) => <String, dynamic>{
      'title': instance.title,
      'image': instance.image,
      'type': instance.type,
    };
