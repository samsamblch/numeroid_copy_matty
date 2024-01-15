import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DataBase {
  Future<void> secureSave({required String key, required String value}) async {
    const storage = FlutterSecureStorage();
    await storage.write(key: key, value: value);
  }

  Future<String?> secureRead({required String key}) async {
    const storage = FlutterSecureStorage();
    return await storage.read(key: key);
  }
}