import 'package:flutter/material.dart';
import 'package:ignite_sol/model/book.dart';
import 'package:ignite_sol/ui/base/base_app_bar.dart';
import 'package:ignite_sol/ui/base/base_screen.dart';
import 'package:ignite_sol/widget/index.dart';

class BookScreen extends StatefulWidget {
  final String type;

  const BookScreen({Key key, this.type}) : super(key: key);

  @override
  _BookScreenState createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBar: BaseAppBar(
        titleText: "Text",
      ),
      body: GridView.builder(
          itemCount: 10,
          padding: EdgeInsets.all(12),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.48,
            crossAxisCount: 3,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
          ),
          itemBuilder: (context, index) {
            return BookCard(
              book: Book(title: "Title"),
            );
          }),
    );
  }
}
