import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rika_ecomm_app/screens/auth/model/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  final _storage = FlutterSecureStorage();
  final SharedPreferences _pref;
  LocalStorageService(this._pref);

  Future saveToken(String token) async {
    await _storage.write(key: "token", value: token);
  }

  Future<String?> getToken() async {
    return _storage.read(key: "token");
  }

  Future<void> clearSession() async {
    return _storage.delete(key: "token");
  }

  Future<void> saveUser(User user) async {
    await _pref.setString("user", jsonEncode(user.toJson()));
  }

  User? getUser() {
    final userJson = _pref.getString("user");
    if (userJson != null) {
      return User.fromJson(jsonDecode(userJson));
    }
    return null;
  }

  Future<void> setAddressId(String addressId) async {
    await _pref.setString("addressId", addressId);
  }

  String? getAddressId() {
    return _pref.getString("addressId");
  }

  Future<void> clearAddress() async {
    await _pref.remove("addressId");
  }

  Future<void> setFavorite(List<String> products) async {
    await _pref.setStringList("productId", products);
  }

  Future<List<String>?> getFavorite() async {
    return _pref.getStringList("productId");
  }

  Future<void> addFavorite(String productId) async {
    final currentFavorites = await getFavorite() ?? [];
    if (!currentFavorites.contains(productId)) {
      currentFavorites.add(productId);
      await setFavorite(currentFavorites);
    }
  }

  Future<void> removeFavorite(String productId) async {
    final currentFavorites = await getFavorite() ?? [];
    if (currentFavorites.contains(productId)) {
      currentFavorites.remove(productId);
      await setFavorite(currentFavorites);
    }
  }

  Future<void> clearFavorites() async {
    await _pref.remove("productId");
  }

  Future<bool> isFavorite(String productId) async {
    final currentFavorites = await getFavorite() ?? [];
    return currentFavorites.contains(productId);
  }
}
