import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  final _storage = FlutterSecureStorage();
  final SharedPreferences _pref ;
  LocalStorageService(this._pref);

  Future saveToken(String token) async {
    await _storage.write(key: "token", value: token);
  }

  Future<String?> getToken() async {
    return _storage.read(key: "token");
  }
  Future<void> clearSession() async{
    return _storage.delete(key: "token");
  }

  Future<void> setAddressId(String addressId) async {
  await _pref.setString( "addressId", addressId);
  }

  String? getAddressId()  {
    return _pref.getString("addressId");
  }
  
  Future<void> clearAddress() async{
    await _pref.remove("addressId");
  }
}
