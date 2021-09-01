import 'package:json_annotation/json_annotation.dart';

part 'formats.g.dart';

@JsonSerializable(createToJson: true)
class Formats {
  String applicationXMobipocketEbook;
  String textPlainCharsetUtf8;
  String applicationRdfXml;
  String textPlainCharsetIso88591;
  String applicationZip;
  String applicationEpubZip;
  String imageJpeg;
  String textHtmlCharsetUtf8;
  String applicationPdf;
  String textPlainCharsetUsAscii;

  Formats(
      {this.applicationXMobipocketEbook,
      this.textPlainCharsetUtf8,
      this.applicationRdfXml,
      this.textPlainCharsetIso88591,
      this.applicationZip,
      this.applicationEpubZip,
      this.imageJpeg,
      this.textHtmlCharsetUtf8,
      this.applicationPdf,
      this.textPlainCharsetUsAscii});

  factory Formats.formJson(Map<String, dynamic> json) =>
      _$FormatsFromJson(json);
}
