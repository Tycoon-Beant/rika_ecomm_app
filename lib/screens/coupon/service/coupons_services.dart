import 'package:dio/dio.dart';
import 'package:rika_ecomm_app/screens/cart/model/user_cart_model.dart';
import 'package:rika_ecomm_app/screens/coupon/model/coupons_model.dart';
import 'package:rika_ecomm_app/services/dio_exceptions.dart';
import 'package:rika_ecomm_app/services/dio_instance.dart';

class CouponsServices {
  CouponsServices();

  Future<List<Coupon>> getCustomerCoupons({CancelToken? token}) async {
    final response = await DioSingleton().dio.get(
          'ecommerce/coupons/customer/available',
          cancelToken: token,
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
      );
      final body = response.data;
      return UserCart.fromJson(body["data"]);
    } on DioException catch (e) {
      print("Error adding coupon: $e");
      throw DioExceptions.fromDioError(e);
    }
  }

  Future<UserCart> removeCustomerCoupon({required String couponcode}) async {
    try {
      final response = await DioSingleton().dio.post(
        'ecommerce/coupons/c/remove',
        data: {"couponCode": couponcode},
      );
      final body = response.data;
      return UserCart.fromJson(body["data"]);
    } on DioException catch (e) {
      print("Error removing coupon : $e");
      throw DioExceptions.fromDioError(e);
    }
  }
}
