import 'package:flutter/material.dart';
import 'package:ignite_sol/styles/index.dart';

class BaseAppBar extends AppBar {
  final String titleText;

  BaseAppBar({this.titleText})
      : super(
          title: Text(titleText,style: TextStyles.heading1,),
          elevation: 0,
          backgroundColor: ColorPalette.secondary,
        );
}
