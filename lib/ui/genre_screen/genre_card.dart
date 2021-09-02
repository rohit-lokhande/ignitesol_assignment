import 'package:flutter/material.dart';
import 'package:ignite_sol/index.dart';

typedef OnGenreClick = Function(String type);

class GenreCard extends StatelessWidget {
  final Genre genre;
  final OnGenreClick onClick;

  const GenreCard({Key key, this.genre, this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0),
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: ColorPalette.shadow,
            offset: Offset(0.0, 0.0),
            blurRadius: 2,
            spreadRadius: 0.0,
          ),
        ],
        // ,color: Colors.white
      ),
      child: Material(
        child: InkWell(
          highlightColor: ColorPalette.primary.withOpacity(0.5),
          splashColor: Colors.white30,
          onTap: () {
            if (onClick != null) {
              onClick(genre.type);
            }
          },
          child: Padding(
            padding:  EdgeInsets.all(8.0),
            child: Row(
              children: WidgetUtility.spreadWidgets(
                [
                  Container(
                    height: 32,
                    child: ImageView(
                      assetName: Assets.getFullPath(genre.image),
                    ),
                  ),
                  Expanded(
                      child: Text(
                    genre.title,
                    style: TextStyles.genreCard,
                  )),
                  Container(
                    child: ImageView(
                      assetName: Assets.next,
                    ),
                  ),
                ],
                interItemSpace: 12,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
