import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:rika_ecomm_app/cubits/cart_bloc_cubit/cart_cubit.dart';
import 'package:rika_ecomm_app/config/common.dart';
import 'package:rika_ecomm_app/cubits/product_cubit/product_cubit.dart';
import 'package:rika_ecomm_app/model/user_cart_model.dart';
import 'package:rika_ecomm_app/screens/bottonnav/cart_screen.dart';

import '../../model/result.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product products;

  const ProductDetailScreen({
    super.key,
    required this.products,
  });

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

num? productQuantity;
String? productName;
num? price;
Object? productId;

late Product product;
int quantity = 1;

List sizes = ["S", "M", "L", "XL", "XXL"];
String? selectedSize;
bool isInCart = false;
List<Color> colors = [
  Colors.white,
  Colors.black,
  Colors.grey,
  Colors.amber,
];
bool iscart = false;
bool fav = false;

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  void initState() {
    super.initState();
    // Initialize the product based on the passed index
    product = widget.products;
  }

  void incrementCount() {
    setState(() {
      quantity++;
      // calculatePrice();
    });
  }

  void decrementCount() {
    if (quantity > 1) {
      setState(() {
        quantity--;
        // calculatePrice();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final addedtocartState = context.watch<ProductCubit>();
    final product = widget.products;
    return Scaffold(
      body: LoadingOverlay(
        isLoading: addedtocartState.state.isLoading,
        child: Stack(
          children: [
            Positioned(
                top: 0,
                right: 0,
                left: 0,
                child: Image.network(
                  product.mainImage?.url ?? '',
                  height: 400,
                  // width: MediaQuery.sizeOf(context).width,
                  fit: BoxFit.fill,
                )),
            Positioned(
                top: 10,
                left: 20,
                child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Image.asset("assets/images/arrowback.png"))),
            Positioned(
                top: 10,
                right: 20,
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset("assets/images/search.png",
                          color: Colors.black),
                    ))),
            Positioned(
                top: 300,
                right: 20,
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      fav = !fav;
                    });
                  },
                  icon: Icon(
                    fav ? Icons.favorite : Icons.favorite_border,
                    color: fav ? Colors.red : Colors.white,
                  ),
                )),
            Positioned(
              top: 380,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Stack(children: [
                  Container(
                    // height: 800,
                    width: MediaQuery.sizeOf(context).width,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(28),
                            topRight: Radius.circular(28))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(product.name!,
                                        style:
                                            context.theme.titleLarge!.copyWith(
                                          fontFamily: FontFamily.w700,
                                        )),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text("Available in stock",
                                      style: context.theme.titleMedium!
                                          .copyWith(
                                              fontFamily: FontFamily.w700)),
                                  const SizedBox(width: 10),
                                  Text(
                                    product.stock.toString(),
                                    style: context.theme.titleMedium!.copyWith(
                                        fontFamily: FontFamily.w700,
                                        color: Colors.grey),
                                  )
                                ],
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset("assets/images/star.png"),
                              Text(" (320 Reviews)",
                                  style: context.theme.titleSmall!
                                      .copyWith(fontFamily: FontFamily.w400)),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text("Sizes",
                              style: context.theme.titleLarge!
                                  .copyWith(fontFamily: FontFamily.w700)),
                          const SizedBox(
                            height: 8,
                          ),
                          SizedBox(
                            height: 40,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: sizes.length,
                              itemBuilder: (BuildContext context, int index) {
                                final size = sizes[index];
                                final isSelected = selectedSize == size;
                                return Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        if (selectedSize == size) {
                                          setState(() {
                                            selectedSize = null;
                                          });
                                        } else {
                                          setState(() {
                                            selectedSize = size;
                                          });
                                        }
                                      },
                                      child: Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          color:
                                              isSelected ? Colors.black : null,
                                          border: Border.all(
                                              color: isSelected
                                                  ? Colors.black
                                                  : Colors.grey
                                                      .withOpacity(0.3)),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Center(
                                            child: Text(
                                          size,
                                          style: TextStyle(
                                              color: isSelected
                                                  ? Colors.white
                                                  : null),
                                        )),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text("Descriptions",
                              style: context.theme.titleLarge!
                                  .copyWith(fontFamily: FontFamily.w700)),
                          const SizedBox(height: 5),
                          Text(product.description!,
                              style: context.theme.bodySmall!.copyWith(
                                  fontFamily: FontFamily.w400,
                                  color: Colors.grey)),
                          const SizedBox(height: 18),
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 250),
                            child: isInCart
                                ? AddedToCart(
                                    onTap: () {
                                      setState(() {
                                        isInCart = false;
                                      });
                                    },
                                  )
                                : ShowPrice(
                                    amounts: product,
                                    onTap: () {
                                      setState(() {
                                        isInCart = true;
                                      });
                                    },
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ShowPrice extends StatefulWidget {
  final Product amounts;
  final VoidCallback onTap;
  const ShowPrice({
    super.key,
    required this.amounts,
    required this.onTap,
  });

  @override
  State<ShowPrice> createState() => _ShowPriceState();
}

class _ShowPriceState extends State<ShowPrice> {
  late Product amount;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    amount = widget.amounts;
  }

  @override
  Widget build(BuildContext context) {
    final cartState = context.watch<CartCubit>();
    final itemList = cartState.state.data?.cart.items ?? [];
    if (itemList.any((e) => e.product?.id == amount.id)) {
      return AddedToCart(onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => CartScreen()));
      });
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(
              "Total Price",
              style: context.theme.titleSmall!
                  .copyWith(fontFamily: FontFamily.w400, color: Colors.grey),
            ),
            Text("\$ ${amount.price}",
                style: context.theme.titleSmall!
                    .copyWith(fontFamily: FontFamily.w700)),
          ],
        ),
        // const SizedBox(width: 72),
        BlocBuilder<CartCubit, Result<CartState>>(
          builder: (context, state) {
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 0, 0, 0),
              ),
              onPressed: () {
                context
                    .read<CartCubit>()
                    .postCartItem(productId: product.id!, quantity: quantity);
              },
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                  child: switch (state.isLoading) {
                    true => Center(
                        child: CircularProgressIndicator(),
                      ),
                    false => Row(
                        children: [
                          Image.asset("assets/images/carticon.png"),
                          const SizedBox(width: 8),
                          Text("Add To Cart",
                              style: context.theme.titleSmall!.copyWith(
                                  fontFamily: FontFamily.w400,
                                  color: Colors.white)),
                        ],
                      ),
                  }),
            );
          },
        ),
      ],
    );
  }
}

