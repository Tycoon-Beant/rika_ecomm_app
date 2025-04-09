import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:rika_ecomm_app/config/common.dart';
import 'package:rika_ecomm_app/di/service_locator.dart';
import 'package:rika_ecomm_app/screens/address_screen/model/address_model.dart';
import 'package:rika_ecomm_app/screens/cart/cubit/cart_cubit.dart';
import 'package:rika_ecomm_app/screens/cart/cubit/cart_list_cubit.dart';
import 'package:rika_ecomm_app/screens/order_screens/cubit/order_address_cubit/get_order_address_cubit.dart';
import 'package:rika_ecomm_app/screens/order_screens/cubit/placed_order_cubit/post_placed_order_cubit.dart';
import 'package:rika_ecomm_app/screens/order_screens/model/orders_model.dart';
import 'package:rika_ecomm_app/model/result.dart';
import 'package:rika_ecomm_app/screens/address_screen/address_screen.dart';
import 'package:rika_ecomm_app/screens/order_screens/myorder.dart';
import 'package:rika_ecomm_app/screens/profile_next_screens/payment_method_screen.dart';
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
  Widget build(BuildContext context) {
    final cartState = context.watch<CartListCubit>();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            final addressId = getIt<LocalStorageService>().getAddressId();
            return getIt<GetOrderAddressCubit>()..getAddressId(addressId);
          },
        ),
        BlocProvider(
          create: (context) => getIt<PostPlacedOrderCubit>(),
        ),
      ],
      child: Builder(builder: (context) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            leading: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Image.asset("assets/images/arrowback.png")),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Dilevery Address",
                    style: context.theme.headlineSmall,
                  ),
                  const SizedBox(height: 16),
                  AddressContainer(),
                  const SizedBox(height: 16),
                  Text("Product Items", style: context.theme.titleMedium),
                  const SizedBox(height: 10),
                  Builder(builder: (context) {
                    final state = context.watch<CartListCubit>();
                    final cart = state.state.data?.items ?? [];
                    return SizedBox(
                      height: 80,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: cart.length,
                        itemBuilder: (BuildContext context, int index) {
                          final cartdata = cart[index];
                          return Row(
                            children: [
                              const SizedBox(width: 8),
                              Container(
                                width: 300,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: context.colorScheme.onSecondary),
                                  borderRadius: BorderRadius.circular(20),
                                  color: context.colorScheme.onTertiary,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      AspectRatio(
                                        aspectRatio: 1,
                                        child: Image.network(
                                          cartdata.product?.mainImage?.url ??
                                              '',
                                        ),
                                      ),
                                      const SizedBox(width: 16),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            cartdata.product?.name ?? "",
                                            style: context.theme.titleMedium
                                                ?.copyWith(
                                                    fontWeight:
                                                        FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            // '\//$ ${(cartItem.product?.price ?? 0) * (cartItem.quantity ?? 0)}'
                                            '\$${cartdata.product?.price.toString()}',
                                            style: context.theme.titleMedium
                                                ?.copyWith(
                                                    fontWeight:
                                                        FontWeight.w900),
                                          ),
                                        ],
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
                  Container(),
                  SizedBox(
                    height: 20,
                  ),
                  if (cartState.state.data?.items != null)
                    PlaceOderButton(
                      cartState: cartState,
                    ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

class AddressContainer extends StatelessWidget {
  const AddressContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<GetOrderAddressCubit, Result<Addresses?>>(
      listener: (context, state) {
        if (state.data != null) {}
      },
      child: BlocBuilder<GetOrderAddressCubit, Result<Addresses?>>(
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
                    color: context.colorScheme.onTertiary,
                    border: Border.all(color: context.colorScheme.onSecondary),
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
                                style: context.theme.titleSmall!.copyWith(
                                    color: context.colorScheme.secondary)),
                          ],
                        ),
                        Row(
                          children: [
                            Text("AddressLine 2 : ",
                                style: context.theme.titleMedium),
                            Text(state.data?.addressLine2 ?? "",
                                style: context.theme.titleSmall!.copyWith(
                                    color: context.colorScheme.secondary)),
                          ],
                        ),
                        Row(
                          children: [
                            Text("City : ", style: context.theme.titleMedium),
                            Text(state.data?.city ?? "",
                                style: context.theme.titleSmall!.copyWith(
                                    color: context.colorScheme.secondary)),
                          ],
                        ),
                        Row(
                          children: [
                            Text("State : ", style: context.theme.titleMedium),
                            Text(state.data?.state ?? "",
                                style: context.theme.titleSmall!.copyWith(
                                    color: context.colorScheme.secondary)),
                          ],
                        ),
                        Row(
                          children: [
                            Text("Pin Code : ",
                                style: context.theme.titleMedium),
                            Text(state.data?.pincode ?? '',
                                style: context.theme.titleSmall!.copyWith(
                                    color: context.colorScheme.secondary)),
                          ],
                        ),
                        Row(
                          children: [
                            Text("Country : ",
                                style: context.theme.titleMedium),
                            Text(state.data?.country ?? '',
                                style: context.theme.titleSmall!.copyWith(
                                    color: context.colorScheme.secondary)),
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
      ),
    );
  }
}

class PlaceOderButton extends StatefulWidget {
  const PlaceOderButton({
    super.key,
    required this.cartState,
  });

  final CartListCubit cartState;

  @override
  State<PlaceOderButton> createState() => _PlaceOderButtonState();
}

class _PlaceOderButtonState extends State<PlaceOderButton> {
  @override
  Widget build(BuildContext context) {
    final orderState = context.watch<GetOrderAddressCubit>();
    final addressSelected =
        orderState.state.data?.id; // Extract the address ID here.

    final cartState = widget.cartState.state.data?.items;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text("Total Price",
                style: context.theme.titleSmall!.copyWith(color: Colors.grey)),
            Text(
                "\$ ${widget.cartState.state.data?.coupon != null ? widget.cartState.state.data?.discountedTotal : widget.cartState.state.data?.cartTotal} ",
                style: context.theme.titleMedium)
          ],
        ),
        BlocListener<PostPlacedOrderCubit, Result<Order>>(
          listener: (context, state) {
            if (state.data != null) {
              context.read<CartCubit>().clearCartTotally();

              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return OrderPlacedAlert();
                },
              );
            } else if (state.error != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.error.toString())));
            }
          },
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: context.colorScheme.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
              ),
              onPressed: (cartState == null ||
                      cartState.isEmpty ||
                      addressSelected == null)
                  ? null
                  : () {
                      print(
                          "Placing Order with Address: $addressSelected and Cart: ${cartState.length}");
                      context
                          .read<PostPlacedOrderCubit>()
                          .postplaceOderCubit(addressId: addressSelected);
                    },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Text("Place order",
                    style: context.theme.titleMedium!
                        .copyWith(color: context.colorScheme.onPrimary)),
              )),
        )
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
            border: Border.all(color: const Color.fromARGB(255, 203, 202, 202)),
            borderRadius: BorderRadius.circular(20),
            color: context.colorScheme.onTertiary),
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
        PersistentNavBarNavigator.pushNewScreenWithRouteSettings(context,
            screen: AddressScreen(), settings: RouteSettings(name: "/address"));
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            border: Border.all(color: const Color.fromARGB(255, 203, 202, 202)),
            borderRadius: BorderRadius.circular(20),
            color: context.colorScheme.onTertiary),
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
            builder: (context) => AddressScreen(),
          ),
        );
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: context.colorScheme.onTertiary,
            border: Border.all(color: const Color.fromARGB(255, 203, 202, 202)),
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
        contentPadding: EdgeInsets.all(0),
        backgroundColor: context.colorScheme.onTertiary,
        shadowColor: context.colorScheme.secondary,
        elevation: 5,
        content: Container(
          decoration: BoxDecoration(
              border: Border.all(color: context.colorScheme.onTertiary),
              borderRadius: BorderRadius.circular(30)),
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: context.colorScheme.onTertiary),
                        borderRadius: BorderRadius.circular(30)),
                    child: Image.asset("assets/images/catsuc.png")),
                Text(
                  "Successfull",
                  style: TextStyle(fontSize: 30, fontFamily: FontFamily.w700),
                ),
                Text(
                  "Your Order have be Placed!!!!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20, color: context.colorScheme.secondary),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: context.colorScheme.primary,
                  ),
                  onPressed: () {
                    PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                        context,
                        screen: Myorder(),
                        settings: RouteSettings(name: "/myOrder"));
                  },
                  child: Text(
                    "Checkout",
                    style: TextStyle(
                        color: context.colorScheme.onPrimary,
                        fontSize: 18,
                        fontFamily: FontFamily.w700),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
