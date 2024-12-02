import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:rika_ecomm_app/config/common.dart';
import 'package:rika_ecomm_app/cubits/address_cubit/address_list_cubit.dart';
import 'package:rika_ecomm_app/cubits/cart_bloc_cubit/cart_list_cubit.dart';
import 'package:rika_ecomm_app/cubits/order_address_cubit/order_address_cubit.dart';
import 'package:rika_ecomm_app/model/address_model.dart';
import 'package:rika_ecomm_app/model/result.dart';
import 'package:rika_ecomm_app/screens/address_screen.dart';
import 'package:rika_ecomm_app/screens/profilenextscreens/myorder.dart';
import 'package:rika_ecomm_app/screens/profilenextscreens/payment_method_screen.dart';
import 'package:rika_ecomm_app/services/address_services.dart';
import 'package:rika_ecomm_app/services/local_storage_service.dart';

class Orderdetails extends StatefulWidget {
  const Orderdetails({
    super.key,
  });

  @override
  State<Orderdetails> createState() => _OrderdetailsState();
}

class _OrderdetailsState extends State<Orderdetails> {
  Addresses? addresses;
  @override
  void initState() {
    super.initState();
    final addressId = context.read<LocalStorageService>().getAddressId();
    if (addressId != null) {
      context.read<OrderAddressCubit>().getAddressId(addressId);
    }
  }

  @override
  Widget build(BuildContext context) {
    final cartState = context.watch<CartListCubit>();
    final addressSelected = context.read<LocalStorageService>().getAddressId();
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Image.asset("assets/images/arrowback.png")),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Dilevery Address",
              style: context.theme.headlineSmall,
            ),
            const SizedBox(height: 20),
            AddressContainer(),
            const SizedBox(height: 20),
            Text("Product Items", style: context.theme.titleMedium),
            const SizedBox(height: 10),
            Builder(builder: (context) {
              final state = context.watch<CartListCubit>();
              final cart = state.state.data?.items ?? [];
              return SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: cart.length,
                  itemBuilder: (BuildContext context, int index) {
                    final cartdata = cart[index];
                    return Row(
                      children: [
                        const SizedBox(width: 8),
                        Container(
                          height: 100,
                          width: 280,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: const Color.fromARGB(
                                        255, 235, 233, 233),
                                    blurRadius: 2,
                                    spreadRadius: 3,
                                    offset: Offset(0, 2))
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                AspectRatio(
                                  aspectRatio: 1,
                                  child: Image.network(
                                    cartdata.product?.mainImage?.url ?? '',
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        cartdata.product?.name ?? "",
                                        style: context.theme.titleMedium
                                            ?.copyWith(
                                                fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        // '\$ ${(cartItem.product?.price ?? 0) * (cartItem.quantity ?? 0)}'
                                        '\$ ${cartdata.product?.price.toString()}',
                                        style: context.theme.titleMedium
                                            ?.copyWith(
                                                fontWeight: FontWeight.w900),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                      ],
                    );
                  },
                ),
              );
            }),
            const SizedBox(height: 20),
            Text("Payment Method", style: context.theme.titleMedium),
            const SizedBox(height: 10),
            PaymentMethodButton(),
             Expanded(child: SizedBox()),
            PlaceOderButton(cartState: cartState, addressSelected: addressSelected),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class AddressContainer extends StatelessWidget {
  const AddressContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderAddressCubit, Result<Addresses?>>(
      builder: (context, state) {
        if (state.isLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.error != null) {
          return Center(
            child: AddAddressButton(),
          );
        } else if (state.data != null) {
          return Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      offset: const Offset(2, 2),
                      blurRadius: 5,
                      spreadRadius: 2,
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("AddressLine 1 : ",
                              style: context.theme.titleMedium),
                          Text(state.data?.addressLine1 ?? "",
                              style: context.theme.titleSmall!
                                  .copyWith(color: Colors.grey)),
                        ],
                      ),
                      Row(
                        children: [
                          Text("AddressLine 2 : ",
                              style: context.theme.titleMedium),
                          Text(state.data?.addressLine2 ?? "",
                              style: context.theme.titleSmall!
                                  .copyWith(color: Colors.grey)),
                        ],
                      ),
                      Row(
                        children: [
                          Text("City : ",
                              style: context.theme.titleMedium),
                          Text(state.data?.city ?? "",
                              style: context.theme.titleSmall!
                                  .copyWith(color: Colors.grey)),
                        ],
                      ),
                      Row(
                        children: [
                          Text("State : ",
                              style: context.theme.titleMedium),
                          Text(state.data?.state ?? "",
                              style: context.theme.titleSmall!
                                  .copyWith(color: Colors.grey)),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Pin Code : ",
                              style: context.theme.titleMedium),
                          Text(state.data?.pincode ?? '',
                              style: context.theme.titleSmall!
                                  .copyWith(color: Colors.grey)),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Country : ",
                              style: context.theme.titleMedium),
                          Text(state.data?.country ?? '',
                              style: context.theme.titleSmall!
                                  .copyWith(color: Colors.grey)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ChangeAddressButton(),
            ],
          );
        } else {
          return Column(
            children: [
              SizedBox.shrink(),
              const SizedBox(height: 20),
              AddAddressButton()
            ],
          );
        }
      },
    );
  }
}

