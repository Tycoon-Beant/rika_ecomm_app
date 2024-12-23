import 'dart:io';

import 'package:dio/dio.dart';
import 'package:rika_ecomm_app/services/dio_exceptions.dart';
import 'package:rika_ecomm_app/services/dio_instance.dart';
import 'package:rika_ecomm_app/services/local_storage_service.dart';
import 'package:rika_ecomm_app/social/home/model/all_post_model.dart';

class AddPostService {
  final LocalStorageService _localStorageService;
  AddPostService(this._localStorageService);

  Future<PostModel> addPost(
      String content, List<File> images, List<String> tags) async {
    Map<String, dynamic> data = {};
    data.addEntries(List.generate(
        tags.length, (index) => MapEntry("tags[$index]", tags[index])));

    final image = await Future.wait(
        images.map((e) => MultipartFile.fromFile(e.path)).toList());

    data["images"] = image;
    data["content"] = content;
    try {
      final response = await DioSingleton().dio.post("social-media/posts",
          options: Options(headers: {
            HttpHeaders.authorizationHeader:
                "Bearer ${await _localStorageService.getToken()}"
          }),
          data: FormData.fromMap(data));
      final body = response.data;
      return PostModel.fromJson(body["data"]);
    } on DioException catch (e) {
      print("Error while adding post : $e");
      throw DioExceptions.fromDioError(e);
    }
  }
   Future<PostModel> deletePost({required String postId}) async{
    try {
      final response = await DioSingleton().dio.delete("social-media/posts/$postId",
      options:
          Options(headers: {HttpHeaders.authorizationHeader: "Bearer ${await _localStorageService.getToken()}"}),);
      final body = response.data;
      return PostModel.fromJson(body["data"]);
    } on DioException catch (e) {
      print("Error deleting item to cart: $e");
      throw DioExceptions.fromDioError(e);
    }
  }
}
