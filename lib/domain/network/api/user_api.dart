import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:numeroid/domain/network/api/base_api.dart';
import 'package:numeroid/domain/model/ro/login_ro.dart';

import '../../model/req/login_req.dart';

class UserApi extends BaseApi {
  UserApi(super.dio);

  Future<Response<LoginRo>> loginPost({
    required LoginRequest req,
  }) async {
    final username = 'manager';
    final password = 'yMTF3pNFWu7HQk';

    String basicAuth = 'Basic ' + base64.encode(utf8.encode('$username:$password'));
    
    final result = await post<LoginRo>(
      path: '/auth/login',
      // headers: {'Authorization': basicAuth},
      data: {
        'email': req.email,
        'password': req.password,
      },
    );

    return result;
  }

  Future<Response<LoginRo>> recoverPost({
    required String email,
  }) async {
    final result = await post<LoginRo>(
      path: '/auth/recover',
      data: {
        'email': email,
      },
    );
    return result;
  }
}
