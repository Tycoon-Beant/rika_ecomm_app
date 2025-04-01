import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rika_ecomm_app/Widgets/async_widget.dart';
import 'package:rika_ecomm_app/screens/category_and_product/cubit/product_cubit.dart';
import 'package:rika_ecomm_app/screens/category_and_product/model/category_model.dart';
import 'package:rika_ecomm_app/screens/product_details/product_detail_screen.dart';
import 'package:rika_ecomm_app/screens/profile_next_screens/cubit/favorite_cubit.dart';

import '../cart/model/user_cart_model.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key, this.categoryId});
  final Categories? categoryId;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    super.initState();
    final productCubit = context.read<ProductCubit>();
    if (widget.categoryId != null) {
      productCubit.getProductByCategoryId(widget.categoryId!.sId!);
    } else {
      productCubit.getProductDetail();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset("assets/images/arrowback.png"),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          const Padding(
            padding: EdgeInsets.only(right: 24),
            child: Icon(Icons.search),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 10),
              child: Text(
                widget.categoryId?.name ?? 'Clothes',
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(child: ProductList()),
          ],
        ),
      ),
    );
  }
}

class ProductList extends StatelessWidget {
  const ProductList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AsyncWidget<ProductCubit, ProductListState>(data: (data) {
      return SmartRefresher(
        controller: context.read<ProductCubit>().refreshController,
        enablePullUp: true,
        enablePullDown: true,
        onRefresh: () => context.read<ProductCubit>().getProductDetail(),
        onLoading: () => context.read<ProductCubit>().loadMore(),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: data?.products?.data.length,
          itemBuilder: (context, index) {
            final product = data?.products?.data[index];
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        ProductDetailScreen(products: product),
                  ),
                );
              },
              child: ClothItem(product: product!),
            );
          },
        ),
      );
    });
  }
}

class ClothItem extends StatelessWidget {
  final Product product;

  const ClothItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final productId = product.id ?? '';
    return Stack(
      children: [
        Card(
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      product.mainImage?.url ?? '',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          "assets/images/placeholder.png",
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  product.name ?? 'No Name',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Text(
                    product.description ?? '',
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.grey,
                        ),
                  ),
                ),
                Text(
                  "\$${product.price?.toStringAsFixed(2) ?? '0.00'}",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: BlocBuilder<FavoritesCubit, LikeState>(
            builder: (context, state) {
              final isLiked = state.isLiked(productId);
              return IconButton(
                onPressed: () {
                  final cubit = context.read<FavoritesCubit>();
                  isLiked
                      ? cubit.removeFavorite(productId)
                      : cubit.addFavorite(productId);
                },
                icon: Icon(
                  isLiked ? Icons.favorite : Icons.favorite_border,
                  color: isLiked ? Colors.red : Colors.grey,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
