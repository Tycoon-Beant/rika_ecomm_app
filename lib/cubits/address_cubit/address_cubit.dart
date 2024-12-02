import 'package:bloc/bloc.dart';
import 'package:rika_ecomm_app/model/address_model.dart';
import 'package:rika_ecomm_app/model/result.dart';
import 'package:rika_ecomm_app/services/address_services.dart';
import 'package:rika_ecomm_app/services/local_storage_service.dart';

class AddressCubit extends Cubit<Result<AddressState>> {
  final AddressServices _addressServices;
  final LocalStorageService _localStorageService;
  final Map<String, dynamic> _formData = {};

  AddressCubit(this._addressServices, this._localStorageService)
      : super(Result(isLoading: false));

  Future<void> postAddressData() async {
    try {
      emit(Result(isLoading: true));
      final addressDetail = await _addressServices.postAddress(
        addressLine1: _formData["addressLine1"],
        addressLine2: _formData["addressLine2"],
        city: _formData["city"],
        state: _formData["state"],
        pincode: _formData["pincode"],
        country: _formData["country"],
      );
      emit(Result(data: AddressState(addresses: addressDetail, event: AddressEvent.add)));
    } catch (e) {
      emit(Result(error: e.toString()));
    }
  }

  void updateForm(String key, dynamic value) {
    _formData[key] = value;
  }

  Future<void> patchAddressData({required String addresdId}) async {
    try {
      emit(Result(isLoading: true));
      final addressDetailPatch = await _addressServices.patchAddressDetails(
        addressId: addresdId,
        addressLine1: _formData["addressLine1"],
        addressLine2: _formData["addressLine2"],
        city: _formData["city"],
        state: _formData["state"],
        pincode: _formData["pincode"],
        country: _formData["country"],
      );
      emit(Result(data: AddressState(addresses: addressDetailPatch, event: AddressEvent.update)));
    } catch (e) {
      emit(Result(error: e.toString()));
    }
  }

  Future<void> deleteAddress({required String addressId}) async {
    try {
      emit(Result(isLoading: true));
      final localAddress = _localStorageService.getAddressId();
      final address =
          await _addressServices.deleteAddress(addressId: addressId);
      if (localAddress == addressId) {
        _localStorageService.clearAddress();
      }
      emit(Result(data: AddressState(addresses: address, event:AddressEvent.delete)));
    } catch (e) {
      emit(Result(error: e.toString()));
    }
  }

}

class AddressState {
  final Addresses addresses;
  final AddressEvent event;
  AddressState({required this.event, required this.addresses});
}
enum AddressEvent {
  add, update , delete 
}