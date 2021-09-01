import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ignite_sol/model/book.dart';
import 'package:ignite_sol/ui/base/base_app_bar.dart';
import 'package:ignite_sol/ui/base/base_screen.dart';
import 'package:ignite_sol/ui/book_screen/bloc/book_bloc.dart';
import 'package:ignite_sol/ui/book_screen/events/book_screen_event.dart';
import 'package:ignite_sol/utils/index.dart';
import 'package:ignite_sol/widget/index.dart';

class BookScreen extends StatefulWidget {
  final String type;

  const BookScreen({Key key, this.type}) : super(key: key);

  @override
  _BookScreenState createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  BookBloc _bloc;
  ScrollController _scrollController = ScrollController();
GlobalKey<_BookScreenState> _gridViewKey = GlobalKey();
  @override
  void initState() {
    super.initState();
    _bloc = BookBloc(
        "http://skunkworks.ignitesol.com:8000/books/?type=${widget.type}");
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
            child: _body()));
  }

  Widget _body() {
    return ValueListenableBuilder<BookScreenEvent>(
      valueListenable: _bloc.subject,
      builder: (context, snapshot,_) {
        List<Widget> _widgets = [];
        if (snapshot != null) {
          if (snapshot is SuccessEvent) {
            _widgets.add(_bookGridView(snapshot.books));
          } else if (snapshot is LoadingEvent) {
            if (snapshot.books.isNotEmpty) {
              _widgets.add(_bookGridView(snapshot.books));
            }
            _widgets.add(CircularProgressIndicator());
          } else if (snapshot is ErrorEvent) {
            if (snapshot.books.isNotEmpty) {
              _widgets.add(_bookGridView(snapshot.books));
            }
            _widgets.add(Container(
              height: 40,
              width: 40,
              color: Colors.red,
            ));
          }

          return Column(
            children: WidgetUtility.spreadWidgets(
              _widgets,
              interItemSpace: 12,
              flowHorizontal: false,
            ),
          );
        } else  {
          //todo: add error view
          return Container();
        }
        return const CircularProgressIndicator();
      },
    );
  }

  _bookGridView(List<Book> books) {
    return Expanded(
      child: GridView.builder(
          key: PageStorageKey('feed'), //keeps scroll position
                   itemCount: books.length,
          controller: _scrollController,
          shrinkWrap: true,
          padding: EdgeInsets.all(12),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.5,
            crossAxisCount: 3,
            mainAxisSpacing: 8,
            crossAxisSpacing: 12,
          ),
          itemBuilder: (context, index) {
            return BookCard(
              book: books[index],
            );
          }),
    );
  }
}
