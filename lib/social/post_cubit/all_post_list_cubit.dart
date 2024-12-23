import 'package:bloc/bloc.dart';
import 'package:rika_ecomm_app/model/result.dart';
import 'package:rika_ecomm_app/social/home/model/all_post_model.dart';
import 'package:rika_ecomm_app/social/post_service/all_post_service.dart';

class AllPostListCubit extends Cubit<Result<List<PostModel>>> {
  final AllPostService _allPostService;
  AllPostListCubit(this._allPostService) : super(Result(isLoading: true)){
    getAllPosts();
  }

  Future<void> getAllPosts() async {
    try {
      emit(Result(isLoading: true));
      final allPost = await _allPostService.getPosts();
      emit(Result(data: allPost));
    } catch (e) {
      emit(Result(error: e.toString()));
    }
  }
  void updatePosts(List<PostModel> posts) {
    emit(Result(data: posts));
  }
}
