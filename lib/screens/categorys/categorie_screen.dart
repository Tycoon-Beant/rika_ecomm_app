import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rika_ecomm_app/config/common.dart';
import 'package:rika_ecomm_app/models/category_model.dart';
import 'package:rika_ecomm_app/screens/categorys/providers/category_notifier.dart';
import 'package:rika_ecomm_app/services/category_services.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

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
              Expanded(
                child: Consumer<CategoryNotifier>(
                  builder: (context, notifier, child) {
                    if (notifier.isLoading) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (notifier.error != null) {
                      return Center(
                        child: Text("Error: ${notifier.error}"),
                      );
                    } else {
                      final categoryList = notifier.categoryList;
                      return ListView.builder(
                        itemCount: categoryList.length,
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Image.asset(
                                          categoryContents[index].image),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      SizedBox(
                                        width: 150,
                                        child: Text(
                                          categoryList[index],
                                          style: context.theme.titleLarge!.copyWith(
                                            fontFamily: FontFamily.w700,
                                            color: Colors.white
                                          ),
                                        ),
                                      ),
                                      // SizedBox(
                                      //   width: 100,
                                      //   child: Text(
                                      //     categoryContents[index].products,
                                      //     style: TextStyle(
                                      //       color: Colors.white,
                                      //       fontFamily: 'Mont Blanc Regular',
                                      //     ),
                                      //   ),
                                      // )
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
