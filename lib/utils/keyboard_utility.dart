import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class KeyboardUtility {
  static void hideKeyboard({BuildContext context}) {
    if (context != null && FocusScope.of(context).hasFocus) {
      FocusScope.of(context).unfocus();
    }
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  static void removeFocus(BuildContext context) {
    if (context != null && FocusScope.of(context).hasFocus) {
      FocusScope.of(context).unfocus();
    }
  }
}
