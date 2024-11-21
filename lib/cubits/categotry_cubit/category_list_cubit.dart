import 'package:bloc/bloc.dart';
import 'package:rika_ecomm_app/model/categories_model/category_model.dart';

import '../../../model/result.dart';
import '../../../services/category_services.dart';


class CategoryListCubit extends Cubit<Result<CategoriModel>> {
  CategoryListCubit() : super(Result(isLoading: false)){
    getCategoryList();
  }

   Future<void> getCategoryList() async {
    try {
      emit(Result(isLoading: true));
      final categoriDetail = await CategoryServices().getCategories();
      emit(Result(data: categoriDetail));
    } catch (e) {
      emit(Result(error: e));
    } 
  }
}
