import 'package:flutter/material.dart';
import 'package:ignite_sol/model/book.dart';
import 'package:ignite_sol/styles/index.dart';
import 'package:ignite_sol/utils/index.dart';

typedef OnBookClick = Function(Book book);

class BookCard extends StatelessWidget {
  final Book book;
  final OnBookClick onClick;

  const BookCard({Key key, this.book, this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onClick != null) {
          onClick(book);
        }
      },
      child: Container(
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
                book.title,
                style: TextStyles.bookName,
                textAlign: TextAlign.start,
              ),
              Text(
                book.authors[0].name,
                style: TextStyles.bookAuthor,
                textAlign: TextAlign.start,
              ),
            ],
            interItemSpace: 8,
            flowHorizontal: false,
          ),
        ),
      ),
    );
  }
}
