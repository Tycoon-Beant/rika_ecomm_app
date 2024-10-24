import 'package:flutter/material.dart';

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
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Roller Rabbit",
                                  style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(width: 68),
                              Text(
                                "Available in stock",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Text(
                            " Vado Odelle Dress",
                            style: TextStyle(color: Colors.grey, fontSize: 18),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset("assets/images/star.png"),
                          const Text(
                            " (320 Reviews)",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Sizes",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
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
                      const Text(
                        "Descriptions",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Get a little lift from these Sam Edelman sandals featuring ruched straps and leather lace-up ties, while a braided jute sole makes a fresh statement for summer.",
                        style: TextStyle(
                            fontSize: 16, color: Colors.grey.withOpacity(0.9)),
                      ),
                      const SizedBox(height: 28),
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
      children: [
        Column(
          children: [
            Text(
              "Total Price",
              style:
                  TextStyle(fontSize: 24, color: Colors.grey.withOpacity(0.9)),
            ),
            const Text(
              "\$198.00",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(width: 60),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          ),
          onPressed: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Image.asset("assets/images/carticon.png"),
                const SizedBox(width: 8),
                const Text(
                  "Add To Cart",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
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
    return Container(
      height: 80,
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
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 12.0),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(80),
            ),
            child: Row(
              children: [
                TextButton(
                  onPressed: decrementCount,
                  child: const Text(
                    "-",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 36,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  '$quantity',
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: incrementCount,
                  child: const Text(
                    "+",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 34,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
