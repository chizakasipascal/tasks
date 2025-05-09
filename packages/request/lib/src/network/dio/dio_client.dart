import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../network_exception.dart';
import 'dio_interceptors.dart';

class DioClient {
  final Dio _dio;

  DioClient(this._dio) {
    // _dio.options.connectTimeout = 15000;
    // _dio.options.receiveTimeout = 60000;
    _dio.interceptors.add(DioInterceptors(_dio));
  }

  Future<dynamic> get({
    required String url,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    return _dio
        .get(
      url,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    )
        .then((response) {
      final result = response.data;
      final int? statusCode = response.statusCode;

      if (statusCode! < 200 || statusCode > 400) {
        throw NetworkException(message: "Error server", statusCode: statusCode);
      }

      debugPrint("RESPONSE : $result");
      return result;
    }).catchError((onError) {
      throw NetworkException(
        message: "Connection error",
        statusCode: 504,
      );
    });
  }

  Future<dynamic> post({
    required String url,
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    return _dio
        .post(
      url,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    )
        .then((response) {
      final result = response.data;
      final int? statusCode = response.statusCode;

      if (statusCode! < 200 || statusCode > 400) {
        throw NetworkException(
            message: "Error when to try to fetch data from server",
            statusCode: statusCode);
      }

      debugPrint("RESPONSE : $result");
      return result;
    }).catchError((onError) {
      throw NetworkException(message: "Connexion Error", statusCode: 504);
    });
  }

  Future<dynamic> put({
    required String url,
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    return _dio
        .put(
      url,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    )
        .then((response) {
      final result = response.data;
      final int? statusCode = response.statusCode;

      if (statusCode! < 200 || statusCode > 400) {
        throw NetworkException(
            message: "Error when to try to fetch data from server",
            statusCode: statusCode);
      }

      debugPrint("RESPONSE : $result");
      return result;
    }).catchError((onError) {
      throw NetworkException(message: "Connexion Error", statusCode: 504);
    });
  }

  Future<dynamic> patch({
    required String url,
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    return _dio
        .patch(
      url,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    )
        .then((response) {
      final result = response.data;
      final int? statusCode = response.statusCode;

      if (statusCode! < 200 || statusCode > 400) {
        throw NetworkException(
            message: "Error when to try to fetch data from server",
            statusCode: statusCode);
      }

      debugPrint("RESPONSE : $result");
      return result;
    }).catchError((onError) {
      throw NetworkException(message: "Connexion Error", statusCode: 504);
    });
  }
}
