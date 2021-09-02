import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

class ApiClient {
  Dio dioClient;

  ApiClient.defaultClient({BaseOptions baseOptions}) {
    if (baseOptions == null) {
      baseOptions = BaseOptions(
        connectTimeout: 90000,
        receiveTimeout: 90000,
      );
    }
    dioClient = Dio(baseOptions);

    (dioClient.httpClientAdapter as DefaultHttpClientAdapter)
        .onHttpClientCreate = (HttpClient client) {
      //bypass SSL pinning
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;


      return client;
    };
  }
}
