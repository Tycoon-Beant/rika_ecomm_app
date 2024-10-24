import 'package:flutter/material.dart';
import 'package:rika_ecomm_app/models/mine_page_model.dart';
import 'package:rika_ecomm_app/screens/categorie_screen.dart';

class MinePage extends StatefulWidget {
  const MinePage({super.key});

  @override
  State<MinePage> createState() => _MinePageState();
}

List<String> images = [
  "assets/images/product1.png",
  "assets/images/product2.png",
  "assets/images/product3.png",
  "assets/images/product1.png",
];
String? _isSelected;
late final MinePageModel mine;

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.white,
          leading: Image.asset("assets/images/menu.png"),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20, top: 20),
              child: Image.asset("assets/images/user.png"),
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text('Welcome,',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  )),
              const Text(
                "Our Rika Fashion App",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.blueGrey,
                    fontSize: 18),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                          borderSide: BorderSide.none,
                        ),
                        // labelText: 'Search...',
                        hintText: 'what would you like to buy...',
                        fillColor: const Color(0xffF3F4F5),

                        filled: true,
                        prefixIcon: Image.asset("assets/images/search.png"),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    child: Image.asset("assets/images/filtter.png"),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Categories()));
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Stack(
                        children: [
                          Image.asset('assets/images/backgroundimage.png'),
                          Padding(
                            padding: const EdgeInsets.only(top: 13, left: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  '50% Off',
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Text(
                                  'On everything today',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                const Text(
                                  'With code: rikafashion2021',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 11,
                                      color: Color(0xff666666)),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  height: 25,
                                  width: 72,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: const Center(
                                    child: Text(
                                      'Get Now',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                        ),
                        child: Stack(
                          children: [
                            Image.asset(
                              'assets/images/backgroundimage2.png',
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 13, left: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    '50% Off',
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Text(
                                    'On everything today',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  const Text(
                                    'With code: rikafashion2021',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 11,
                                        color: Color(0xff666666)),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    height: 25,
                                    width: 72,
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: const Center(
                                      child: Text(
                                        'Get Now',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        // height: 160,
                        // width: 260,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      offset: const Offset(2, 6),
                      blurRadius: 5,
                      spreadRadius: 5,
                    )
                  ],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset("assets/images/boot.png"),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Axel Arigato',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Clean 90 Triple Sneakers',
                          style: TextStyle(
                            fontSize: 10,
                            color: Color(0xff666666),
                          ),
                        ),
                        Text(
                          '\$245.00',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 60,
                    ),
                    Image.asset('assets/images/arrow2.png'),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              const Text(
                'Categories',
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isSelected = 'Dresses';
                      });
                    },
                    child: Chip(
                      label: Text(
                        'Dresses',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color:
                                _isSelected == 'Dresses' ? Colors.white : null),
                      ),
                      backgroundColor: _isSelected == 'Dresses'
                          ? Colors.black
                          : Colors.white,
                      shape: const StadiumBorder(
                          side: BorderSide(color: Color(0xffCCCCCC))),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isSelected = 'Jackets';
                      });
                    },
                    child: Chip(
                      label: Text(
                        'Jackets',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color:
                                _isSelected == 'Jackets' ? Colors.white : null),
                      ),
                      backgroundColor: _isSelected == 'Jackets'
                          ? Colors.black
                          : Colors.white,
                      shape: const StadiumBorder(
                          side: BorderSide(color: Color(0xffCCCCCC))),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isSelected = 'Jeans';
                      });
                    },
                    child: Chip(
                      label: Text(
                        'Jeans',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color:
                                _isSelected == 'Jeans' ? Colors.white : null),
                      ),
                      backgroundColor:
                          _isSelected == 'Jeans' ? Colors.black : Colors.white,
                      shape: const StadiumBorder(
                          side: BorderSide(color: Color(0xffCCCCCC))),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isSelected = 'Shoese';
                      });
                    },
                    child: Chip(
                      label: Text(
                        'Shoese',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color:
                                _isSelected == 'Shoese' ? Colors.white : null),
                      ),
                      backgroundColor:
                          _isSelected == 'Shoese' ? Colors.black : Colors.white,
                      shape: const StadiumBorder(
                          side: BorderSide(color: Color(0xffCCCCCC))),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Top Dresses',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    'View All',
                    style: TextStyle(

                        // fontWeight: FontWeight.bold,
                        color: Color(0xff666666),
                        fontSize: 12),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns
                  childAspectRatio: 0.7,
                ),
                itemCount: images.length, // Number of items in your list
                itemBuilder: (BuildContext context, int index) {
                  final mines = minePageContents[index];

                  return ProductItem(
                    mines: mines,
                    index: index,
                  );
                },
                shrinkWrap: true,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProductItem extends StatefulWidget {
  const ProductItem({
    super.key,
    required this.mines,
    required this.index,
  });

  final MinePageModel mines;
  final int index;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool _isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Card(
        color: Colors.white,
        elevation: 0,
        child: Center(
          child: Column(
            children: [
              Image.asset(
                images[widget.index],
                fit: BoxFit.fill,
              ),
              Text(
                widget.mines.name!,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                widget.mines.type!,
                style: const TextStyle(
                  color: Color(0xff666666),
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                widget.mines.price!,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
      ),
      Positioned(
          top: 3,
          right: 10,
          child: IconButton(
            icon: Icon(
              _isLiked ? Icons.favorite : Icons.favorite_border_outlined,
              color: _isLiked ? Colors.red : Colors.black,
            ),
            onPressed: () {
              setState(() {
                _isLiked = !_isLiked;
              });
            },
          ))
    ]);
  }
}
