import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'author.g.dart';

@JsonSerializable(createToJson: true)
class Author {
  int birthYear;
  int deathYear;
  String name;

  Author({this.birthYear, this.deathYear, this.name});

  factory Author.formJson(Map<String, dynamic> json) => _$AuthorFromJson(json);
}
