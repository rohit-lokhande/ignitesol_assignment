import 'package:flutter/material.dart';
import 'package:ignite_sol/styles/index.dart';
import 'package:ignite_sol/utils/index.dart';

class GenreCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
