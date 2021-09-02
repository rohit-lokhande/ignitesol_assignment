import 'package:flutter/material.dart';
import 'package:ignite_sol/index.dart';

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
