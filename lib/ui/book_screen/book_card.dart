import 'package:flutter/material.dart';
import 'package:ignite_sol/model/book.dart';
import 'package:ignite_sol/styles/assets.dart';
import 'package:ignite_sol/styles/index.dart';
import 'package:ignite_sol/utils/index.dart';

typedef OnBookClick = Function(Book book);

class BookCard extends StatelessWidget {
  final Book book;
  final OnBookClick onClick;

  const BookCard({Key key, this.book, this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(book?.formats?.imageJpeg);
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
                  height: 140,
                  child: (book?.formats?.imageJpeg != null &&
                          book.formats.imageJpeg.isNotEmpty)
                      ? Image.network(
                          book.formats.imageJpeg,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          Assets.bookPlaceholder,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              Text(
                book.title,
                style: TextStyles.bookName,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                _authorsName,
                style: TextStyles.bookAuthor,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,

              ),
            ],
            interItemSpace: 6,
            flowHorizontal: false,
          ),
        ),
      ),
    );
  }

  String get _authorsName {
    String _author = '';

    for (int i = 0; i < book.authors.length; i++) {
      if (_author.isNotEmpty) {
        _author = '$_author,${book.authors[i].name}';
      } else {
        _author = '${book.authors[i].name}';
      }
    }

    return _author;
  }
}
