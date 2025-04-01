import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rika_ecomm_app/model/common_response.dart';
import 'package:rika_ecomm_app/screens/category_and_product/model/category_model.dart';

import '../../../../../model/result.dart';
import '../service/category_and_product_services.dart';

class CategoryListCubit extends Cubit<Result<PaginationResponse<Categories>>> {
  CancelToken? cancelToken;
  final CategoryAndProductServices _categoryServices;
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  CategoryListCubit(this._categoryServices) : super(Result(isLoading: false)) {
    cancelToken ??= CancelToken();
    getCategoryList();
  }

  Future<void> getCategoryList() async {
    try {
      emit(Result(isLoading: true));
      final categoriDetail =
          await _categoryServices.getCategories(token: cancelToken);
      emit(Result(data: categoriDetail));
    } catch (e) {
      emit(Result(error: e));
    }
  }

  Future<void> loadMore() async {
    try {
      final PaginationResponse<Categories>? prevState =
          state.data;
      if (prevState != null && prevState.hasNextPage) {
        final page = prevState.page + 1;
        final categorieDetail = await _categoryServices.getCategories(
            token: cancelToken, page: page);
        final list = [...prevState.data, ...categorieDetail.data];
        refreshController.loadComplete();
        final nextState = categorieDetail.copyWith(data: list);
        emit(Result(data: nextState));
      } else {
        refreshController.loadNoData();
      }
    } catch (e) {
      refreshController.loadFailed();
    }
  }

  @override
  Future<void> close() {
    cancelToken?.cancel();
    return super.close();
  }
}
