import 'package:flutter/material.dart';
import 'package:rika_ecomm_app/config/common.dart';
import 'package:rika_ecomm_app/models/mine_page_model.dart';
import 'package:rika_ecomm_app/screens/filter/filterscreen.dart';
import 'package:rika_ecomm_app/screens/productdetails/rollerrabbitdetails.dart';

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
          leading: Image.asset("assets/images/menu.png",scale: 0.9,),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10, top: 6),
              child: Image.asset("assets/images/user.png",scale: 1,),
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
              Text('Welcome,',
                  style: TextStyle(
                    fontFamily: FontFamily.w700,
                    fontSize: 32,
                  )),
              Text(
                "Our Rika Fashion App",
                style: TextStyle(
                    fontFamily: FontFamily.w700,
                    color: Colors.blueGrey,
                    fontSize: 20),
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
                        hintText: 'what would you like to buy...',
                        fillColor: const Color(0xffF3F4F5),
                        filled: true,
                        prefixIcon: Icon(Icons.search),
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
                              builder: (context) => FilterScreen()));
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
                                Text(
                                  '50% Off',
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontFamily: FontFamily.w700,
                                  ),
                                ),
                                Text(
                                  'On everything today',
                                  style: TextStyle(
                                      fontFamily:FontFamily.w400,
                                      fontSize:20),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'With code: rikafashion2021',
                                  style: TextStyle(
                                      fontFamily: FontFamily.w700,
                                      fontSize: 16,
                                      color: const Color.fromARGB(255, 97, 96, 96)),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  // height: 25,
                                  // width: 72,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(30)),
                                  child:  Padding(
                                      padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
                                      child: Center(
                                        child: Text(
                                          'Get Now',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: FontFamily.w400,
                                            fontSize: 12),
                                        ),
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
                                  Text(
                                    '50% Off',
                                    style: TextStyle(
                                      fontSize: 28,
                                      fontFamily: FontFamily.w700,
                                    ),
                                  ),
                                  Text(
                                    'On everything today',
                                    style: TextStyle(
                                        fontFamily: FontFamily.w400,
                                        fontSize: 24),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'With code: rikafashion2021',
                                    style: TextStyle(
                                        fontFamily: FontFamily.w700,
                                        fontSize: 16,
                                        color: const Color(0xff666666)),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    // height: 25,
                                    // width: 72,
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child:  Padding(
                                      padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
                                      child: Center(
                                        child: Text(
                                          'Get Now',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: FontFamily.w400,
                                            fontSize: 12),
                                        ),
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Axel Arigato',
                          style: TextStyle(fontSize: 18, fontFamily: FontFamily.w700),
                        ),
                        const Text(
                          'Clean 90 Triple Sneakers',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 132, 131, 131),
                          ),
                        ),
                        Text(
                          '\$245.00',
                          style: TextStyle(fontSize: 20 ,fontFamily: FontFamily.w700),
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
              Text(
                'Categories',
                style: TextStyle(fontFamily: FontFamily.w700, fontSize: 24),
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
                          fontSize: 16,
                            fontFamily: FontFamily.w700,
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
                            fontSize: 16,
                            fontFamily: FontFamily.w700,
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
                            fontSize: 16,
                            fontFamily: FontFamily.w700,
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
                           fontSize: 16,
                            fontFamily: FontFamily.w700,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Top Dresses',
                    style: TextStyle(fontFamily: FontFamily.w700, fontSize: 24),
                  ),
                  const Text(
                    'View All',
                    style: TextStyle(
                        color: Color(0xff666666),
                        fontSize: 18),
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
                  childAspectRatio: 0.75,
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
      GestureDetector(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Rollerrabbitdetails()));
        },
        child: Card(
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
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: FontFamily.w700),
                ),
                Text(
                  widget.mines.type!,
                  style: TextStyle(
                    color: const Color(0xff666666),
                    fontSize: 14,
                    fontFamily: FontFamily.w400,
                  ),
                ),
                Text(
                  widget.mines.price!,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: FontFamily.w700),
                )
              ],
            ),
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
