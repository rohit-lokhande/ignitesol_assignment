import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  final String assetName;
  final BoxFit fit;
  final Alignment alignment;
  final double height;
  final double width;

  const ImageView(
      {Key key,
      this.assetName,
      this.fit: BoxFit.contain,
      this.alignment: Alignment.centerLeft,
      this.height,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(assetName,
        alignment: alignment, fit: fit, width: width, height: height);
  }
}
