import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ImageView extends StatelessWidget {
  final String assetName;
  final BoxFit fit;
  final Alignment alignment;
  final double height;
  final double width;
  final WidgetBuilder placeholderBuilder;

  const ImageView(
      {Key key,
      this.assetName,
      this.fit: BoxFit.contain,
      this.alignment: Alignment.centerLeft,
      this.height,
      this.width,
      this.placeholderBuilder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      alignment: alignment,
      fit: fit,
      width: width,
      height: height,
      placeholderBuilder: placeholderBuilder ??
          (_) {
            return Container();
          },
    );
  }
}
