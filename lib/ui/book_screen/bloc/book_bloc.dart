import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ignite_sol/model/book.dart';
import 'package:ignite_sol/network/api_client.dart';
import 'package:ignite_sol/network/api_endpoint.dart';
import 'package:ignite_sol/ui/book_screen/events/book_screen_event.dart';
import 'package:ignite_sol/ui/book_screen/repository/book_repository.dart';
import 'package:ignite_sol/ui/book_screen/repository/book_repository_impl.dart';
import 'package:rxdart/rxdart.dart';

class BookBloc {
  BookRepository _repository = BookRepositoryImpl();
  String nextUrl;
  List<Book> _fetchBookData = List();

  BookBloc(this.nextUrl);

  bool _isFetchingInProgress = false;

  bool get isFetchingInProgress => _isFetchingInProgress;

  bool get shouldFetchNext => (nextUrl != null);

  final ValueNotifier<BookScreenEvent> _subject =
      ValueNotifier<BookScreenEvent>(null);

  ValueNotifier<BookScreenEvent> get subject => _subject;
  CancelToken _cancelToken;

  Future<void> _fetchBooks() async {
    if (!_isFetchingInProgress && nextUrl != null) {
      try {
        _isFetchingInProgress = true;
        _cancelToken = CancelToken();
        _subject.value = LoadingEvent(_fetchBookData);
        Map<String, dynamic> data =
            await _repository.fetchBooks(nextUrl, _cancelToken);
        nextUrl = data["next"];
        List<Book> _books = Book.listFromJson(data['results']);
        _fetchBookData.addAll(_books);
        _subject.value = SuccessEvent(_fetchBookData);
        _isFetchingInProgress = false;
      } catch (e) {
        _isFetchingInProgress = false;
        if(_cancelToken.isCancelled){
          _subject.value = SuccessEvent(_fetchBookData);
        }else{
          _subject.value = ErrorEvent(_fetchBookData, error: e.toString());
        }
      }
    }
  }

  fetchBookBySearch(String data) {
    if (_isFetchingInProgress) {
      _cancelToken.cancel();
      _isFetchingInProgress = false;
    }
    _fetchBookData.clear();
      nextUrl = ApiEndPoint.getBookBySearch(data);
    _fetchBooks();
  }

  fetchBookByGenre() {
    _fetchBooks();
  }

  dispose() {
    _subject.value = null;
  }
}
