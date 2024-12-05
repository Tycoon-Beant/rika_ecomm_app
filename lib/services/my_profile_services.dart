import 'dart:io';

import 'package:dio/dio.dart';
import 'package:rika_ecomm_app/model/my_profile_model.dart';
import 'package:rika_ecomm_app/services/dio_exceptions.dart';
import 'package:rika_ecomm_app/services/dio_instance.dart';

import 'local_storage_service.dart';

class MyProfileServices {
  final LocalStorageService _localStorageService;

  MyProfileServices(this._localStorageService);

  Future<MyProfile> getMyProfile() async {
    final response = await DioSingleton().dio.get(
          "ecommerce/profile",
          options: Options(headers: {
            HttpHeaders.authorizationHeader:
                "Bearer ${await _localStorageService.getToken()}"
          }),
        );
    final body = response.data;
    final profile = MyProfile.fromJson(body["data"]);
    return profile;
  }

  
  Future<MyProfile> patchProfileDetails(
    {Map<String, dynamic>? data
}) async {
    try {
      final response = await DioSingleton().dio.patch(
        'ecommerce/profile',
        options: Options(headers: {
          HttpHeaders.authorizationHeader:
              "Bearer ${await _localStorageService.getToken()}"
        }),
        data: data,
      );
      final body = response.data;
      return MyProfile.fromJson(body["data"]);
    } on DioException catch (e) {
      print("Error patching profile: $e");
      throw DioExceptions.fromDioError(e);
    }
  }
}
