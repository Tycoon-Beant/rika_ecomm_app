import 'dart:io';

import 'package:dio/dio.dart';
import 'package:rika_ecomm_app/services/dio_instance.dart';
import 'package:rika_ecomm_app/services/local_storage_service.dart';
import 'package:rika_ecomm_app/social/home/model/all_post_model.dart';

class AllPostService {
    final LocalStorageService _localStorageService;


  AllPostService(this._localStorageService);

  Future<List<PostModel>> getPosts() async {
    final response = await DioSingleton().dio.get("social-media/posts",options:
          Options(headers: {HttpHeaders.authorizationHeader: "Bearer ${await _localStorageService.getToken()}"}),
    );
    final body = response.data;
    final List<dynamic> jsonResponse = body["data"]["posts"]; 
    return jsonResponse.map((e) =>PostModel.fromJson(e) ).toList();
  }
}