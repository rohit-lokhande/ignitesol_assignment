import 'package:json_annotation/json_annotation.dart';

part 'genre.g.dart';

@JsonSerializable(createToJson: true)
class Genre {
  String title;
  String image;
  String type;

  Genre({
    this.title,
    this.image,
    this.type,
  });

  factory Genre.forJson(Map<String, dynamic> json) => _$GenreFromJson(json);

  static List<Genre> listFromJson(List<dynamic> data) {
    return data == null
        ? List<Genre>()
        : data.map((value) => Genre.forJson(value)).toList();
  }

}
