import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:ignite_sol/network/api_endpoint.dart';

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

      // //setup proxy
      // if (PrismStrings.apiEndpoints.proxyURL != null) {
      //   client.findProxy = (uri) {
      //     return "PROXY ${PrismStrings.apiEndpoints.proxyURL}";
      //   };
      // }

      return client;
    };
  }
}
