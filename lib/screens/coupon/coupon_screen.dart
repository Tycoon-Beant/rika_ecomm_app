import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:rika_ecomm_app/config/common.dart';
import 'package:rika_ecomm_app/di/service_locator.dart';
import 'package:rika_ecomm_app/screens/cart/cubit/cart_list_cubit.dart';
import 'package:rika_ecomm_app/screens/cart/model/user_cart_model.dart';
import 'package:rika_ecomm_app/screens/coupon/cubit/apply_coupon_cubit.dart';
import 'package:rika_ecomm_app/screens/coupon/cubit/coupon_list_cubit.dart';
import 'package:rika_ecomm_app/screens/coupon/model/coupons_model.dart';

import '../../../model/result.dart';

class CouponScreen extends StatefulWidget {
  const CouponScreen({super.key});

  @override
  State<CouponScreen> createState() => _CouponScreenState();
}

class _CouponScreenState extends State<CouponScreen> {
  @override
  Widget build(BuildContext context) {
    return 
     BlocProvider(
                      create: (context) => getIt.get<CouponListCubit>(),
                    
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: Image.asset("assets/images/arrowback.png")),
        ),
        body: BlocConsumer<ApplyCouponCubit, Result<UserCart>>(
          listener: (context, state) {
            if (state.data != null) {
              context.read<CartListCubit>().updateCart(state.data!);
              Navigator.of(context).pop();
            }
            if (state.error != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.error.toString())));
            }
          },
          builder: (context, state) {
            return LoadingOverlay(
              isLoading: state.isLoading,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Coupons', style: context.theme.headlineSmall),
                    const SizedBox(height: 10),
                    Expanded(
                      child: BlocBuilder<CouponListCubit, Result<List<Coupon>>>(
                        builder: (context, state) {
                          return state.when(
                            onLoading: () {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                            onData: (coupon) {
                              if (coupon == null || coupon.isEmpty) {
                                return Center(
                                    child: Text(
                                        "Looks like no coupon is available. Come back later."));
                              }
                              return ListView.builder(
                                itemCount: coupon.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final coupons = coupon[index];
                                  return Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                  offset: Offset(2, 3),
                                                  color: const Color.fromARGB(
                                                      255, 195, 194, 194),
                                                  blurRadius: 5,
                                                  spreadRadius: 2),
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Text(
                                                coupons.type!,
                                                style: context
                                                    .theme.headlineSmall!
                                                    .copyWith(
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              const SizedBox(width: 8),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(coupons.couponCode!,
                                                        style: context
                                                            .theme.bodyLarge
                                                            ?.copyWith(
                                                                fontFamily:
                                                                    FontFamily
                                                                        .w700,
                                                                color: Colors
                                                                    .black)),
                                                    Row(
                                                      children: [
                                                        Text('Discount Value: ',
                                                            style: context.theme
                                                                .bodySmall!
                                                                .copyWith(
                                                                    color: Colors
                                                                        .grey)),
                                                        Expanded(
                                                          child: Text(
                                                              coupons
                                                                  .discountValue!
                                                                  .toString(),
                                                              style: context
                                                                  .theme
                                                                  .bodySmall!
                                                                  .copyWith(
                                                                      color: Colors
                                                                          .grey)),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                            'Minimum Cart Value: ',
                                                            style: context.theme
                                                                .bodySmall!
                                                                .copyWith(
                                                                    color: Colors
                                                                        .grey)),
                                                        Text(
                                                            coupons
                                                                .minimumCartValue!
                                                                .toString(),
                                                            style: context.theme
                                                                .bodySmall!
                                                                .copyWith(
                                                                    color: Colors
                                                                        .grey)),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  context
                                                      .read<ApplyCouponCubit>()
                                                      .postCoupon(
                                                          couponcode: coupons
                                                              .couponCode!);
                                                },
                                                child: Text("APPLY",
                                                    style: context
                                                        .theme.bodyLarge
                                                        ?.copyWith(
                                                      fontFamily:
                                                          FontFamily.w700,
                                                      color: context.colorScheme
                                                          .secondary,
                                                    )),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                    ],
                                  );
                                },
                              );
                            },
                            onError: (e) {
                              return Center(
                                child: Text("Error: //${state.error}"),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
