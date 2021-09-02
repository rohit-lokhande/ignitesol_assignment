import 'package:flutter/material.dart';
import 'package:ignite_sol/index.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

typedef KeyboardWidgetBuilder<T> = Widget Function(T);

class KeyboardListener extends StatefulWidget {
  final KeyboardWidgetBuilder child;
  final tapToDismiss;

  const KeyboardListener({
    Key key,
    this.child,
    this.tapToDismiss = true,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _KeyboardState();
  }
}

class _KeyboardState extends State<KeyboardListener> {
  KeyboardVisibilityNotification _keyboardVisibility =
      KeyboardVisibilityNotification();

  int _keyboardVisibilitySubscriberId;

  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();

    _keyboardVisibilitySubscriberId = _keyboardVisibility.addNewListener(
      onChange: (bool visible) {
        setState(() {
          _isKeyboardVisible = visible;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.tapToDismiss) {
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        key: widget.key,
        child: widget.child(_isKeyboardVisible),
        onTap: () {
          if (_isKeyboardVisible) {
            KeyboardUtility.hideKeyboard(context: context);
          }
        },
      );
    } else {
      return widget.child(_isKeyboardVisible);
    }
  }

  @override
  void dispose() {
    _keyboardVisibility.removeListener(_keyboardVisibilitySubscriberId);
    _keyboardVisibility.dispose();
    super.dispose();
  }
}
