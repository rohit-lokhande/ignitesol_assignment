import 'package:flutter/material.dart';
import 'package:ignite_sol/styles/index.dart';
import 'package:ignite_sol/utils/index.dart';

typedef OnGenreClick = Function();

class GenreCard extends StatelessWidget {
  final String preFix;
  final String title;
  final OnGenreClick onClick;

  const GenreCard({Key key, this.preFix, this.title, this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onClick != null) {
          onClick();
        }
      },
      child: Container(
        padding: EdgeInsets.all(4),
        height: 50,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: ColorPalette.shadow,
            offset: Offset(0.0, 0.0),
            blurRadius: 2,
            spreadRadius: 0.0,
          )
        ]),
        child: Row(
          children: WidgetUtility.spreadWidgets(
            [
              Image.network(
                'https://picsum.photos/id/237/200/300',
                // height: 20,
                // width: 20,
              ),
              Expanded(
                  child: Text(
                "wiwoiwoqi",
                style: TextStyles.genreCard,
              )),
              Image.network(
                'https://picsum.photos/id/237/200/300',
                // height: 20,
                // width: 20,
              ),
            ],
            interItemSpace: 12,
          ),
        ),
      ),
    );
  }
}
