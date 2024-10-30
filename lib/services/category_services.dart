import 'package:dio/dio.dart';

class CategoryServices {
  final Dio _dio = Dio();

   CategoryServices() {
    _dio.options = BaseOptions(
      baseUrl: "https://fakestoreapi.com/",
      connectTimeout: Duration(minutes: 1),
      receiveTimeout: Duration(minutes: 1),
      sendTimeout: Duration(minutes: 1),
    );
  }

  Future<List<String>> getCategories() async {
    final response = await _dio.get("products/categories");
    final List<dynamic> categories = response.data;
    return categories.map((e) => e.toString()).toList();
  }
}