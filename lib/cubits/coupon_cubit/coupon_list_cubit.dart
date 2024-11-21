import 'package:bloc/bloc.dart';
import 'package:rika_ecomm_app/model/coupons_model.dart';
import 'package:rika_ecomm_app/model/result.dart';

import '../../services/coupons_services.dart';

class CouponListCubit extends Cubit<Result<List<Coupon>>> {
  CouponListCubit() : super(Result(isLoading: true)) {
    getCoupons();
  }

  Future<void> getCoupons() async {
    try {
      emit(Result(isLoading: true));
      final couponDetail = await CouponsServices().getCustomerCoupons();
      emit(Result(data: couponDetail));
    } catch (e) {
      emit(Result(error: e.toString()));
    }
  }
}
