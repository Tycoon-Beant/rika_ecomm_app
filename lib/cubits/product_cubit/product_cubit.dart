import 'package:bloc/bloc.dart';
import 'package:rika_ecomm_app/model/user_cart_model.dart';

import '../../../model/result.dart';
import '../../../services/category_services.dart';

class ProductCubit extends Cubit<Result<List<Product>>> {
  ProductCubit() : super(Result(isLoading: false)){
    getProductDetail();
  }

  Future<void> getProductDetail() async {
    try {
      emit(Result(isLoading: true));
      final productDetail = await CategoryServices().getProduct();
      emit(Result(data: productDetail));
    } catch (e) {
      emit(Result(error: e));
    }
  } 
}
