import 'package:flutter/material.dart';
import 'package:rika_ecomm_app/config/common.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}
List stars =[
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
  String? sortby ;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        scrolledUnderElevation: 0.0,
        notificationPredicate: (_) => false,
        elevation: 0,
        backgroundColor: Colors.white,
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
            child: Image.asset("assets/images/search.png"),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  "Categories",
                  textAlign: TextAlign.left,
                  style: context.theme.headlineSmall
                ),
              ),
              SizedBox(
                  height: 155,
                  child: Wrap(
                    spacing: 4.0,
                    children: categoriesChip.map((category) {
                      return RawChip(
                        onPressed: (){
                          setState(() {
                            selectedCategory = category;
                          });
                        },
                          label: Text(
                            category,
                            style:context.theme.bodyLarge!.copyWith(color: selectedCategory == category ?Colors.white:Colors.black)
                          ),
                          backgroundColor: selectedCategory == category?Colors.black: Colors.white,
                          shape: const StadiumBorder(
                              side: BorderSide(color: Color(0xffCCCCCC))));
                    }).toList(),
                  )),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  "Price Range",
                  textAlign: TextAlign.left,
                  style: context.theme.titleLarge?.copyWith(fontFamily: FontFamily.w700)
                ),
              ),
              const SizedBox(height: 10),
              Slider(
                value: _currentSliderValue,
                max: 100,
                divisions: 5,
                label: _currentSliderValue.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _currentSliderValue = value;
                  });
                },
                activeColor: Colors.black,
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  "Sort By",
                  textAlign: TextAlign.left,
                  style: context.theme.titleLarge?.copyWith(fontFamily: FontFamily.w700)
                ),
              ),
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
                      label: Text(
                        "New Today",
                        style: context.theme.bodyMedium!.copyWith(
                          color: sortby == "New Today"? Colors.white:null
                        )
                      ),
                      backgroundColor: sortby == "New Today"? Colors.black : Colors.white,
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
                      label: Text(
                        "New This Week",
                        style:context.theme.bodyMedium!.copyWith( color: sortby == "New This Week" ? Colors.white : null),
                           
                      ),
                      backgroundColor: sortby == "New This Week" ? Colors.black : Colors.white,
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
                      label: Text(
                        "Top Seller",
                        style: context.theme.bodyMedium!.copyWith( color: sortby == "Top Seller" ? Colors.white : null),
                      ),
                      backgroundColor: sortby == "Top Seller" ? Colors.black : Colors.white,
                      shape: const StadiumBorder(
                          side: BorderSide(color: Color(0xffCCCCCC))),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  "Rating",
                  textAlign: TextAlign.left,
                  style: context.theme.titleLarge?.copyWith(fontFamily: FontFamily.w700)
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: SizedBox(height: 150,
                  child: ListView.builder(
                    itemCount: stars.length,
                    itemBuilder: (BuildContext context, int index) {
                      final star = stars[index];
                      final isRated = selectedRating == star;
                      return Column(
                               children: [
                               Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            stars[index],
                            scale: 0.8,
                          ),
                          InkWell(
                            onTap: () {
                              if (selectedRating == star) {
                                        setState(() {
                                          selectedRating = null;
                                        });
                                      } else {
                                        setState(() {
                                          selectedRating = star;
                                        });
                                      }
                             
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: isRated ? Colors.black : Colors.grey),
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: isRated
                                    ? const Icon(
                                        Icons.check,
                                        size: 15.0,
                                        color: Colors.white,
                                      )
                                    : const Icon(
                                        Icons.check_box_outline_blank,
                                        size: 15.0,
                                        color: Colors.grey,
                                      ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                        ],
                      );
                      },
                  
                  ),
                )
              ),
              const SizedBox(height: 100),
              Center(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                    ),
                    // onPressed: () => Navigator.push(
                    //     context,
                    // MaterialPageRoute(
                    //     builder: (context) => const Succesfulscreen())),
                    onPressed: () {     
                      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
           backgroundColor: Colors.white,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset("assets/images/catsuc.png"),
                Text("Successfull" ,
                style: TextStyle(
                  fontSize: 30,fontFamily: FontFamily.w700
                ),),
                Text("You have successfully your shopping cart list!" ,textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,color: Colors.grey
                ),),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  onPressed: (){}, 
                  child: Text("Checkout" ,style: TextStyle(color: Colors.white,fontSize: 18,fontFamily: FontFamily.w700),))
            ],
            )
          );
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
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

