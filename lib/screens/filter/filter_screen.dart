import 'package:flutter/material.dart';
import 'package:rika_ecomm_app/config/common.dart';

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
  List categoriesChip = [
    "Dresses",
    "Jackets",
    "Jeans",
    "Shoes",
    "Bags",
    "Cloths",
    "Leggings",
    "Shorts",
    "Tops",
    "Sneakers",
    "Coats",
    "Lingeries",
  ];
  String? selectedCategory;
  double _currentSliderValue = 20;
  String? sortby;

  @override
  Widget build(BuildContext context) {
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Categories",
                        textAlign: TextAlign.left,
                        style: context.theme.headlineSmall),
                    const SizedBox(height: 10),
                    SizedBox(
                        height: 145,
                        child: Wrap(
                          spacing: 2.0,
                          children: categoriesChip.map((category) {
                            return RawChip(
                                padding: EdgeInsets.all(2),
                                onPressed: () {
                                  setState(() {
                                    selectedCategory = category;
                                  });
                                },
                                label: Text(category,
                                    style: context.theme.bodyLarge!.copyWith(
                                        color: selectedCategory == category
                                            ? context.colorScheme.onPrimary
                                            : context.colorScheme.primary)),
                                backgroundColor: selectedCategory == category
                                    ? context.colorScheme.primary
                                    : context.colorScheme.onPrimary,
                                shape: const StadiumBorder(
                                    side:
                                        BorderSide(color: Color(0xffCCCCCC))));
                          }).toList(),
                        )),
                    const SizedBox(height: 10),
                    Text("Price Range",
                        textAlign: TextAlign.left,
                        style: context.theme.titleLarge
                            ?.copyWith(fontFamily: FontFamily.w700)),
                    const SizedBox(height: 10),
                    Slider(
                      padding: EdgeInsets.all(4),
                      value: _currentSliderValue,
                      max: 100,
                      divisions: 5,
                      label: _currentSliderValue.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _currentSliderValue = value;
                        });
                      },
                      activeColor: context.colorScheme.primary,
                      inactiveColor: context.colorScheme.secondary,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Sort By",
                      textAlign: TextAlign.left,
                      style: context.theme.titleLarge
                          ?.copyWith(fontFamily: FontFamily.w700),
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 4.0,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              sortby = "New Today";
                            });
                          },
                          child: Chip(
                            padding: EdgeInsets.all(2),
                            label: Text("New Today",
                                style: context.theme.bodyMedium!.copyWith(
                                    color: sortby == "New Today"
                                        ? context.colorScheme.onPrimary
                                        : context.colorScheme.primary)),
                            backgroundColor: sortby == "New Today"
                                ? context.colorScheme.primary
                                : context.colorScheme.onPrimary,
                            shape: const StadiumBorder(
                                side: BorderSide(color: Color(0xffCCCCCC))),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              sortby = "New This Week";
                            });
                          },
                          child: Chip(
                            padding: EdgeInsets.all(2),
                            label: Text(
                              "New This Week",
                              style: context.theme.bodyMedium!.copyWith(
                                  color: sortby == "New This Week"
                                      ? context.colorScheme.onPrimary
                                      : context.colorScheme.primary),
                            ),
                            backgroundColor: sortby == "New This Week"
                                ? context.colorScheme.primary
                                : context.colorScheme.onPrimary,
                            shape: const StadiumBorder(
                                side: BorderSide(color: Color(0xffCCCCCC))),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              sortby = "Top Seller";
                            });
                          },
                          child: Chip(
                            padding: EdgeInsets.all(2),
                            label: Text(
                              "Top Seller",
                              style: context.theme.bodyMedium!.copyWith(
                                  color: sortby == "Top Seller"
                                      ? context.colorScheme.onPrimary
                                      : context.colorScheme.primary),
                            ),
                            backgroundColor: sortby == "Top Seller"
                                ? context.colorScheme.primary
                                : context.colorScheme.onPrimary,
                            shape: const StadiumBorder(
                                side: BorderSide(color: Color(0xffCCCCCC))),
                          ),
                        ),
                      ],
                    ),
                  ]),
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(MediaQuery.of(context).size.width, 50),
                  backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return SuccesfullAlert();
                    },
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(100, 10, 100, 10),
                  child: Text(
                    "Apply Now",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: FontFamily.w700,
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class SuccesfullAlert extends StatelessWidget {
  const SuccesfullAlert({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: Colors.white,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset("assets/images/catsuc.png"),
            Text(
              "Successfull",
              style: TextStyle(fontSize: 30, fontFamily: FontFamily.w700),
            ),
            Text(
              "You have successfully your shopping cart list!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                ),
                onPressed: () {},
                child: Text(
                  "Checkout",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: FontFamily.w700),
                ))
          ],
        ));
  }
}
