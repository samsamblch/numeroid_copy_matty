import 'package:dio/dio.dart';

import '../deserialize.dart';

class BaseApi {
  final Dio _dio;

  const BaseApi(this._dio);

  Future<Response<T>> baseRequest<T>({
    required String method,
    required String path,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? query,
    Object? data,
  }) async {
    final options = Options(method: method);

    final response = await _dio.request<Object>(
      path,
      options: options,
      queryParameters: query,
      data: data,
    );

    T? responseData;

    try {
      final rawData = response.data;
      responseData = rawData == null
          ? null
          : deserialize<T, T>(rawData, T.toString(), growable: true);
    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<T>(
      data: responseData,
      headers: response.headers,
      isRedirect: response.isRedirect,
      requestOptions: response.requestOptions,
      redirects: response.redirects,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
      extra: response.extra,
    );
  }

  Future<Response<T>> get<T>({
    required String path,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? query,
    Object? data,
  }) async {
    return await baseRequest(
      method: 'GET',
      path: path,
      query: query,
      data: data,
    );
  }

  Future<Response<T>> post<T>({
    required String path,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? query,
    Object? data,
  }) async {
    return await baseRequest(
      method: 'POST',
      path: path,
      query: query,
      data: data,
    );
  }
}
