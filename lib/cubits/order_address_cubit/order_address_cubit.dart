import 'package:bloc/bloc.dart';
import 'package:rika_ecomm_app/model/address_model.dart';
import 'package:rika_ecomm_app/model/result.dart';
import 'package:rika_ecomm_app/services/order_address_services.dart';


class OrderAddressCubit extends Cubit<Result<Addresses?>> {
  final OrderAddressServices _orderAddressServices;
  OrderAddressCubit(this._orderAddressServices) : super(Result(isLoading: false));

  
  Future<void> getAddressId(String addressId) async {
    try {
      emit(Result(isLoading: true));
      final orderAddress =
          await _orderAddressServices.getAddressOrderScreen(addressId: addressId);
      emit(Result(data:orderAddress));
    } catch (e) {
      emit(Result(error: e.toString()));
    }
  }

  void updateOrderAddress(Addresses? address) {
    emit(Result(data: address));
  }
}
