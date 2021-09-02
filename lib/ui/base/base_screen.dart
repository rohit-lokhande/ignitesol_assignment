import 'package:flutter/material.dart';

import 'base_app_bar.dart';

class BaseScreen extends StatefulWidget {
  final BaseAppBar appBar;
  final Widget body;
  final bool topViewPadding;
  final Color backgroundColor;

  const BaseScreen({Key key, this.appBar, this.body, this.topViewPadding: true,this.backgroundColor})
      : super(key: key);

  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  @override
  Widget build(BuildContext context) {
    if (widget.appBar == null) {
      return SafeArea(
        top: widget.topViewPadding,
        child: Scaffold(
          body:  Container(
              color: widget.backgroundColor,
              child: widget.body
          ),
        ),
      );
    }

    return Scaffold(
      appBar: widget.appBar,
      body: Container(
        color: widget.backgroundColor,
        child: widget.body
      ),
    );
  }
}
