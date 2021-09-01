// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Book _$BookFromJson(Map<String, dynamic> json) {
  return Book(
    id: json['id'] as int,
    authors: (json['authors'] as List)
        ?.map((e) =>
            e == null ? null : Author.formJson(e as Map<String, dynamic>))
        ?.toList(),
    bookshelves:
        (json['bookshelves'] as List)?.map((e) => e as String)?.toList(),
    downloadCount: json['downloadCount'] as int,
    formats: json['formats'] == null
        ? null
        : Formats.formJson(json['formats'] as Map<String, dynamic>),
    languages: (json['languages'] as List)?.map((e) => e as String)?.toList(),
    mediaType: json['mediaType'] as String,
    subjects: (json['subjects'] as List)?.map((e) => e as String)?.toList(),
    title: json['title'] as String,
  );
}

Map<String, dynamic> _$BookToJson(Book instance) => <String, dynamic>{
      'id': instance.id,
      'authors': instance.authors,
      'bookshelves': instance.bookshelves,
      'downloadCount': instance.downloadCount,
      'formats': instance.formats,
      'languages': instance.languages,
      'mediaType': instance.mediaType,
      'subjects': instance.subjects,
      'title': instance.title,
    };
