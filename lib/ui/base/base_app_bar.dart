import 'package:flutter/material.dart';
import 'package:ignite_sol/index.dart';

class BaseAppBar extends AppBar {
  final String titleText;
  final BuildContext context;

  BaseAppBar({this.titleText, this.context})
      : super(
          title: Text(
            titleText,
            style: TextStyles.heading2,
          ),
          elevation: 0,
          backgroundColor: ColorPalette.secondary,
          titleSpacing: 2,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: ColorPalette.primary),
            iconSize: 28,
            onPressed: () {
              if (Navigator.canPop(context)) {
                AppNavigator.closeScreen(context);
              }
            },
          ),
        );
}
