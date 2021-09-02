import 'package:json_annotation/json_annotation.dart';

import 'author.dart';
import 'formats.dart';

part 'book.g.dart';

@JsonSerializable(createToJson: true)
class Book {
  int id;
  List<Author> authors;
  List<String> bookshelves;
  int downloadCount;
  Formats formats;
  List<String> languages;
  String mediaType;
  List<String> subjects;
  String title;

  Book(
      {this.id,
      this.authors,
      this.bookshelves,
      this.downloadCount,
      this.formats,
      this.languages,
      this.mediaType,
      this.subjects,
      this.title});

  factory Book.forJson(Map<String, dynamic> json) => _$BookFromJson(json);

  static List<Book> listFromJson(List<dynamic> data) {
    return data == null
        ? List<Book>()
        : data.map((value) => Book.forJson(value)).toList();
  }
}
