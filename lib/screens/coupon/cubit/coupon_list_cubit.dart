import 'package:bloc/bloc.dart';
import 'package:rika_ecomm_app/model/result.dart';
import 'package:rika_ecomm_app/screens/coupon/model/coupons_model.dart';

import '../service/coupons_services.dart';

class CouponListCubit extends Cubit<Result<List<Coupon>>> {
  final CouponsServices _couponsServices;
  CouponListCubit(this._couponsServices) : super(Result(isLoading: true)) {
    getCoupons();
  }

  Future<void> getCoupons() async {
    try {
      emit(Result(isLoading: true));
      final couponDetail = await _couponsServices.getCustomerCoupons();
      emit(Result(data: couponDetail));
    } catch (e) {
      emit(Result(error: e.toString()));
    }
  }
}
