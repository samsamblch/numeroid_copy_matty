import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'server_api.dart';

class NetworkService {
  // Прод
  static String prodUrl = 'https://b2b.numeroid.ru/api';
  // Дев
  static String devUrl = 'https://b2b.everyhotel.site/api';

  String get baseUrl => devUrl;

  static Dio _createDio({required String baseUrl}) {
    return Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      ),
    );
  }

  NetworkService() {
    final interceptor = getInterceptor();

    final dio = NetworkService._createDio(
      baseUrl: baseUrl,
    );
    dio.interceptors.addAll((interceptor != null) ? [interceptor] : []);

    api = ServerApi(dio: dio);
  }

  late ServerApi api;

  InterceptorsWrapper? getInterceptor() {
    return null;
  }
}

class AuthNetworkService extends NetworkService {
  String token = '';

  @override
  InterceptorsWrapper? getInterceptor() => _CustomInterceptor(tokenCallback: () => token);
}

// ignore: unused_element
class _CustomInterceptor extends InterceptorsWrapper {
  final ValueGetter<String> tokenCallback;

  _CustomInterceptor({
    required this.tokenCallback,
  });

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers['Authorization'] = 'Bearer ${tokenCallback()}';
    super.onRequest(options, handler);
  }
}
