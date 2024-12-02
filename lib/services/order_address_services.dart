import 'dart:io';

import 'package:dio/dio.dart';
import 'package:rika_ecomm_app/model/address_model.dart';
import 'package:rika_ecomm_app/services/dio_exceptions.dart';
import 'package:rika_ecomm_app/services/dio_instance.dart';
import 'package:rika_ecomm_app/services/local_storage_service.dart';

class OrderAddressServices {
    final LocalStorageService _localStorageService;

  OrderAddressServices(this._localStorageService);

  Future<Addresses> getAddressOrderScreen({required String addressId}) async {
    try {
      final response = await DioSingleton().dio.get(
            'ecommerce/addresses/$addressId',
            options: Options(headers: {
              HttpHeaders.authorizationHeader:
                  "Bearer ${await _localStorageService.getToken()}"
            }),
          );
      final body = response.data;
      return Addresses.fromJson(body["data"]);
    } on DioException catch (e) {
      print("Error getting address to order screen: $e");
      throw DioExceptions.fromDioError(e);
    }
  }
}