import 'package:dio/dio.dart';
import 'package:ignite_sol/index.dart';

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
