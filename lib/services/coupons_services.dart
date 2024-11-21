import 'dart:io';

import 'package:dio/dio.dart';
import 'package:rika_ecomm_app/model/coupons_model.dart';
import 'package:rika_ecomm_app/model/user_cart_model.dart';
import 'package:rika_ecomm_app/services/dio_exceptions.dart';
import 'package:rika_ecomm_app/services/dio_instance.dart';

class CouponsServices {
  final String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NzNkY2RiOWIyOWJmNWFiMDY1ZWRlNTAiLCJlbWFpbCI6ImJlYW50LmthdXJAeWFob28uY29tIiwidXNlcm5hbWUiOiJiZWFudF9rYXVyIiwicm9sZSI6IkFETUlOIiwiaWF0IjoxNzMyMTAzNjMxLCJleHAiOjE3MzIxOTAwMzF9.jmzAw-uOGki19Ocmh6kYizst-kCLsmzJoIMVuhpM5v4";

  CouponsServices();

  Future<List<Coupon>> getCustomerCoupons() async {
    final response = await DioSingleton().dio.get(
          'ecommerce/coupons/customer/available',
          options: Options(
              headers: {HttpHeaders.authorizationHeader: "Bearer $token"}),
        );
    final body = response.data;
    final List<dynamic> jsonResponse = body['data']['coupons'];
    return jsonResponse.map((e) => Coupon.fromJson(e)).toList();
  }

  Future<UserCart> postCustomerCoupon({required String couponcode}) async {
    try {
      final response = await DioSingleton().dio.post(
            'ecommerce/coupons/c/apply',
            data: {"couponCode": couponcode},
            options: Options(
                headers: {HttpHeaders.authorizationHeader: "Bearer $token"}),
          );
      final body = response.data;
      return UserCart.fromJson(body["data"]);
    } on DioException catch (e) {
      print("Error adding coupon: $e");
      throw DioExceptions.fromDioError(e);
    }
  }

  Future<UserCart> removeCustomerCoupon({required  String couponcode}) async{
    try {
      final response = await DioSingleton().dio.post('ecommerce/coupons/c/remove',
      data: {"couponCode" : couponcode},
      options: Options(
        headers: {HttpHeaders.authorizationHeader : "Bearer $token"}
      ),
      );
      final body = response.data;
      return UserCart.fromJson(body["data"]);
    } on DioException catch (e) {
      print("Error removing coupon : $e");
      throw DioExceptions.fromDioError(e);
    }
  }
}
