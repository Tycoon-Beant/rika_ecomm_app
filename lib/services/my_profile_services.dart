import 'dart:io';

import 'package:dio/dio.dart';
import 'package:rika_ecomm_app/model/my_profile_model.dart';
import 'package:rika_ecomm_app/services/dio_instance.dart';

import 'local_storage_service.dart';

class MyProfileServices {
  final LocalStorageService _localStorageService;

  MyProfileServices(this._localStorageService);

Future<MyProfile> getMyProfile() async {
    final response = await DioSingleton().dio.get("ecommerce/profile", options: Options(
              headers: {HttpHeaders.authorizationHeader: "Bearer ${await _localStorageService.getToken()}"}),);
    final body = response.data;
    final categori = MyProfile.fromJson(body["data"]);
    return categori;
  }

//  Future<MyProfile> getMyProfile() async {
//     final response = await DioSingleton().dio.get(
//           'ecommerce/coupons/customer/available',
//           options: Options(
//               headers: {HttpHeaders.authorizationHeader: "Bearer $token"}),
//         );
//     final body = response.data;
//     final List<dynamic> jsonResponse = body['data'];
//     return jsonResponse.map((e) => MyProfile.fromJson(e)).toList();
//   }
}