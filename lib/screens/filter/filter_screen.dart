import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rika_ecomm_app/config/common.dart';
import 'package:rika_ecomm_app/model/result.dart';
import 'package:rika_ecomm_app/screens/category_and_product/cubit/category_list_cubit.dart';
import 'package:rika_ecomm_app/screens/category_and_product/cubit/product_cubit.dart';
import 'package:rika_ecomm_app/screens/category_and_product/model/category_model.dart';
import 'package:rika_ecomm_app/screens/filter/cubit/filter_cubit.dart';
import 'package:rika_ecomm_app/screens/filter/model/filter_model.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

List stars = [
  "assets/images/5star.png",
  "assets/images/4star.png",
  "assets/images/3star.png",
  "assets/images/2star.png",
  "assets/images/1star.png",
];
String? selectedRating;

class _FilterScreenState extends State<FilterScreen> {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.only(left: 24),
              child: GestureDetector(
                child: Image.asset("assets/images/arrowback.png"),
                onTap: () {
                  Navigator.pop(context, null);
                },
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 24),
                child: Icon(Icons.search),
              )
            ],
          ),
          body: BlocBuilder<FilterCubit, FilterModel>(
            builder: (context, filter) {
              return BlocBuilder<CategoryListCubit, Result<CategoriModel>>(
                builder: (context, state) {
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Text("Categories",
                                textAlign: TextAlign.left,
                                style: context.theme.headlineSmall),
                          ),
                          SizedBox(
                            height: 200,
                            child: Wrap(
                              spacing: 4.0,
                              children: state.data!.data!.categories!.map(
                                (category) {
                                  return RawChip(
                                    onPressed: () {
                                      context.read<FilterCubit>().update((u) =>
                                          u.copyWith(categoryId: category.sId));
                                    },
                                    label: Text(
                                      "${category.name}",
                                      style: context.theme.bodyLarge!.copyWith(
                                          color: filter.categoryId == category.sId
                                              ? context.colorScheme.onPrimary
                                              : context.colorScheme.primary),
                                    ),
                                    backgroundColor:
                                        filter.categoryId == category.sId
                                            ? context.colorScheme.primary
                                            : context.colorScheme.onPrimary,
                                    shape: const StadiumBorder(
                                      side: BorderSide(
                                        color: Color(0xffCCCCCC),
                                      ),
                                    ),
                                  );
                                },
                              ).toList(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text(
                              "Price Range",
                              textAlign: TextAlign.left,
                              style: context.theme.titleLarge
                                  ?.copyWith(fontFamily: FontFamily.w700),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Builder(builder: (context) {
                            final currentMinValue = filter.min ?? 0;
                            final currentMaxValue = filter.max ?? 0;
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '\$${currentMinValue.round()} - \$${currentMaxValue.round()}',
                                  style: context.theme.bodyLarge?.copyWith(
                                    fontFamily: FontFamily.w400,
                                    fontSize: 18,
                                  ),
                                ),
                                RangeSlider(
                                  values: RangeValues(
                                      currentMinValue, currentMaxValue),
                                  min: 0,
                                  max: 1000,
                                  labels: RangeLabels(
                                    '\$${currentMinValue.round().toString()}',
                                    '\$${currentMaxValue.round().toString()}',
                                  ),
                                  onChanged: (RangeValues values) {
                                    context.read<FilterCubit>().update((up) =>
                                        up.copyWith(
                                            min: values.start, max: values.end));
                                  },
                                  activeColor: context.colorScheme.primary,
                                  inactiveColor: context.colorScheme.secondary,
                                ),
                              ],
                            );
                          }),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text(
                              "Sort By",
                              textAlign: TextAlign.left,
                              style: context.theme.titleLarge
                                  ?.copyWith(fontFamily: FontFamily.w700),
                            ),
                          ),
                          Wrap(
                            spacing: 4.0,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    filter.sort = "New Today";
                                  });
                                },
                                child: Chip(
                                  label: Text("New Today",
                                      style: context.theme.bodyMedium!.copyWith(
                                          color: filter.sort == "New Today"
                                              ? context.colorScheme.onPrimary
                                              : context.colorScheme.primary)),
                                  backgroundColor: filter.sort == "New Today"
                                      ? context.colorScheme.primary
                                      : context.colorScheme.onPrimary,
                                  shape: const StadiumBorder(
                                    side: BorderSide(
                                      color: Color(0xffCCCCCC),
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    filter.sort = "New This Week";
                                  });
                                },
                                child: Chip(
                                  label: Text(
                                    "New This Week",
                                    style: context.theme.bodyMedium!.copyWith(
                                        color: filter.sort == "New This Week"
                                            ? context.colorScheme.onPrimary
                                            : context.colorScheme.primary),
                                  ),
                                  backgroundColor: filter.sort == "New This Week"
                                      ? context.colorScheme.primary
                                      : context.colorScheme.onPrimary,
                                  shape: const StadiumBorder(
                                    side: BorderSide(
                                      color: Color(0xffCCCCCC),
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    filter.sort = "Top Seller";
                                  });
                                },
                                child: Chip(
                                  label: Text(
                                    "Top Seller",
                                    style: context.theme.bodyMedium!.copyWith(
                                        color: filter.sort == "Top Seller"
                                            ? context.colorScheme.onPrimary
                                            : context.colorScheme.primary),
                                  ),
                                  backgroundColor: filter.sort == "Top Seller"
                                      ? context.colorScheme.primary
                                      : context.colorScheme.onPrimary,
                                  shape: const StadiumBorder(
                                    side: BorderSide(
                                      color: Color(0xffCCCCCC),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // Clear Button
                              Flexible(
                                child: SizedBox(
                                  height: 50,
                                  width: 150,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          const Color.fromARGB(255, 0, 0, 0),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12), // Added vertical padding
                                    ),
                                    onPressed: () {
                                      context.read<FilterCubit>().clear();
                                      context
                                          .read<ProductCubit>()
                                          .getProductDetail();
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      "Clear",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: FontFamily.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                  width: 16), // Added spacing between the buttons
        
                              // Apply Now Button
                              Flexible(
                                child: SizedBox(
                                  height: 50,
                                  width: 150,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          const Color.fromARGB(255, 0, 0, 0),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12), // Added vertical padding
                                    ),
                                    onPressed: () {
                                      if (filter.isClear) {
                                        context
                                            .read<ProductCubit>()
                                            .getProductDetail();
                                      } else {
                                        context.read<ProductCubit>()
                                            .getfilteredProducts(filter);
                                      }
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      "Apply Now",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: FontFamily.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        );
      }
    );
  }
}
