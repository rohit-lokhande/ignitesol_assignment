import 'package:ignite_sol/model/book.dart';

abstract class BookScreenEvent {
  List<Book> books;

  BookScreenEvent(this.books);
}

class LoadingEvent extends BookScreenEvent {
  LoadingEvent(List<Book> books) : super(books);
}

class SuccessEvent extends BookScreenEvent {
  SuccessEvent(List<Book> books) : super(books);
}

class ErrorEvent extends BookScreenEvent {
  String error;

  ErrorEvent(List<Book> books, {this.error}) : super(books);
}
