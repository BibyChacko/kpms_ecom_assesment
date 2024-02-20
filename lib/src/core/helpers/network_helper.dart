import 'dart:io';

import 'package:dio/dio.dart';

class NetworkHelper {
  late Dio _dio;
  NetworkHelper() {
    _dio = Dio();
    _dio.options.baseUrl = "https://dummyjson.com/";
    _dio.options.connectTimeout = const Duration(seconds: 30);
    _dio.options.receiveTimeout = const Duration(seconds: 40);
    _dio.options.contentType = "application/json";
  }

  Future sendGetRequest({required String route}) async {
    Response response = await _dio.get(route);
    if (response.statusCode == HttpStatus.ok) {
      return response.data;
    } else {
      throw DioException(
          requestOptions: response.requestOptions, response: response);
    }
  }

}
