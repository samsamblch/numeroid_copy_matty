import 'package:numeroid/domain/database/database.dart';
import 'package:numeroid/domain/model/req/login_req.dart';
import 'package:numeroid/domain/model/ro/login_ro.dart';

import '../../core/locator.dart';

class UserRepository {
  void saveToken(String token) {
    locator<DataBase>().secureSave(key: 'token', value: token);
  }

  Future<String?> loadToken() async {
    return await locator<DataBase>().secureRead(key: 'token');
  }

  Future<LoginRo> sendCredentials({
    required String email,
    required String password,
  }) async {
    final response = await unauthApi.getUserApi().loginPost(
          req: LoginRequest(
            email: email,
            password: password,
          ),
        );

    if (response.data != null) {
      return response.data!;
    } else {
      throw Error();
    }
  }

  Future<bool> recoveryPassword({
    required String email,
  }) async {
    final response = await unauthApi.getUserApi().recoverPost(
          email: email,
        );

    if (response.statusCode == 204) {
      return true;
    } else {
      throw Error();
    }
  }

  void loadOrgInfo() {
    return;
  }

  void loadOrgTransactions() {
    return;
  }

    void loadOrgMembers() {
    return;
  }
}
