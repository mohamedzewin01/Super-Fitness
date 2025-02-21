import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

Dio dioProvider() {
  Dio dio = Dio();
  dio.interceptors.add(PrettyDioLogger(
      requestBody: true,
      request: true,
      responseHeader: true,
      responseBody: true,
      requestHeader: true));

  return dio;
}
