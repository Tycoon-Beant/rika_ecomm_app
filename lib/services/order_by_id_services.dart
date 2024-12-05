import 'dart:io';

import 'package:dio/dio.dart';
import 'package:rika_ecomm_app/model/order_detail_model.dart';
import 'package:rika_ecomm_app/services/dio_exceptions.dart';
import 'package:rika_ecomm_app/services/dio_instance.dart';
import 'package:rika_ecomm_app/services/local_storage_service.dart';

class OrderByIdServices {
    final LocalStorageService _localStorageService;

  OrderByIdServices(this._localStorageService);

  Future<OderDetail> getOrderById({required String orderId}) async {
    try {
      final response = await DioSingleton().dio.get("ecommerce/orders/$orderId",
          options:
          Options(headers: {HttpHeaders.authorizationHeader: "Bearer ${await _localStorageService.getToken()}"}),
          );
      final body = response.data;
      return OderDetail.fromJson(body["data"]);
    } on DioException catch (e) {
      print("Error getting order Detail: $e");
      throw DioExceptions.fromDioError(e);
    }
  }
}