import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:rika_ecomm_app/config/common.dart';
import 'package:rika_ecomm_app/cubits/product_cubit/product_cubit.dart';
import 'package:rika_ecomm_app/screens/productdetails/product_detail_screen.dart';

import '../../model/result.dart';
import '../../model/user_cart_model.dart';

class ClothCategory extends StatefulWidget {
  const ClothCategory({super.key});

  @override
  State<ClothCategory> createState() => _ClothCategoryState();
}

class _ClothCategoryState extends State<ClothCategory> {
  @override
  Widget build(BuildContext context) {
    final productState = context.watch<ProductCubit>();
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        scrolledUnderElevation: 0.0,
        notificationPredicate: (_) => false,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 24),
          child: GestureDetector(
            child: Image.asset("assets/images/arrowback.png"),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: Image.asset("assets/images/search.png"),
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
                "Cloths",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                  fontFamily: FontFamily.w700,
                ),
              ),
            ),
            BlocBuilder<ProductCubit , Result<List<Product>>>(
              builder: (context, state) {
                if (state.isLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state.error != null) {
                  return Center(
                    child: Text("Error: ${state.error}"),
                  );
                } else {
                  final products =productState.state.data  ?? [];
                  return ProductList(products: products);
                }
                // final state = notifier.resultState;
                // return switch (state) {
                //   LoadingState() => Center(child: CircularProgressIndicator()),
                //   DataState(products: var data) =>
                //     ProductList(products: data.data?.products ?? []),
                //   ErrorState(error: var e) => Center(child: Text(e.toString()))
                // };
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ProductList extends StatelessWidget {
  const ProductList({
    super.key,
    required this.products,
  });

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
        ),
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          final product = products[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(products: product),
                ),
              );
            },
            child: ClothItem(cloth: product),
          );
        },
      ),
    );
  }
}

class ClothItem extends StatefulWidget {
  final Product cloth;
  // final MainImage image;

  const ClothItem({
    super.key,
    required this.cloth,
  });

  @override
  State<ClothItem> createState() => _ClothItemState();
}

class _ClothItemState extends State<ClothItem> {
  bool isliked = false;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Card(
        color: Colors.white,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: AspectRatio(
                    aspectRatio: 2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        widget.cloth.mainImage!.url!,
                        fit: BoxFit.fill,
                      ),
                    )),
              ),
              Text(
                widget.cloth.name.toString(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.theme.titleMedium,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Text(widget.cloth.description.toString(),
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: context.theme.bodySmall!.copyWith(
                        color: Color.fromARGB(255, 174, 173, 173),
                        fontFamily: FontFamily.w300)),
              ),
              Text("\$ ${widget.cloth.price}",
                  textAlign: TextAlign.center,
                  style: context.theme.titleMedium),
            ],
          ),
        ),
      ),
      Positioned(
          top: 10,
          right: 10,
          child: IconButton(
            onPressed: () {
              setState(() {
                isliked = !isliked;
              });
            },
            icon: Icon(
              isliked ? Icons.favorite : Icons.favorite_border,
              color: isliked ? Colors.red : Colors.white,
            ),
          )
          // Image.asset("assets/images/3x/love.png",
          //     scale: 2,
          //  )
          )
    ]);
  }
}
