import 'package:flutter/material.dart';
import 'package:rika_ecomm_app/config/common.dart';
import 'package:rika_ecomm_app/screens/Widgets/async_widget.dart';
import 'package:rika_ecomm_app/screens/cart/model/user_cart_model.dart';
import 'package:rika_ecomm_app/screens/profile_next_screens/cubit/product_by_id_cubit.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: Image.asset("assets/images/arrowback.png")),
        ),
        actions: [
          Padding(
              padding: EdgeInsets.all(10), child: Icon(Icons.notifications)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Favorites",
              style: context.theme.headlineMedium!
                  .copyWith(fontFamily: FontFamily.w700),
            ),
            const SizedBox(height: 10),
            AsyncWidget<ProductByIdCubit, List<Product>>(
              data: (productList) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: productList?.length,
                    itemBuilder: (context, index) {
                      final product = productList?[index];

                      return Column(
                        children: [
                          Container(
                            width: 350,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(1, 1),
                                  color:
                                      const Color.fromARGB(255, 224, 223, 223),
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                )
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Product ID: ${product?.id}',
                                      style: context.theme.titleMedium),
                                  const SizedBox(height: 4),
                                  Image.network(product?.mainImage?.url ?? ""),
                                  Text(product?.name ?? ''),
                                  Text(product?.description ?? ''),
                                  Text(product?.price?.toString() ?? ''),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          const SizedBox(height: 10),
                        ],
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
