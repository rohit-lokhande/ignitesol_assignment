import 'package:json_annotation/json_annotation.dart';

part 'formats.g.dart';

@JsonSerializable(createToJson: true)
class Formats {
  String applicationXMobipocketEbook;
  String applicationPdf;
  String textPlainCharsetUsAscii;
  String textPlainCharsetUtf8;
  String applicationRdfXml;
  String applicationZip;
  String applicationEpubZip;
  String textHtmlCharsetUtf8;

  Formats(
      {this.applicationXMobipocketEbook,
      this.applicationPdf,
      this.textPlainCharsetUsAscii,
      this.textPlainCharsetUtf8,
      this.applicationRdfXml,
      this.applicationZip,
      this.applicationEpubZip,
      this.textHtmlCharsetUtf8});

  factory Formats.forJson(Map<String, dynamic> json) => _$FormatsFromJson(json);
}
