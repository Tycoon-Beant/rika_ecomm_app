import 'package:flutter/material.dart';
import 'package:rika_ecomm_app/config/common.dart';
import 'package:rika_ecomm_app/screens/bottonnav/cart_screen.dart';

class Rollerrabbitdetails extends StatefulWidget {
  const Rollerrabbitdetails({super.key});

  @override
  State<Rollerrabbitdetails> createState() => _RollerrabbitdetailsState();
}

class _RollerrabbitdetailsState extends State<Rollerrabbitdetails> {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: 0,
              child: Image.asset(
                "assets/images/3x/clothfull.png",
                height: 400,
                width: 420,
                fit: BoxFit.fill,
              )),
          Positioned(
              top: 10,
              left: 20,
              child: Image.asset("assets/images/arrowback.png")),
          Positioned(
              top: 20,
              right: 20,
              child: Image.asset("assets/images/search.png")),
          Positioned(
            top: 300,
            right: 20,
            child: Image.asset("assets/images/whitelove.png"),
          ),
          Positioned(
            top: 380,
            child: SingleChildScrollView(
              child: Stack(children: [
                Container(
                  height: 800,
                  width: 428,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(28),
                          topRight: Radius.circular(48))),
                  child: Padding(
                    padding: const EdgeInsets.all(28.0),
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
                                  child: Text(
                                    "Roller Rabbit",
                                    style: context.theme.titleLarge!.copyWith(fontFamily: FontFamily.w700)
                                  ),
                                ),
                                SizedBox(width: 56),
                                Text(
                                  "Available in stock",
                                  style: context.theme.titleMedium!.copyWith(fontFamily: FontFamily.w700)
                                )
                              ],
                            ),
                            Text(
                              " Vado Odelle Dress",
                              style: context.theme.titleMedium!.copyWith(fontFamily: FontFamily.w400,color: Colors.grey)
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset("assets/images/star.png"),
                            Text(
                              " (320 Reviews)",
                              style: context.theme.titleSmall!.copyWith(fontFamily: FontFamily.w400)
                            ),
                          ],
                        ),
                        
                        const SizedBox(
                          height: 10,
                        ),
                         Text(
                          "Sizes",
                          style: context.theme.titleLarge!.copyWith(fontFamily: FontFamily.w700)
                        ),
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
                                        color: isSelected ? Colors.black : null,
                                        border: Border.all(
                                            color: isSelected
                                                ? Colors.black
                                                : Colors.grey.withOpacity(0.3)),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                          child: Text(
                                        size,
                                        style: TextStyle(
                                            color:
                                                isSelected ? Colors.white : null),
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
                         Text(
                          "Descriptions",
                          style:context.theme.titleLarge!.copyWith(fontFamily: FontFamily.w700)
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "Get a little lift from these Sam Edelman sandals featuring ruched straps and leather lace-up ties, while a braided jute sole makes a fresh statement for summer.",
                          style: context.theme.bodySmall!.copyWith(fontFamily: FontFamily.w400,color: Colors.grey)
                        ),
                        const SizedBox(height: 16),
                        // ShowPrice(),
              
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
          Positioned(
              top: 440,
              right: 50,
              child: Container(
                height: 150,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        offset: const Offset(2, 6),
                        blurRadius: 5,
                        spreadRadius: 2,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Container(
                        height: 28,
                        width: 28,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black),
                            shape: BoxShape.circle),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        height: 28,
                        width: 28,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            border: Border.all(color: Colors.black),
                            shape: BoxShape.circle),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        height: 28,
                        width: 28,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            border: Border.all(color: Colors.black),
                            shape: BoxShape.circle),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        height: 28,
                        width: 28,
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            border: Border.all(color: Colors.black),
                            shape: BoxShape.circle),
                      ),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}

class ShowPrice extends StatelessWidget {
  final VoidCallback onTap;
  const ShowPrice({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(
              "Total Price",
              style:
                  context.theme.titleSmall!.copyWith(fontFamily: FontFamily.w400,color: Colors.grey),
            ),
             Text(
              "\$198.00",
              style: context.theme.titleSmall!.copyWith(fontFamily: FontFamily.w700)
            ),
          ],
        ),
        // const SizedBox(width: 72),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          ),
          onPressed: onTap,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
            child: Row(
              children: [
                Image.asset("assets/images/carticon.png"),
                const SizedBox(width: 8),
                 Text(
                  "Add To Cart",
                  style: context.theme.titleSmall!.copyWith(fontFamily: FontFamily.w400,color: Colors.white)
                ),
              ],
            ),
          ),
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
    } else {
      widget.onTap.call();
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
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => CartScreen()));
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "\$$price",
                  style: context.theme.titleMedium!.copyWith(color: Colors.white)
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(0),
              margin: const EdgeInsets.only(right: 12.0),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(80),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: decrementCount,
                    icon: Icon(Icons.remove,size: 20,),
                  ),
                  Text(
                    '$quantity',
                    style: context.theme.titleLarge!.copyWith(fontFamily: FontFamily.w700)
                  ),
                  IconButton(onPressed: incrementCount,
                   icon: Icon(Icons.add,size:20,))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
