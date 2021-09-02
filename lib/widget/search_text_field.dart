import 'package:flutter/material.dart';
import 'package:ignite_sol/index.dart';

typedef OnTextChange = Function(String text);

class SearchTextField extends StatefulWidget {
  final TextEditingController controller;
  final OnTextChange onTextChange;

  const SearchTextField({Key key, this.controller, this.onTextChange})
      : super(key: key);

  @override
  _SearchTextFieldState createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  ValueNotifier<String> enteredText = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: enteredText,
      builder: (context, text, _) {
        return TextField(
          controller: widget.controller,
          onChanged: (str) {
            widget.onTextChange(str);
            enteredText.value = str;
          },
          style: TextStyles.searchBox,
          cursorColor: ColorPalette.primary,
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ColorPalette.primary, width: 1.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent, width: 0.0),
              ),
              focusColor: ColorPalette.primary,
              hintText: "Search",
              helperStyle: TextStyles.bookName,
              fillColor: ColorPalette.athensGray,
              filled: true,
              // suffixIconConstraints: BoxConstraints(),
              prefixIcon: Container(
                  padding: EdgeInsets.all(16),
                  child: ImageView(assetName: Assets.search)),
              contentPadding: EdgeInsets.all(12),
              suffixIcon: (text != null && text.isNotEmpty)
                  ? GestureDetector(
                      onTap: () {
                        enteredText.value = null;
                        widget.controller.text = "";
                        widget.onTextChange(null);
                      },
                      child: Container(
                          padding: EdgeInsets.all(16),
                          child: ImageView(assetName: Assets.cancel)),
                    )
                  : null),
        );
      },
    );
  }
}
