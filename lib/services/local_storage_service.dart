import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorageService {
  final _storage = FlutterSecureStorage();

  Future saveToken(String token) async {
    await _storage.write(key: "token", value: token);
  }

  Future<String?> getToken() async {
    return _storage.read(key: "token");
  }
}
