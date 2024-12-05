import 'dart:core';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:rika_ecomm_app/model/orders_model.dart';
import 'package:rika_ecomm_app/services/dio_exceptions.dart';
import 'package:rika_ecomm_app/services/dio_instance.dart';
import 'package:rika_ecomm_app/services/local_storage_service.dart';

class PlacedOrderServices {
  final LocalStorageService _localStorageService;
  PlacedOrderServices(this._localStorageService);

  Future<Order> postPlaceOrder({required String addressId}) async {
    try {
      final response = await DioSingleton().dio.post('ecommerce/orders/order',
          options: Options(headers: {
            HttpHeaders.authorizationHeader:
                "Bearer ${await _localStorageService.getToken()}"
          }),
          data: {"addressId": addressId});
      final body = response.data;
      return Order.fromJson(body["data"]);
    } on DioException catch (e) {
      print("Error adding order: $e");
      throw DioExceptions.fromDioError(e);
    }
  }

  Future<Order> getPlacedOrder() async {
    final response = await DioSingleton().dio.get("ecommerce/profile/orders",
        options: Options(headers: {
          HttpHeaders.authorizationHeader:
              "Bearer ${await _localStorageService.getToken()}"
        }));
    final body = response.data;
    return Order.fromJson(body["data"]);    
  }

  
}
