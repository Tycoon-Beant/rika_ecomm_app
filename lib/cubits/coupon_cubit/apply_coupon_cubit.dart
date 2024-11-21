import 'package:bloc/bloc.dart';
import 'package:rika_ecomm_app/model/result.dart';

import '../../model/user_cart_model.dart';
import '../../services/coupons_services.dart';

class ApplyCouponCubit extends Cubit<Result<UserCart>> {
  ApplyCouponCubit() : super(Result(isLoading: false));

  Future<void> postCoupon({required String couponcode}) async {
    try {
      emit(Result(isLoading: true));
      final couponResponse = await CouponsServices().postCustomerCoupon(couponcode: couponcode);
      emit(Result(data: couponResponse));
    } catch (e) {
      emit(Result(error: e.toString()));
    }
  }

  Future<void> removeCoupon({required String couponcode}) async{
    try {
      emit(Result(isLoading: true));
      final removeResponse = await CouponsServices().removeCustomerCoupon(couponcode: couponcode);
      emit(Result(data: removeResponse));
    } catch (e) {
      emit(Result(error: e.toString()));
    }
  }
}
