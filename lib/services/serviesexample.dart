import 'package:dio/dio.dart';
import 'package:rika_ecomm_app/model/categories_model/category_model.dart';

class Services{
Dio _dio = Dio();

  Services(){
    _dio.options = BaseOptions(
      baseUrl: "https://api.freeapi.app/api/v1/ecommerce/",
      sendTimeout: Duration(minutes: 1),
      receiveTimeout: Duration(minutes: 1),
      connectTimeout: Duration(minutes: 1),
    );
  }

  Future<Categories> getcat() async {
    final response = await _dio.get("categories");
    final body = response.data;
    final cat = Categories.fromJson(body);
    return cat;

  }
}