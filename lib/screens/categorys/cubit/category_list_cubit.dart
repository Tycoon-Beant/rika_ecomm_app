import 'package:bloc/bloc.dart';
import 'package:rika_ecomm_app/screens/categorys/model/category_model.dart';


import '../../../../../model/result.dart';
import '../service/category_services.dart';


class CategoryListCubit extends Cubit<Result<CategoriModel>> {
  final CategoryServices _categoryServices;
  CategoryListCubit(this._categoryServices) : super(Result(isLoading: false)){
    getCategoryList();
  }

   Future<void> getCategoryList() async {
    try {
      emit(Result(isLoading: true));
      final categoriDetail = await _categoryServices.getCategories();
      emit(Result(data: categoriDetail));
    } catch (e) {
      emit(Result(error: e));
    } 
  }
}
