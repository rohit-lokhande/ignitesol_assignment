import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ignite_sol/model/book.dart';
import 'package:ignite_sol/model/formats.dart';
import 'package:ignite_sol/network/api_endpoint.dart';
import 'package:ignite_sol/styles/assets.dart';
import 'package:ignite_sol/styles/color_palette.dart';
import 'package:ignite_sol/styles/text_styles.dart';
import 'package:ignite_sol/ui/base/base_app_bar.dart';
import 'package:ignite_sol/ui/base/base_screen.dart';
import 'package:ignite_sol/ui/book_screen/bloc/book_bloc.dart';
import 'package:ignite_sol/ui/book_screen/book_card_shimmer.dart';
import 'package:ignite_sol/ui/book_screen/events/book_screen_event.dart';
import 'package:ignite_sol/utils/index.dart';
import 'package:ignite_sol/utils/keyboard_utility.dart';
import 'package:ignite_sol/widget/index.dart';
import 'package:ignite_sol/widget/keyboard_listener.dart';
import 'package:ignite_sol/widget/search_text_field.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

class BookScreen extends StatefulWidget {
  final String type;

  const BookScreen({Key key, this.type}) : super(key: key);

  @override
  _BookScreenState createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  BookBloc _bloc;
  ScrollController _scrollController = ScrollController();

  TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _bloc = BookBloc(ApiEndPoint.getBookByType(widget.type));
    _bloc.fetchBookByGenre();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBar: BaseAppBar(
        titleText: widget.type,
        context: context,
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (_scrollController.offset >=
              _scrollController.position.maxScrollExtent &&
              !_scrollController.position.outOfRange) {
            if (!_bloc.isFetchingInProgress) {
              _bloc.fetchBookByGenre();
            }
          }
          return false;
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 12,
                left: 12,
                right: 12,
              ),
              child: SearchTextField(
                controller: _textEditingController,
                onTextChange: (text) {
                  if (text != null && text.isNotEmpty) {
                    _bloc.fetchBookBySearch(text);
                  } else {
                    _bloc.nextUrl = ApiEndPoint.getBookByType(widget.type);
                    _bloc.fetchBookByGenre();
                  }
                },
              ),
            ),
            Expanded(
              child: KeyboardListener(
                child: (isVisible) {
                  return _body();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _body() {
    return ValueListenableBuilder<BookScreenEvent>(
      valueListenable: _bloc.subject,
      builder: (context, event, _) {
        List<Widget> _widgets = [];
        if (event != null) {
          if (event.books.isNotEmpty) {
            _widgets.add(_bookGridView(event.books));
          }
          if (event is SuccessEvent) {
            if (event.books.isEmpty) {
              _widgets.add(_emptyDataView());
            }
          } else if (event is LoadingEvent) {
            if (event.books.isNotEmpty) {
              _widgets.add(Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: CircularProgressIndicator(
                  valueColor:
                       AlwaysStoppedAnimation<Color>(ColorPalette.primary),
                ),
              ));
            } else {
              _widgets.add(_shimmerView());
            }
          } else if (event is ErrorEvent) {
            if (event.error != null && event.error.isNotEmpty) {
              _widgets.add(Container());
            }
          }

          return Container(
            color: ColorPalette.secondary,
            child: Column(
              children: WidgetUtility.spreadWidgets(
                _widgets,
                interItemSpace: 12,
                flowHorizontal: false,
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }

  Container _emptyDataView() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: WidgetUtility.spreadWidgets(
          [
            Image.asset(
              Assets.bookPlaceholder,
              height: 140,
              width: 140,
              fit: BoxFit.fill,
            ),
            Text(
              "No data found",
              style: TextStyles.heading2,
            )
          ],
          interItemSpace: 8,
          flowHorizontal: false,
        ),
      ),
    );
  }

  _bookGridView(List<Book> books) {
    double cardWidth = MediaQuery.of(context).size.width / 3.5;
    double cardHeight = MediaQuery.of(context).size.height / 3.5;
    return Expanded(
      child: GridView.builder(
          key: PageStorageKey('books'),
          itemCount: books.length,
          controller: _scrollController,
          shrinkWrap: true,
          padding: EdgeInsets.all(12),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: cardWidth / cardHeight,
            crossAxisCount: 3,
            mainAxisSpacing: 8,
            crossAxisSpacing: 12,
          ),
          itemBuilder: (context, index) {
            return BookCard(
              book: books[index],
              onClick: (book) {
                _onBookClick(book);
              },
            );
          }),
    );
  }

  Widget _shimmerView() {
    double cardWidth = MediaQuery.of(context).size.width / 3.5;
    double cardHeight = MediaQuery.of(context).size.height / 3.5;
    return Expanded(
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300],
        highlightColor: Colors.grey[100],
        period: Duration(seconds: 2),
        child: Expanded(
          child: GridView.builder(
              itemCount: 5,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(12),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: cardWidth / cardHeight,
                crossAxisCount: 3,
                mainAxisSpacing: 8,
                crossAxisSpacing: 12,
              ),
              itemBuilder: (context, index) {
                return BookCardShimmer();
              }),
        ),
      ),
    );
  }

  Future<void> _onBookClick(Book book) async {
    KeyboardUtility.removeFocus(context);

    String format = _getAvailableBookFormat(book.formats);

    if (format != null && format.isNotEmpty) {
      if (await canLaunch(format)) {
        await launch(format);
      } else {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text("oops something went wrong"),
        ));
      }
    } else {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("Book Preview not available"),
      ));
    }
  }

  String _getAvailableBookFormat(Formats formats) {
    if (formats.applicationPdf != null && formats.applicationPdf.isNotEmpty) {
      return formats.applicationPdf;
    } else if (formats.textHtmlCharsetUtf8 != null &&
        formats.textHtmlCharsetUtf8.isNotEmpty) {
      return formats.textHtmlCharsetUtf8;
    } else if (formats.textPlainCharsetUtf8 != null &&
        formats.textPlainCharsetUtf8.isNotEmpty) {
      return formats.textPlainCharsetUtf8;
    } else {
      return null;
    }
  }
}
