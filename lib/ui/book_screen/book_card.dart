import 'package:flutter/material.dart';
import 'package:ignite_sol/index.dart';

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
                      ? Container(
                          child: Image.network(
                            book.formats.imageJpeg,
                            fit: BoxFit.fill,
                            frameBuilder: (context, child, frame, _) {
                              if (frame == null) {
                                return _placeholder();
                              }
                              return child;
                            },
                            errorBuilder: (context, _, __) {
                              return _placeholder();
                            },
                            // fit: BoxFit.cover,
                          ),
                        )
                      : _placeholder(),
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

  Container _placeholder() {
    return Container(
      color: ColorPalette.athensGray,
      child: Image.asset(
        Assets.bookPlaceholder,
        scale: 1.5,
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