class AddedToCart extends StatefulWidget {
  final VoidCallback onTap;
  const AddedToCart({super.key, required this.onTap});

  @override
  State<AddedToCart> createState() => _AddedToCartState();
}

class _AddedToCartState extends State<AddedToCart> {
  int quantity = 1;
  late String price;

  void incrementCount() {
    setState(() {
      quantity++;
      calculatePrice();
    });
  }

  void decrementCount() {
    if (quantity > 1) {
      setState(() {
        quantity--;
        calculatePrice();
      });
    }
  }

  void calculatePrice() {
    double initPrice = 245.00;
    double totalPrice = initPrice * quantity;
    price = totalPrice.toStringAsFixed(2); // Formatting the price
  }

  @override
  void initState() {
    super.initState();
    calculatePrice(); // Initialize price
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(50)),
              height: 40,
              width: 88,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                      onTap: decrementCount,
                      child: Icon(
                        Icons.remove,
                        size: 16,
                      )),
                  Text(
                    '$quantity',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontFamily: FontFamily.w400),
                  ),
                  InkWell(
                    onTap: incrementCount,
                    child: Icon(
                      Icons.add,
                      size: 16,
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(width: 20),
          InkWell(
            onTap: () {
              context
                  .read<CartCubit>()
                  .postCartItem(productId: product.id!, quantity: quantity);
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => CartScreen()));
            },
            child: Container(
              padding: EdgeInsets.all(8),
              margin: const EdgeInsets.only(right: 8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Text("\$ $price",
                      style: context.theme.titleMedium!
                          .copyWith(color: Colors.black)),
                  const SizedBox(width: 8),
                  Container(
                    color: Colors.grey,
                    height: 24,
                    width: 2,
                  ),
                  const SizedBox(width: 8),
                  Image.asset(
                    "assets/images/carticon.png",
                    color: Colors.black,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    "Added To Cart",
                    style: context.theme.bodyMedium!
                        .copyWith(fontFamily: FontFamily.w700),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
