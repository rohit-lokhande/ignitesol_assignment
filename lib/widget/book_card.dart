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
        // color: Colors.red,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: WidgetUtility.spreadWidgets(
            [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                child: Container(
                  // height: 162.0,
                  // width: 144.0,
                  child: Image.network('https://picsum.photos/id/237/200/300'),
                ),
              ),
              Text(
               " book.title",
                style: TextStyles.bookName,
              ),
              Text(
                "book.authors[0].name",
                style: TextStyles.bookAuthor,
              ),
            ],
            interItemSpace: 6,
            flowHorizontal: false,
          ),
        ),
      ),
    );
  }
}
