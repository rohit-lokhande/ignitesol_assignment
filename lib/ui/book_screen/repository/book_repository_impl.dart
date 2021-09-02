import 'package:dio/dio.dart';
import 'package:dio/src/cancel_token.dart';
import 'package:ignite_sol/network/api_client.dart';
import 'package:ignite_sol/ui/book_screen/repository/book_repository.dart';

class BookRepositoryImpl extends BookRepository {
  @override
  Future<dynamic> fetchBooks(String url, CancelToken cancelToken) async {
    try {
      ApiClient apiClient = ApiClient.defaultClient();
      Response response = await apiClient.dioClient.get(
        url,
        cancelToken: cancelToken,
      );
      Map<String, dynamic> data = response.data;

      return data;
    } catch (e) {
      rethrow;
    }
  }
}
