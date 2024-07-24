import 'package:dio/dio.dart';
import 'package:numeroid/domain/network/api/base_api.dart';
import 'package:numeroid/domain/model/ro/login_ro.dart';

import '../../model/req/login_req.dart';

class UserApi extends BaseApi {
  UserApi(super.dio);

  Future<Response<LoginRo>> loginPost({
    required LoginRequest req,
  }) async {
    final result = await post<LoginRo>(
      path: '/auth/login',
     
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
