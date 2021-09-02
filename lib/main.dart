import 'package:flutter/material.dart';
import 'package:ignite_sol/ui/genre_screen/genre_screen.dart';

void main() {
  runApp(GutenbergApp());
}

class GutenbergApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(child: GenreScreen()),
    );
  }
}
