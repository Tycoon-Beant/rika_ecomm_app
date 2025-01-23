import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:rika_ecomm_app/screens/category_and_product/model/category_model.dart';


import '../../../../../model/result.dart';
import '../service/category_and_product_services.dart';


class CategoryListCubit extends Cubit<Result<CategoriModel>> {
  CancelToken? cancelToken;
  final CategoryAndProductServices _categoryServices;
  CategoryListCubit(this._categoryServices) : super(Result(isLoading: false)){
    cancelToken ??= CancelToken();
    getCategoryList();
  }

   Future<void> getCategoryList() async {
    try {
      emit(Result(isLoading: true));
      final categoriDetail = await _categoryServices.getCategories(token: cancelToken);
      emit(Result(data: categoriDetail));
    } catch (e) {
      emit(Result(error: e));
    } 
  }

  @override
  Future<void> close() {
    cancelToken?.cancel();
    return super.close();
  }
}
