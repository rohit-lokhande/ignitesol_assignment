import 'package:flutter/material.dart';

import 'base_app_bar.dart';

class BaseScreen extends StatefulWidget {
  final BaseAppBar appBar;
  final Widget body;

  const BaseScreen({Key key, this.appBar, this.body}) : super(key: key);

  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  @override
  Widget build(BuildContext context) {
    if (widget.appBar == null) {
      return SafeArea(
        child: Scaffold(
          body: widget.body,
        ),
      );
    }

    return Scaffold(
      appBar: widget.appBar,
      body: widget.body,
    );
  }
}
