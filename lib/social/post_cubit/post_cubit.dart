import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:rika_ecomm_app/model/result.dart';
import 'package:rika_ecomm_app/social/post_service/add_post_service.dart';
import 'package:rika_ecomm_app/social/home/model/all_post_model.dart';

class PostCubit extends Cubit<Result<PostsState>> {
  final AddPostService _addPostService;
  PostCubit(this._addPostService) : super(Result(isLoading: false));

  Future<void> addpostData(String content, List<File> images, List<String> tags) async {
    try {
      emit(Result(isLoading:  true));
      final postData = await _addPostService.addPost(content, images, tags);
      emit(Result(data: PostsState(event: PostEvent.add, post: postData)));
    } catch (e) {
      emit(Result(error: e.toString()));
    }
  }
  Future<void> deletePost({required String postId}) async{
    try {
      emit(Result(isLoading: true));
      final delete = await _addPostService.deletePost(postId: postId);
      emit(Result(data: PostsState(event: PostEvent.delete, post: delete)));
    } catch (e) {
      emit(Result(error: e.toString()));
    }
  }
}

class PostsState {
  final PostEvent event;
  final PostModel post;

  PostsState({required this.event, required this.post});
}

enum PostEvent { add, delete, update, clear }
