import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rika_ecomm_app/config/common.dart';
import 'package:rika_ecomm_app/model/result.dart';
import 'package:rika_ecomm_app/screens/cart/model/user_cart_model.dart';
import 'package:rika_ecomm_app/screens/profile_next_screens/cubit/favorite_cubit.dart';
import 'package:rika_ecomm_app/screens/profile_next_screens/cubit/product_by_id_cubit.dart';
import 'package:rika_ecomm_app/services/local_storage_service.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  void _loadFavorites() {
    final favoriteProductIds = context.read<FavoritesCubit>().state.productIds;
    if (favoriteProductIds.isNotEmpty) {
      context.read<ProductByIdCubit>().getProductById(productIds: favoriteProductIds);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Image.asset("assets/images/arrowback.png"),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(10),
            child: Icon(Icons.notifications),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Favorites",
                  style: context.theme.headlineMedium!
                      .copyWith(fontFamily: FontFamily.w700),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(100, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: context.colorScheme.primary,
                  ),
                  onPressed: () {
                    context.read<FavoritesCubit>().clearFavorites();
                  },
                  child: Text(
                    "Clear",
                    style: context.theme.titleMedium!.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            BlocListener<FavoritesCubit, LikeState>(
              listener: (context, state) {
                if(state.productIds != null){
                  context.read<ProductByIdCubit>().getProductById(productIds: state.productIds);
                }else {
                  context.read<ProductByIdCubit>().getProductById();
                }

              },
              child: BlocBuilder<ProductByIdCubit, Result<List<Product>>>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state.error != null) {
                    return Center(child: Text("Error: ${state.error}"));
                  }

                  final products = state.data ?? [];

                  if (products.isEmpty) {
                    return const Center(child: Text("No favorites found."));
                  }

                  return Expanded(
                    child: ListView.builder(
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final product = products[index];

                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(1, 1),
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 2,
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Product ID: ${product.id}',
                                style: context.theme.titleMedium,
                              ),
                              const SizedBox(height: 8),
                              Image.network(
                                product.mainImage?.url ?? "",
                                height: 100,
                                width: 100,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                product.name ?? '',
                                style: context.theme.bodyLarge,
                              ),
                              Text(
                                product.description ?? '',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                  "\$${product.price?.toStringAsFixed(2) ?? 'N/A'}"),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
