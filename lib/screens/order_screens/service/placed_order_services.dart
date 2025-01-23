import 'dart:core';
import 'package:dio/dio.dart';
import 'package:rika_ecomm_app/screens/order_screens/model/orders_model.dart';
import 'package:rika_ecomm_app/services/dio_exceptions.dart';
import 'package:rika_ecomm_app/services/dio_instance.dart';

class PlacedOrderServices {
  PlacedOrderServices();

  Future<Order> postPlaceOrder({required String addressId}) async {
    try {
      final response = await DioSingleton()
          .dio
          .post('ecommerce/orders/order', data: {"addressId": addressId});
      final body = response.data;
      return Order.fromJson(body["data"]);
    } on DioException catch (e) {
      print("Error adding order: $e");
      throw DioExceptions.fromDioError(e);
    }
  }

  Future<Order> getPlacedOrder({CancelToken? token}) async {
    final response = await DioSingleton().dio.get(
          "ecommerce/profile/orders",
          cancelToken: token,
        );
    final body = response.data;
    return Order.fromJson(body["data"]);
  }
}
