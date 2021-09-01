// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Author _$AuthorFromJson(Map<String, dynamic> json) {
  return Author(
    birthYear: json['birthYear'] as int,
    deathYear: json['deathYear'] as int,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$AuthorToJson(Author instance) => <String, dynamic>{
      'birthYear': instance.birthYear,
      'deathYear': instance.deathYear,
      'name': instance.name,
    };
