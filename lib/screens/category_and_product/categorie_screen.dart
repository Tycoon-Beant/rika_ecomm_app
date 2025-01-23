import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rika_ecomm_app/config/common.dart';
import 'package:rika_ecomm_app/model/result.dart';
import 'package:rika_ecomm_app/screens/category_and_product/products_screen.dart';
import 'package:rika_ecomm_app/screens/category_and_product/cubit/category_list_cubit.dart';
import 'package:rika_ecomm_app/screens/category_and_product/model/category_model.dart';

class CategoriScreen extends StatefulWidget {
  const CategoriScreen({super.key});

  @override
  State<CategoriScreen> createState() => _CategoriScreenState();
}

class _CategoriScreenState extends State<CategoriScreen> {
  String? selectedCategory;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
         
          leading: GestureDetector(
                onTap: (){
                  Navigator.of(context).pop();
                },
                child: Image.asset("assets/images/arrowback.png")),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Image.asset("assets/images/search.png"),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'Categories',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: BlocBuilder<CategoryListCubit , Result<CategoriModel>>(
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
                        return const Center(child: Text("No categories available."));
                      }
                      return ListView.builder(
                        itemCount: categories.length,
                        itemBuilder: (BuildContext context, int index) {
                           final category = categories[index];
                          return Column(
                            children: [
                              const SizedBox(height: 8),
                              InkWell(
                                onTap: () {
                                    setState(() {
                                      selectedCategory = category.name;
                                      
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductScreen(categoryId: category,)));
                                    });
                                  },
                                child: Container(
                                  height: 70,width: 300,
                                  decoration: BoxDecoration(
                                    color:context.colorScheme.primary,
                                    borderRadius: BorderRadius.circular(80),
                                    border: Border.all( color: selectedCategory == category.name ? Colors.white : Colors.black, width:2),
                                    boxShadow: [
                                     selectedCategory == category.name? BoxShadow(
                                        offset: Offset(2, 2),
                                        color: const Color.fromARGB(255, 241, 240, 240),
                                        spreadRadius: 2,
                                        blurRadius: 2
                                      ) : BoxShadow()
                                    ]
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          category.name ?? 'Unnamed Category',
                                          style: context.theme.titleLarge!.copyWith(
                                            fontFamily: FontFamily.w700,
                                            color: context.colorScheme.onPrimary,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                            ],
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
