import 'dart:io';

import 'package:dio/dio.dart';
import 'package:rika_ecomm_app/model/categories_model/category_model.dart';
import 'package:rika_ecomm_app/model/user_cart_model.dart';
import 'package:rika_ecomm_app/services/dio_exceptions.dart';
import 'package:rika_ecomm_app/services/dio_instance.dart';
import 'package:rika_ecomm_app/services/local_storage_service.dart';

class CategoryServices {
final LocalStorageService _localStorageService;
   CategoryServices(this._localStorageService);

  Future<CategoriModel> getCategories() async {
    final response = await DioSingleton().dio.get("ecommerce/categories");
    final body = response.data;
    final categori = CategoriModel.fromJson(body);
    return categori;
  }

  Future<List<Product>> getProduct() async {
    final response = await DioSingleton().dio.get("ecommerce/products");
    final  body = response.data;
    final List<dynamic> jsonResponse = body["data"]["products"]; //response["data"]
    return jsonResponse.map((e) =>Product.fromJson(e) ).toList();//body["data"]

  }

  Future<List<Product>> getProductByCategory({required String categoryId}) async{
     try {
      final response = await DioSingleton().dio.get("ecommerce/products/category/$categoryId",
          options:
          Options(headers: {HttpHeaders.authorizationHeader: "Bearer ${await _localStorageService.getToken()}"}),
          );
      final body = response.data;
      final List<dynamic>jsonResponse = body["data"]["products"]; 
      return jsonResponse.map((e) => Product.fromJson(e)).toList();
    } on DioException catch (e) {
      print("Error getting products by category : $e");
      throw DioExceptions.fromDioError(e);
    }
  }
  }


