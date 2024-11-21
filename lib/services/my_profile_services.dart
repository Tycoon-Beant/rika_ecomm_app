import 'dart:io';

import 'package:dio/dio.dart';
import 'package:rika_ecomm_app/model/my_profile_model.dart';
import 'package:rika_ecomm_app/services/dio_instance.dart';

class MyProfileServices {
   final String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NzNkY2RiOWIyOWJmNWFiMDY1ZWRlNTAiLCJlbWFpbCI6ImJlYW50LmthdXJAeWFob28uY29tIiwidXNlcm5hbWUiOiJiZWFudF9rYXVyIiwicm9sZSI6IkFETUlOIiwiaWF0IjoxNzMyMTAzNjMxLCJleHAiOjE3MzIxOTAwMzF9.jmzAw-uOGki19Ocmh6kYizst-kCLsmzJoIMVuhpM5v4";

Future<MyProfile> getMyProfile() async {
    final response = await DioSingleton().dio.get("ecommerce/profile", options: Options(
              headers: {HttpHeaders.authorizationHeader: "Bearer $token"}),);
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