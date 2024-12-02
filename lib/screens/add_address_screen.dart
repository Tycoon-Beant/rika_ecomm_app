import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rika_ecomm_app/config/common.dart';
import 'package:rika_ecomm_app/cubits/address_cubit/address_cubit.dart';
import 'package:rika_ecomm_app/model/address_model.dart';
import 'package:rika_ecomm_app/model/result.dart';

class AddAddressScreen extends StatefulWidget {
  final Addresses? address;
  const AddAddressScreen({super.key, this.address});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  final addressKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Image.asset("assets/images/arrowback.png")),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: addressKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Address Details',
                    style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: 20),
                BlocConsumer<AddressCubit, Result<AddressState>>(
                  listener: (context, state) {
                    if (state.data != null) {
                      // Navigator.of(context).pop(MaterialPageRoute(builder: (context) => BlocProvider(create: (context) => AddressCubit(context.read<AddressServices>()),
                      // child: AddressScreen(),),),);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Address added Successfully!!!!!"),
                        ),
                      );
                    }

                    if (state.error != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.error.toString()),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    return Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromARGB(255, 188, 186, 186)),
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Address Line 1: ",
                                style: Theme.of(context).textTheme.titleMedium),
                            TextFormField(
                              initialValue: widget.address?.addressLine1,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter address';
                                }
                                return null;
                              },
                              onSaved: (value) => context
                                  .read<AddressCubit>()
                                  .updateForm("addressLine1", value),
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                hintText: "Enter address",
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                        color: Colors.grey,
                                        fontFamily: FontFamily.w400),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text("Address Line 2: ",
                                style: Theme.of(context).textTheme.titleMedium),
                            TextFormField(
                              initialValue: widget.address?.addressLine2,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter address';
                                }
                                return null;
                              },
                              onSaved: (value) => context
                                  .read<AddressCubit>()
                                  .updateForm("addressLine2", value),
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                hintText: "Enter address",
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                        color: Colors.grey,
                                        fontFamily: FontFamily.w400),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text("City : ",
                                style: Theme.of(context).textTheme.titleMedium),
                            TextFormField(
                              initialValue: widget.address?.city,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter city';
                                }
                                return null;
                              },
                              onSaved: (value) => context
                                  .read<AddressCubit>()
                                  .updateForm("city", value),
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                hintText: "Enter city",
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                        color: Colors.grey,
                                        fontFamily: FontFamily.w400),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text("State: ",
                                style: Theme.of(context).textTheme.titleMedium),
                            TextFormField(
                              initialValue: widget.address?.state,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter state';
                                }
                                return null;
                              },
                              onSaved: (value) => context
                                  .read<AddressCubit>()
                                  .updateForm("state", value),
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                hintText: "Enter state",
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                        color: Colors.grey,
                                        fontFamily: FontFamily.w400),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text("Pin Code: ",
                                style: Theme.of(context).textTheme.titleMedium),
                            TextFormField(
                              initialValue: widget.address?.pincode,
                              keyboardType: TextInputType.numberWithOptions(),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter Pincode';
                                }
                                return null;
                              },
                              onSaved: (value) => context
                                  .read<AddressCubit>()
                                  .updateForm("pincode", value),
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                hintText: "Enter pincode",
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                        color: Colors.grey,
                                        fontFamily: FontFamily.w400),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text("Country: ",
                                style: Theme.of(context).textTheme.titleMedium),
                            TextFormField(
                              initialValue: widget.address?.country,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter country';
                                }
                                return null;
                              },
                              onFieldSubmitted: (value) {
                                if (addressKey.currentState!.validate()) {
                                  addressKey.currentState!.save();
                                  
                                  if (widget.address != null) {
                                    context
                                        .read<AddressCubit>()
                                        .patchAddressData(
                                            addresdId: widget.address!.id!);
                                    Navigator.of(context).pop();
                                  } else {
                                    context
                                        .read<AddressCubit>()
                                        .postAddressData();
                                    Navigator.pop(context);
                                  }
                                }
                              },
                              onSaved: (value) => context
                                  .read<AddressCubit>()
                                  .updateForm("country", value),
                              textInputAction: TextInputAction.done,
                              decoration: InputDecoration(
                                hintText: "Enter country",
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                        color: Colors.grey,
                                        fontFamily: FontFamily.w400),
                              ),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    fixedSize: Size(MediaQuery.sizeOf(context).width, 50),
                  ),
                  onPressed: () {
                    if (addressKey.currentState!.validate()) {
                      addressKey.currentState!.save();
                      if (widget.address != null) {
                        context
                            .read<AddressCubit>()
                            .patchAddressData(addresdId: widget.address!.id!);
                        Navigator.of(context).pop();
                      } else {
                        context.read<AddressCubit>().postAddressData();
                        Navigator.pop(context);
                      }
                    }
                  },
                  child: context.watch<AddressCubit>().state.isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : Text("Add Address",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(color: Colors.white)),
                ),
                // ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
