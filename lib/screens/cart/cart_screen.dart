import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:rika_ecomm_app/config/common.dart';
import 'package:rika_ecomm_app/di/service_locator.dart';
import 'package:rika_ecomm_app/model/result.dart';
import 'package:rika_ecomm_app/screens/cart/cubit/cart_cubit.dart';
import 'package:rika_ecomm_app/screens/cart/cubit/cart_list_cubit.dart';
import 'package:rika_ecomm_app/screens/cart/model/user_cart_model.dart';
import 'package:rika_ecomm_app/screens/coupon/coupon_screen.dart';
import 'package:rika_ecomm_app/screens/coupon/cubit/apply_coupon_cubit.dart';
import 'package:rika_ecomm_app/screens/coupon/model/coupons_model.dart';
import 'package:rika_ecomm_app/screens/order_screens/orderdetails.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
  }

  final couponsText = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    final cartState = context.watch<CartListCubit>();

    return BlocProvider(
      create: (context) => getIt<ApplyCouponCubit>(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.only(top: 10, left: 10),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).maybePop();
                },
                child: Image.asset(
                  'assets/images/arrow.png',
                ),
              ),
            ),
          ),
          body: MultiBlocListener(
            listeners: [
              BlocListener<ApplyCouponCubit, Result<UserCart>>(
                listener: (context, state) {
                  if (state.data != null) {
                    context.read<CartListCubit>().updateCart(state.data!);
                  }
                },
              ),
              BlocListener<CartCubit, Result<CartState>>(
                listener: (context, state) {
                  if (state.data?.cart != null &&
                      state.data?.event == CartEvent.clear) {
                    context.read<CartListCubit>().updateCart(state.data!.cart);
                  }
                },
              ),
            ],
            child: BlocBuilder<CartCubit, Result<CartState>>(
              builder: (context, state) {
                final couponState = context.watch<ApplyCouponCubit>();
                final clearCartState = context.watch<CartCubit>();
                return LoadingOverlay(
                  isLoading: state.isLoading ||
                      couponState.state.isLoading ||
                      clearCartState.state.isLoading,
                  color: Colors.transparent,
                  progressIndicator: Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Colors.grey),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 17),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('My Cart',
                                  style: context.theme.headlineSmall),
                              if (cartState.state.data?.items?.isNotEmpty ??
                                  false)
                                ClearButton()
                              else
                                SizedBox.shrink()
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 300,
                            child: BlocListener<CartCubit, Result<CartState>>(
                              listener: (context, state) {
                                if (state.data?.cart != null &&
                                    state.data?.event == CartEvent.add) {
                                  context
                                      .read<CartListCubit>()
                                      .updateCart(state.data!.cart);
                                }
                                if (state.data?.cart != null &&
                                    state.data?.event == CartEvent.update) {
                                  context
                                      .read<CartListCubit>()
                                      .updateCart(state.data!.cart);
                                }
                                if (state.data?.cart != null &&
                                    state.data?.event == CartEvent.delete) {
                                  context
                                      .read<CartListCubit>()
                                      .updateCart(state.data!.cart);
                                }
                              },
                              child:
                                  BlocBuilder<CartListCubit, Result<UserCart>>(
                                builder: (context, state) {
                                  if (state.error != null) {
                                    return Center(
                                      child: Text(
                                          "Error: ${state.error.toString()}"),
                                    );
                                  } else {
                                    var cart =
                                        cartState.state.data?.items ?? [];

                                    if (cart.isEmpty) {
                                      return const Center(
                                          child: Text("No item in cart."));
                                    }

                                    return ListView.builder(
                                      itemCount: cart.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        final cartItem = cart[index];
                                        return CartItem(cartItem: cartItem);
                                      },
                                    );
                                  }
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          BlocBuilder<CartListCubit, Result<UserCart>>(
                            builder: (context, state) {
                              if (state.data?.items?.isNotEmpty ?? true) {
                                return Column(
                                  children: [
                                    if (cartState.state.data?.coupon != null)
                                      CouponApplied(
                                        coupon: cartState.state.data!.coupon!,
                                      )
                                    else
                                      ApplyCoupon(),
                                    SizedBox(height: 20),
                                    OrderSummary(cartState: cartState),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Total : ${cartState.state.data?.itemCount ?? "0"} items',
                                            style: context.theme.bodySmall,
                                          ),
                                          Text(
                                            '\$ ${cartState.state.data?.coupon != null ? cartState.state.data?.discountedTotal : cartState.state.data?.cartTotal} ',
                                            style: context.theme.titleMedium
                                                ?.copyWith(
                                                    fontWeight:
                                                        FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    InkWell(
                                      onTap: () {
                                        PersistentNavBarNavigator
                                            .pushNewScreenWithRouteSettings(
                                          context,
                                          screen: Orderdetails(),
                                          settings:
                                              RouteSettings(name: "/checkout"),
                                        );
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: context.colorScheme.secondary,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Center(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 5),
                                                child: Text(
                                                    'Proceed to Checkout',
                                                    style: context
                                                        .theme.titleSmall
                                                        ?.copyWith(
                                                            color: context
                                                                .colorScheme
                                                                .onPrimary)),
                                              ),
                                            ),
                                            Image.asset(
                                                'assets/images/arrow3.png'),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                  ],
                                );
                              } else {
                                return SizedBox.shrink();
                              }
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class OrderSummary extends StatelessWidget {
  const OrderSummary({
    super.key,
    required this.cartState,
  });

  final CartListCubit cartState;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, Result<CartState>>(
      builder: (context, state) {
        return Container(
          // width: 360,
          // height: 143,
          decoration: BoxDecoration(
            border: Border.all(
              color: context.colorScheme.onTertiary,
            ),
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Discount value:',
                      style: context.theme.titleSmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      " - \$ ${(cartState.state.data?.cartTotal ?? 0) - (cartState.state.data?.discountedTotal ?? 0)}",
                      style: context.theme.titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 1,
                  color: context.colorScheme.onTertiary,
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'BagTotal:',
                      style: context.theme.titleSmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Text(
                          '(${cartState.state.data?.itemCount ?? 0} items)',
                          style: TextStyle(
                              fontSize: 12,
                              color: Color.fromARGB(255, 95, 95, 95),
                              fontFamily: 'Mont Blanc Light'),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          '\$ ${cartState.state.data?.cartTotal ?? 0} ',
                          style: context.theme.titleMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ClearButton extends StatelessWidget {
  const ClearButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: context.colorScheme.onTertiary,
        shape: RoundedRectangleBorder(
          side: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: () async {
        await context.read<CartCubit>().clearCartTotally();
      },
      child: Text(
        'Clear Cart',
        style: context.theme.bodyLarge!.copyWith(
            fontFamily: FontFamily.w700, color: context.colorScheme.primary),
      ),
    );
  }
}

class ApplyCoupon extends StatelessWidget {
  const ApplyCoupon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 50,
      decoration: BoxDecoration(
        color: context.colorScheme.onSecondary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Center(
          child: TextField(
            // key: couponsText,
            readOnly: true,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CouponScreen(),
                ),
              );
            },
            decoration: InputDecoration(
              hintText: 'Promo Code',
              border: InputBorder.none,
              hintStyle: TextStyle(fontSize: 15, color: Color(0xffAAAAAA)),
              suffixIcon: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CouponScreen(),
                    ),
                  );
                },
                child: Text(
                  'Apply',
                  style: TextStyle(fontSize: 13, fontFamily: FontFamily.w400),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CouponApplied extends StatelessWidget {
  final Coupon coupon;
  const CouponApplied({super.key, required this.coupon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 50,
      decoration: BoxDecoration(
        color: context.colorScheme.onSecondary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Center(
          child: TextField(
            // key: couponsText,
            readOnly: true,
            // onTap: () {
            //   Navigator.of(context).push(
            //       MaterialPageRoute(builder: (context) => CouponScreen()));
            // },
            decoration: InputDecoration(
                hintText: 'Coupon Applied',
                border: InputBorder.none,
                hintStyle: TextStyle(
                  fontSize: 15,
                  color: Color(0xffAAAAAA),
                ),
                suffixIcon: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          side: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () {
                      context
                          .read<ApplyCouponCubit>()
                          .removeCoupon(couponcode: coupon.couponCode!);
                    },
                    child: Text('Remove',
                        style: TextStyle(
                            fontSize: 13, fontFamily: FontFamily.w400)))),
          ),
        ),
      ),
    );
  }
}

class CartList extends StatefulWidget {
  const CartList({super.key});

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class CartItem extends StatelessWidget {
  final Item cartItem;
  const CartItem({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          width: 400,
          decoration: BoxDecoration(
              color: context.colorScheme.onTertiary,
              borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      cartItem.product?.mainImage?.url ?? '',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 160,
                      child: Text(
                        cartItem.product?.name ?? "",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: context.theme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      // '\$ ${(cartItem.product?.price ?? 0) * (cartItem.quantity ?? 0)}'
                      '\$ ${cartItem.product?.price.toString()}',
                      style: context.theme.titleMedium
                          ?.copyWith(fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
                SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, right: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: context.colorScheme.onSecondary,
                          border:
                              Border.all(color: context.colorScheme.secondary),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        height: 30,
                        width: 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                                onTap: () {
                                  if ((cartItem.quantity!) > 1) {
                                    // quantity --;
                                    context.read<CartCubit>().updateQuantity(
                                        productId: cartItem.product!.id!,
                                        quantity: (cartItem.quantity ?? 1) - 1);
                                  } else {
                                    context.read<CartCubit>().deltCartItem(
                                        productId: cartItem.product!.id!);
                                  }
                                },
                                child: Icon(
                                  Icons.remove,
                                  size: 20,
                                )),
                            Text(
                              "${cartItem.quantity ?? 1}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: context.colorScheme.primary,
                                  fontFamily: FontFamily.w400),
                            ),
                            InkWell(
                              onTap: () {
                                context.read<CartCubit>().updateQuantity(
                                    productId: cartItem.product!.id!,
                                    quantity: (cartItem.quantity ?? 1) + 1);
                              },
                              child: Icon(
                                Icons.add,
                                size: 20,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
