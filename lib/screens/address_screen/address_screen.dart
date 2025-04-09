import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rika_ecomm_app/config/common.dart';
import 'package:rika_ecomm_app/di/service_locator.dart';
import 'package:rika_ecomm_app/model/result.dart';
import 'package:rika_ecomm_app/screens/address_screen/cubit/address_cubit.dart';
import 'package:rika_ecomm_app/screens/address_screen/cubit/address_list_cubit.dart';
import 'package:rika_ecomm_app/screens/address_screen/model/address_model.dart';
import 'package:rika_ecomm_app/screens/order_screens/cubit/order_address_cubit/get_order_address_cubit.dart';
import 'package:rika_ecomm_app/services/local_storage_service.dart';

import '../../routes/routes.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  String? selectedAddress;

  @override
  void initState() {
    super.initState();
    final address = getIt<LocalStorageService>().getAddressId();
    selectedAddress = address;
  }

  @override
  void dispose() {
    super.dispose();
    getIt.resetLazySingleton<AddressCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: Image.asset("assets/images/arrowback.png"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Shipping Addresses",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(NavRoutes.upsertAddress.path);
              },
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Icon(
                      Icons.add,
                      color: Colors.grey,
                      size: 40,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            MultiBlocListener(
              listeners: [
                BlocListener<AddressCubit, Result<AddressState>>(
                  listener: (context, state) {
                    if (state.data?.addresses != null) {
                      context.read<AddressListCubit>().getAddressList();
                    }
                    if (state.error != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.error.toString()),
                        ),
                      );
                    }
                    if (state.data?.event == AddressEvent.delete) {
                      final defaultAddress = getIt<LocalStorageService>().getAddressId();
                      if (defaultAddress == null) {
                        context.read<GetOrderAddressCubit>().updateOrderAddress(null);
                      }
                    }
                    if (state.data?.event == AddressEvent.update) {
                      final defaultAddress = getIt<LocalStorageService>().getAddressId();
                      if (state.data?.addresses.id == defaultAddress) {
                        context
                            .read<GetOrderAddressCubit>()
                            .updateOrderAddress(state.data?.addresses);
                      }
                    }
                  },
                ),
              ],
              child: Expanded(
                child: BlocBuilder<AddressListCubit, Result<List<Addresses>>>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state.error != null) {
                      return Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "An error occurred: //${state.error}",
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            const SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () => context.read<AddressListCubit>().getAddressList(),
                              child: Text("Retry"),
                            ),
                          ],
                        ),
                      );
                    } else {
                      var address = state.data ?? [];
                      if (address.isEmpty) {
                        return Center(
                          child: Text("No Address Available. Please Add Address!"),
                        );
                      }
                      return SizedBox(
                        child: ListView.builder(
                          itemCount: address.length,
                          itemBuilder: (BuildContext context, int index) {
                            final addressData = address[index];
                            return AddressItem(
                              addressData: addressData,
                              isSelected: selectedAddress == addressData.id,
                              onSelect: (id) {
                                setState(() => selectedAddress = id);
                              },
                              isDefault:
                                  addressData.id == getIt<LocalStorageService>().getAddressId(),
                            );
                          },
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey.shade200,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            fixedSize: Size(MediaQuery.sizeOf(context).width, 50),
          ),
          onPressed: selectedAddress == null
              ? null
              : () {
                  getIt<LocalStorageService>().setAddressId(selectedAddress!);
                  context.read<GetOrderAddressCubit>().getAddressId(selectedAddress!);
                  Navigator.of(context).pop();
                },
          child: Text(
            'Add Address To Default',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class AddressItem extends StatelessWidget {
  const AddressItem(
      {super.key,
      required this.addressData,
      required this.isSelected,
      required this.onSelect,
      required this.isDefault});

  final Addresses addressData;
  final bool isSelected;
  final bool isDefault;
  final Function(String?) onSelect;

  @override
  Widget build(BuildContext context) {
    // var selectedAddress = addressData.id;
    return Column(
      children: [
        const SizedBox(height: 10),
        InkWell(
          onTap: () {
            onSelect(addressData.id); // Update selection
            // context
            //     .read<AddressCubit>()
            //     .getAddressOrder(addressId: addressData.id!);
            // Navigator.of(context).pop();
          },
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              color: isDefault ? Colors.grey.withOpacity(0.2) : Colors.white,
              border: Border.all(color: isDefault ? Colors.black : Colors.grey),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BuildRow(label: "Address Line 1", value: addressData.addressLine1),
                  BuildRow(label: "Address Line 2", value: addressData.addressLine2),
                  BuildRow(label: "City", value: addressData.city),
                  BuildRow(label: "State", value: addressData.state),
                  BuildRow(label: "Pin Code", value: addressData.pincode),
                  BuildRow(label: "Country", value: addressData.country),
                  if (isSelected)
                    EditAndDeleteAddress(
                      address: addressData,
                    )
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

class EditAndDeleteAddress extends StatelessWidget {
  final Addresses address;
  const EditAndDeleteAddress({
    super.key,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), side: BorderSide(color: Colors.black))),
          onPressed: () {
            Navigator.of(context).pushNamed(NavRoutes.upsertAddress.path, arguments: address);
          },
          child: Text(
            "Edit",
            style: context.theme.titleMedium!.copyWith(color: context.colorScheme.onPrimary),
          ),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), side: BorderSide(color: Colors.black))),
          onPressed: () {
            context.read<AddressCubit>().deleteAddress(addressId: address.id!);
          },
          child: Text(
            "Delete",
            style: context.theme.titleMedium!.copyWith(color: context.colorScheme.onPrimary),
          ),
        ),
      ],
    );
  }
}

class BuildRow extends StatelessWidget {
  const BuildRow({
    super.key,
    required this.label,
    required this.value,
  });

  final String label;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "$label: ",
          style: Theme.of(context).textTheme.titleMedium!,
        ),
        Expanded(
          child: Text(
            value ?? "",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.grey),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
