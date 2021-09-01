import 'package:flutter/material.dart';
import 'package:ignite_sol/styles/index.dart';
import 'package:ignite_sol/utils/index.dart';

class BookCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: WidgetUtility.spreadWidgets(
          [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              child: Container(
                height: 162.0,
                // width: 144.0,
                child: Image.network('https://picsum.photos/id/237/200/300'),
              ),
            ),
            Text(
              'THE OLD MAN AND THE SEA',
              style: TextStyles.bookName,
              textAlign: TextAlign.start,
            ),
            Text(
              'Charles Dickens',
              style: TextStyles.bookAuthor,
              textAlign: TextAlign.start,
            ),
          ],
          interItemSpace: 8,
          flowHorizontal: false,
        ),
      ),
    );
  }
}
