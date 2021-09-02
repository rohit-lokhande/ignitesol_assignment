import 'package:json_annotation/json_annotation.dart';

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

  factory Formats.formJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return Formats(
      applicationXMobipocketEbook:
          json['application/x-mobipocket-ebook'] as String,
      textPlainCharsetUtf8: json['text/plain; charset=utf-8'] as String,
      applicationRdfXml: json['application/rdf+xml'] as String,
      textPlainCharsetIso88591: json['text/plain; charset=us-ascii'] as String,
      applicationZip: json['application/zip'] as String,
      applicationEpubZip: json['application/epub+zip'] as String,
      imageJpeg: json['image/jpeg'] as String,
      textHtmlCharsetUtf8: json['text/html; charset=utf-8'] as String,
      applicationPdf: json['application/pdf'] as String,
      textPlainCharsetUsAscii: json['text/plain; charset=us-ascii'] as String,
    );
  }
}
