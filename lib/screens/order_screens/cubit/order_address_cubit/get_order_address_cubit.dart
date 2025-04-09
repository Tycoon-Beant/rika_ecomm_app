import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:rika_ecomm_app/model/result.dart';

import 'package:rika_ecomm_app/screens/address_screen/model/address_model.dart';
import 'package:rika_ecomm_app/screens/order_screens/service/get_order_addressId_services.dart';

class GetOrderAddressCubit extends Cubit<Result<Addresses?>> {
  CancelToken? cancelToken;
  final GetOrderAddressIdService _orderAddressServices;
  GetOrderAddressCubit(this._orderAddressServices)
      : super(Result(isLoading: false)) {
    cancelToken ??= CancelToken();
  }

  Future<void> getAddressId(String? addressId) async {
    if (addressId == null) {
      return;
    }
    try {
      emit(Result(isLoading: true));
      final orderAddress = await _orderAddressServices.getAddressOrderScreen(
          addressId: addressId, token: cancelToken);
      emit(Result(data: orderAddress));
    } catch (e) {
      emit(Result(error: e.toString()));
    }
  }

  void updateOrderAddress(Addresses? address) {
    emit(Result(data: address));
  }

  @override
  Future<void> close() {
    cancelToken?.cancel();
    return super.close();
  }
}
