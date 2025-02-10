import 'package:dio/dio.dart';

class ServerError implements Exception {
  String? serverMessage;
  int? statusCode;
  ServerError(this.statusCode, this.serverMessage);
}

class DioHttpException implements Exception {
  DioException? exception;

  DioHttpException(this.exception);
}

class NoInternetError implements Exception {}
