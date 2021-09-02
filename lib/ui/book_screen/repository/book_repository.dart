import 'package:dio/dio.dart';

abstract class BookRepository {
  Future<dynamic> fetchBooks(String url, CancelToken cancelToken);
}
