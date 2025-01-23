import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:rika_ecomm_app/model/result.dart';
import 'package:rika_ecomm_app/screens/coupon/model/coupons_model.dart';

import '../service/coupons_services.dart';

class CouponListCubit extends Cubit<Result<List<Coupon>>> {
  CancelToken? cancelToken;
  final CouponsServices _couponsServices;
  CouponListCubit(this._couponsServices) : super(Result(isLoading: true)) {
    cancelToken ??= CancelToken();
    getCoupons();
  }

  Future<void> getCoupons() async {
    try {
      emit(Result(isLoading: true));
      final couponDetail = await _couponsServices.getCustomerCoupons(token: cancelToken);
      emit(Result(data: couponDetail));
    } catch (e) {
      emit(Result(error: e.toString()));
    }
  }

  @override
  Future<void> close() {
    cancelToken?.cancel();
    return super.close();
  }
}
