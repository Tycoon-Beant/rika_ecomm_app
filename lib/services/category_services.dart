import 'package:rika_ecomm_app/model/categories_model/category_model.dart';

import 'package:rika_ecomm_app/model/user_cart_model.dart';
import 'package:rika_ecomm_app/services/dio_instance.dart';

class CategoryServices {

   CategoryServices() {
  }

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



}