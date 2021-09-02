import 'package:flutter/material.dart';
import 'package:ignite_sol/index.dart';

/// [AppNavigator] uses for navigation. All navigation should be routed using [AppNavigator]

class AppNavigator {
  static void closeScreen(BuildContext context, {dynamic result}) {
    Navigator.pop(context, result);
  }

  static Future<Object> _navigateToScreen(
    BuildContext context,
    StatefulWidget destinationScreen,
  ) async {
    return Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            destinationScreen,
        transitionDuration: Duration(milliseconds: 500),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = Offset(0.0, 1.0);
          var end = Offset.zero;
          var curve = Curves.ease;
          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      ),
    );
  }

  static void navigateToGenreScreen(BuildContext context) {
    _navigateToScreen(context, GenreScreen());
  }

  static void navigateToBookScreen(BuildContext context, String type) {
    _navigateToScreen(
        context,
        BookScreen(
          type: type,
        ));
  }
}
