import 'package:alo_booking_app/core/constants/constants.dart';
import 'package:alo_booking_app/core/exceptions/exceptions.dart';
import 'package:dio/dio.dart';

abstract class BaseDioHelper {
  Future<dynamic> post({
    String? base,
    required String endPoint,
    dynamic data,
    dynamic query,
    String? token,
    ProgressCallback? progressCallback,
    CancelToken? cancelToken,
    int? timeOut,
    bool isMultipart = false,
  });

  Future<dynamic> get({
    String? base,
    required String endPoint,
    dynamic data,
    dynamic query,
    String? token,
    CancelToken? cancelToken,
    int? timeOut,
    bool isMultipart = false,
  });
}

class DioHelper extends BaseDioHelper {
  Dio _dio() {
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: AppApis.baseUrl + AppApis.version,
        receiveDataWhenStatusError: true,
        connectTimeout: 10000,
        receiveTimeout: 10000,
      ),
    );

    dio.interceptors.add(LogInterceptor(
      requestBody: true,
      error: true,
      requestHeader: true,
      responseHeader: false,
      request: true,
      responseBody: true,
    ));

    return dio;
  }

  @override
  Future<dynamic> get({
    String? base,
    required String endPoint,
    dynamic data,
    dynamic query,
    String? token,
    CancelToken? cancelToken,
    int? timeOut,
    bool isMultipart = false,
  }) async {
    return await request(
      call: () async => await _dio().get(
        endPoint,
        queryParameters: query,
        cancelToken: cancelToken,
        options: Options(
          headers: {
            if (isMultipart) 'Content-Type': 'multipart/form-data',
            if (!isMultipart) 'Content-Type': 'application/json',
            if (!isMultipart) 'Accept': 'application/json',
            if (token != null) 'token': token,
          },
        ),
      ),
    );
  }

  @override
  Future<dynamic> post({
    String? base,
    required String endPoint,
    dynamic data,
    dynamic query,
    String? token,
    ProgressCallback? progressCallback,
    CancelToken? cancelToken,
    int? timeOut,
    bool isMultipart = false,
  }) async {
    return await request(
      call: () async => await _dio().post(
        endPoint,
        data: data,
        queryParameters: query,
        onSendProgress: progressCallback,
        cancelToken: cancelToken,
        options: Options(
          headers: {
            if (isMultipart) 'Content-Type': 'multipart/form-data',
            if (!isMultipart) 'Content-Type': 'application/json',
            if (!isMultipart) 'Accept': 'application/json',
            if (token != null) 'token': token,
          },
        ),
      ),
    );
  }
}

extension on BaseDioHelper {
  Future request({
    required Future<Response> Function() call,
  }) async {
    try {
      final r = await call.call();
      // debugPrint("Response_Data => ${r.data}");
      // debugPrint("Response_Code => ${r.statusCode}");

      if (r.data['status']['type'] == '0') {
        dynamic title = r.data['status']['title'];

        throw PrimaryServerException(
          message: title is String ? title : r.data['status']['title']['ar'],
          code: r.statusCode ?? 500,
          error: title is String ? title : r.data['status']['title']['en'],
        );
      }

      return r.data;
    } on DioError catch (e) {
      print("Error_Message => ${e.message}");
      print("Error_Error => ${e.error.toString()}");
      print("Error_Type => ${e.type.toString()}");

      throw PrimaryServerException(
        code: 100,
        error: 'error message',
        message: 'message Hello from primary exception',
      );
    } catch (e) {
      PrimaryServerException exception = e as PrimaryServerException;

      throw PrimaryServerException(
        code: exception.code,
        error: exception.error,
        message: exception.message,
      );
    }
  }
}
