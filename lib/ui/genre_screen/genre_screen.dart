import 'package:flutter/material.dart';
import 'package:ignite_sol/ui/base/base_app_bar.dart';
import 'package:ignite_sol/ui/base/base_screen.dart';
import 'package:ignite_sol/widget/genre_card.dart';

class GenreScreen extends StatefulWidget {
  const GenreScreen({Key key}) : super(key: key);

  @override
  _GenreScreenState createState() => _GenreScreenState();
}

class _GenreScreenState extends State<GenreScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBar: BaseAppBar(
        titleText: "Text",
      ),
      body: ListView.separated(
          itemCount: 10,
          padding: EdgeInsets.all(12),
          separatorBuilder: (context, index) {
            return Container(
              height: 12,
            );
          },
          itemBuilder: (context, index) {
            return GenreCard(
              title: "sdsdsd",
            );
          }),
    );
  }
}