class PlaceOderButton extends StatelessWidget {
  const PlaceOderButton({
    super.key,
    required this.cartState,
    required this.addressSelected,
  });

  final CartListCubit cartState;
  final String? addressSelected;

  @override
  Widget build(BuildContext context) {
    final orderState = context.read<OrderAddressCubit>();
    return Row(
      children: [
        Column(
          children: [
            Text("Total Price",
                style: context.theme.titleSmall!
                    .copyWith(color: Colors.grey)),
            Text("\$ ${cartState.state.data?.cartTotal ?? 0}",
                style: context.theme.titleMedium)
          ],
        ),
        const SizedBox(width: 100),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32))),
            onPressed: orderState.state.data == null
                ? null
                : () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return OrderPlacedAlert();
                      },
                    );
                  },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Text("Place order",
                  style: context.theme.titleMedium!
                      .copyWith(color: Colors.white)),
            ))
      ],
    );
  }
}

class PaymentMethodButton extends StatelessWidget {
  const PaymentMethodButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const PaymentMethodScreen()));
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            border: Border.all(
                color: const Color.fromARGB(255, 203, 202, 202)),
            borderRadius: BorderRadius.circular(20)),
        child: Center(
            child: Text(
          "Add Payment Method",
          style: context.theme.titleMedium,
        )),
      ),
    );
  }
}

class ChangeAddressButton extends StatelessWidget {
  const ChangeAddressButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => AddressListCubit(
                  context.read<AddressServices>()),
              child: AddressScreen(
                address: context
                    .read<LocalStorageService>()
                    .getAddressId(),
              ),
            ),
          ),
        );
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            border: Border.all(
                color:
                    const Color.fromARGB(255, 203, 202, 202)),
            borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: Text(
            "Change Address",
            style: context.theme.titleMedium,
          ),
        ),
      ),
    );
  }
}

class AddAddressButton extends StatelessWidget {
  const AddAddressButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => BlocProvider(
                create: (context) => AddressListCubit(
                    context.read<AddressServices>()),
                child: AddressScreen(
                  address: context
                      .read<LocalStorageService>()
                      .getAddressId(),
                ),
              ),
            ),
          );
        },
        child: Container(
          height: 50,
          decoration: BoxDecoration(
              border: Border.all(
                  color:
                      const Color.fromARGB(255, 203, 202, 202)),
              borderRadius: BorderRadius.circular(20)),
          child: Center(
            child: Text(
              "Add Address",
              style: context.theme.titleMedium,
            ),
          ),
        ),
      );
  }
}

class OrderPlacedAlert extends StatelessWidget {
  const OrderPlacedAlert({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: Colors.white,
        content: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset("assets/images/catsuc.png"),
              Text(
                "Successfull",
                style: TextStyle(fontSize: 30, fontFamily: FontFamily.w700),
              ),
              Text(
                "Your Order have be Placed!!!!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                ),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Myorder()));
                },
                child: Text(
                  "Checkout",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: FontFamily.w700),
                ),
              ),
            ],
          ),
        ));
  }
}
