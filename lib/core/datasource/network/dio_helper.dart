import 'package:dio/dio.dart';

Dio dioHelper() {
  Dio dio = Dio(
    BaseOptions(
      receiveDataWhenStatusError: true,
      connectTimeout: 10000,
      receiveTimeout: 10000,
    ),
  );

  dio.interceptors.add(LogInterceptor(
    requestBody: true,
    error: true,
    requestHeader: false,
    responseHeader: false,
    request: true,
    responseBody: true,
  ));

  return dio;
}
