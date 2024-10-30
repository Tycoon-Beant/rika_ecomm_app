import 'package:flutter/material.dart';
import 'package:rika_ecomm_app/models/category_model.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Image.asset("assets/images/arrow.png"),
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
              Container(
                height: 600,
                child: ListView.builder(
                  itemCount: categoryContents.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Container(
                          height: 70,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(80),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Image.asset(categoryContents[index].image),
                                SizedBox(
                                  width: 15,
                                ),
                                SizedBox(
                                  width: 150,
                                  child: Text(
                                    categoryContents[index].category,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontFamily: 'Mont Blanc Bold',
                                        color: Colors.white),-
                                  ),
                                ),
                                SizedBox(
                                  width: 100,
                                  child: Text(
                                    categoryContents[index].products,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Mont Blanc Regular',
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    );
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
