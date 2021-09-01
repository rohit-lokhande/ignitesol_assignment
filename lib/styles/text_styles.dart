import 'package:flutter/material.dart';

import 'index.dart';

class TextStyles {
  static const String montserrat = 'Montserrat';

  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight semiBold = FontWeight.w600;

  static TextStyle get bookName => TextStyle(
        inherit: false,
        color: ColorPalette.mineShaft,
        fontWeight: bold,
        fontFamily: montserrat,
        fontSize: 12.0,
      );
  static TextStyle get body => TextStyle(
        inherit: false,
        color: ColorPalette.mineShaft,
        fontWeight: bold,
        fontFamily: montserrat,
        fontSize: 16.0,
      );

  static TextStyle get bookAuthor => TextStyle(
        inherit: false,
        color: ColorPalette.silverChalice,
        fontWeight: bold,
        fontFamily: montserrat,
        fontSize: 12.0,
      );

  static TextStyle get genreCard => TextStyle(
        inherit: false,
        color: ColorPalette.mineShaft,
        fontWeight: bold,
        fontFamily: montserrat,
        fontSize: 20.0,
      );

  static TextStyle get heading2 => TextStyle(
        inherit: false,
        color: ColorPalette.primary,
        fontWeight: semiBold,
        fontFamily: montserrat,
        fontSize: 30.0,
      );

  static TextStyle get heading1 => TextStyle(
        inherit: false,
        color: ColorPalette.primary,
        fontWeight: semiBold,
        fontFamily: montserrat,
        fontSize: 48.0,
      );
}
