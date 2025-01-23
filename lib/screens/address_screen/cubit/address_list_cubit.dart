import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:rika_ecomm_app/model/result.dart';
import 'package:rika_ecomm_app/screens/address_screen/model/address_model.dart';
import 'package:rika_ecomm_app/screens/address_screen/services/address_services.dart';

class AddressListCubit extends Cubit<Result<List<Addresses>>> {
  final AddressServices _addressServices;
  CancelToken? cancelToken;

  AddressListCubit(this._addressServices) : super(Result(isLoading: true)){
    cancelToken ??= CancelToken();
    getAddressList();
  }

  Future<void> getAddressList() async{
    try {
      emit(Result(isLoading: true));
      final addresslist = await _addressServices.getaddresses(token: cancelToken);
      emit(Result(data: addresslist));
    } catch (e) {
      emit(Result(error: e.toString()));
    }
  }
  void updateAddress(List<Addresses> address) {
    emit(Result(data: address));
  }

  @override
  Future<void> close() {
    cancelToken?.cancel();
    return super.close();
  }
}
