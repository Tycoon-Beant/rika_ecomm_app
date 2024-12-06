import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rika_ecomm_app/config/common.dart';
import 'package:rika_ecomm_app/cubits/categotry_cubit/category_list_cubit.dart';
import 'package:rika_ecomm_app/cubits/product_cubit/product_cubit.dart';
import 'package:rika_ecomm_app/model/categories_model/category_model.dart';
import 'package:rika_ecomm_app/model/result.dart';
import 'package:rika_ecomm_app/model/user_cart_model.dart';
import 'package:rika_ecomm_app/screens/categorys/categorie_screen.dart';
import 'package:rika_ecomm_app/screens/categorys/cloth_category.dart';
import 'package:rika_ecomm_app/screens/filter/filterscreen.dart';
import 'package:rika_ecomm_app/screens/productdetails/product_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? selectedCategory;
Categories? categories;
  @override
  Widget build(BuildContext context) {
    final productState = context.read<ProductCubit>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.white,
          leading: Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Image.asset(
              "assets/images/menu.png",
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10, top: 10),
              child: Image.asset(
                "assets/images/user.png",
              ),
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
              Text('Welcome,', style: context.theme.headlineSmall),
              SizedBox(
                height: 5,
              ),
              Text("Our Rika Fashion App",
                  style: context.theme.titleLarge
                      ?.copyWith(color: Color(0xff666666))),
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
                        hintText: 'Search...',
                        hintStyle:
                            TextStyle(fontSize: 18, color: Color(0xffAAAAAA)),
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
                                    style: context.theme.headlineSmall,
                                  ),
                                  Text(
                                    'On everything today',
                                    style: context.theme.titleMedium,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text('With code: rikafashion2021',
                                      style: context.theme.bodySmall?.copyWith(
                                          color: Color(0xff666666),
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    height: 25,
                                    width: 70,
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(8, 4, 8, 4),
                                      child: Center(
                                        child: Text(
                                          'Get Now',
                                          style: context.theme.labelSmall
                                              ?.copyWith(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  )
                                ]),
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
                                    style: context.theme.headlineSmall,
                                  ),
                                  Text(
                                    'On everything today',
                                    style: context.theme.titleMedium,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text('With code: rikafashion2021',
                                      style: context.theme.bodySmall?.copyWith(
                                          color: Color(0xff666666),
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    height: 25,
                                    width: 70,
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(8, 4, 8, 4),
                                      child: Center(
                                        child: Text(
                                          'Get Now',
                                          style: context.theme.labelSmall
                                              ?.copyWith(color: Colors.white),
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
                          style: context.theme.bodyLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Clean 90 Triple Sneakers',
                          style: context.theme.bodySmall
                              ?.copyWith(color: Color(0xff666666)),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text('\$245.00',
                            style: context.theme.bodyLarge
                                ?.copyWith(fontWeight: FontWeight.bold)),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categories',
                    style: context.theme.titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CategoriScreen()));
                    },
                    child: Text(
                      'View All',
                      style: context.theme.bodyMedium
                          ?.copyWith(color: Color(0xff666666)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              BlocBuilder<CategoryListCubit, Result<CategoriModel>>(
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
                    final categories = state.data?.data?.categories;
                    if (categories == null || categories.isEmpty) {
                      return const Center(
                          child: Text("No categories available."));
                    }
                    return SizedBox(
                      height: 40,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          itemBuilder: (BuildContext context, int index) {
                            final category = categories[index];
                            return Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedCategory = category.name;
                                      
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ClothCategory(categoryId: category,)));
                                    });
                                  },
                                  child: Chip(
                                    label: Text(category.name!,
                                        style: context.theme.bodyLarge!
                                            .copyWith(
                                                color: selectedCategory ==
                                                        category.name
                                                    ? Colors.white
                                                    : Colors.black)),
                                    backgroundColor:
                                        selectedCategory == category.name
                                            ? Colors.black
                                            : Colors.white,
                                    shape: const StadiumBorder(
                                        side: BorderSide(
                                            color: Color(0xffCCCCCC))),
                                  ),
                                ),
                                const SizedBox(width: 10),
                              ],
                            );
                          }),
                    );
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Top Dresses',
                    style: context.theme.titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ClothCategory()));
                      },
                      child: Text(
                        'View All',
                        style: context.theme.bodyMedium
                            ?.copyWith(color: Color(0xff666666)),
                      )),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TopDressGrid(productState: productState)
            ],
          ),
        ),
      ),
    );
  }
}

class TopDressGrid extends StatelessWidget {
  const TopDressGrid({
    super.key,
    required this.productState,
  });

  final ProductCubit productState;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, Result<ProductListState>>(
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
        return GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns
            childAspectRatio: 0.75,
          ),
          itemCount: 4, // Number of items in your list
          itemBuilder: (BuildContext context, int index) {
            final product = state.data!.products![index];

            return InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        ProductDetailScreen(products: product),
                  ),
                );
              },
              child: ClothItem(
                cloth: product,
              ),
            );
          },
          shrinkWrap: true,
        );
      }
    });
  }
}
