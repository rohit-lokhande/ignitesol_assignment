import 'package:flutter/material.dart';

/// [WidgetUtility] provides functionality to adding spacing between widgets and filter null views.

typedef Children = void Function(List<Widget>);

class WidgetUtility {
  static bool notNull(Object o) => o != null;

  static List<Widget> childrenBuilder(Children children) {
    List<Widget> _children = [];

    children(_children);

    return _children.where(notNull).toList();
  }

  static List<Widget> childrenFilter(List<Widget> children) {
    return children.where(notNull).toList();
  }

  static bool isScrollViewInWidgetTree(BuildContext context, Key key) {
    bool keyFound = false;
    context.visitAncestorElements((visitor) {
      if (visitor.widget.key == key) {
        keyFound = true;
        return true;
      }
      return true;
    });
    return keyFound;
  }

  static List<Widget> spreadWidgets(
    List<Widget> widgets, {
    bool flowHorizontal = true,
    Color background = Colors.transparent,
    EdgeInsets padding = EdgeInsets.zero,
    double interItemSpace = 1,
    double width,
    double height,
  }) {
    List<Widget> spacedWidgets = [];
    List<Widget> _widgets = WidgetUtility.childrenFilter(widgets);
    for (int index = 0; index < _widgets.length; index++) {
      spacedWidgets.add(_widgets[index]);
      if (index < (_widgets.length - 1)) {
        if (flowHorizontal) {
          spacedWidgets.add(SizedBox(
            width: interItemSpace, // widht of spacer
            child: Container(
              color: background,
              height: height,
              margin: EdgeInsets.only(top: padding.top, bottom: padding.bottom),
            ),
          ));
        } else {
          spacedWidgets.add(SizedBox(
            height: interItemSpace, // height of spacer
            child: Container(
              color: background,
              width: width,
              margin: EdgeInsets.only(left: padding.left, right: padding.right),
            ),
          ));
        }
      }
    }
    return spacedWidgets;
  }
}
