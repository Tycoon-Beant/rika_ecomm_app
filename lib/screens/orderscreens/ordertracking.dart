import 'package:flutter/material.dart';
import 'package:rika_ecomm_app/config/common.dart';
import 'package:rika_ecomm_app/screens/orderscreens/trakingaddress.dart';



class Ordertracking extends StatefulWidget {
  const Ordertracking({super.key});

  @override
  State<Ordertracking> createState() => _OrdertrackingState();
}

class _OrdertrackingState extends State<Ordertracking> {
  double _currentSliderValue = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Image.asset("assets/images/arrowback.png")),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 300,
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        filled: true,
                        hintStyle: const TextStyle(color: Colors.grey),
                        hintText: "Search...",
                        fillColor: Colors.white70,
                        prefixIcon: const Icon(Icons.search)),
                  ),
                ),
                const SizedBox(width: 10),
                Image.asset("assets/images/screenericon.png")
              ],
            ),
            const SizedBox(height: 32),
            Card(
              elevation: 5,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset("assets/images/graphicon.png"),
                         SizedBox(width: 8),
                         Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "6556 23341 8090",
                                  style: TextStyle(
                                     fontFamily: FontFamily.w700,
                                      fontSize: 18),
                                ),
                                const SizedBox(width: 120),
                                Text(
                                  'Transit',
                                  style: TextStyle(
                                      fontSize: 16,
                                     fontFamily: FontFamily.w700),
                                ),
                              ],
                            ),
                            Text(
                              "Ena Express",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 84, 83, 83),
                                  fontSize: 14),
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                   
                    GestureDetector(
                      onDoubleTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Trakingaddress()));
                      },
                      child: Slider(
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
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              const Text(
                                '25 June 2021',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 14),
                              ),
                              Text(
                                'Sacramnto',
                                style: TextStyle(
                                    fontSize: 18,fontFamily: FontFamily.w700),
                              ),
                            ],
                          ),
                          const SizedBox(width: 120),
                          Column(
                            children: [
                              const Text(
                                '30 June 2021',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 14),
                              ),
                              Text(
                                'New York',
                                style: TextStyle(
                                    fontSize: 18,fontFamily: FontFamily.w700),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Tracking',
              style: TextStyle(fontSize: 24,fontFamily: FontFamily.w700),
            ),
            Card(
              color: Colors.white,
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Image.asset("assets/images/car.png"),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "US 2343445668",
                          style: TextStyle(
                              fontSize: 18,fontFamily: FontFamily.w700),
                        ),
                        const Text(
                          "Washington - Georgia",
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                    const SizedBox(width: 52),
                    const Text(
                      "Deliverd",
                      style: TextStyle(color: Colors.grey, fontSize: 20),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              color: Colors.white,
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Image.asset("assets/images/bike.png"),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "US 2343445652",
                          style: TextStyle(
                              fontSize: 18,fontFamily: FontFamily.w700),
                        ),
                        const Text(
                          "Washington - Llinois",
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                    const SizedBox(width: 60),
                    Text(
                      "Transit",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                         fontFamily: FontFamily.w700),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              color: Colors.white,
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Image.asset("assets/images/van.png"),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "US 2343445638",
                          style: TextStyle(
                              fontSize: 18,fontFamily: FontFamily.w700),
                        ),
                        const Text(
                          "Franklin - Alabama",
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                    const SizedBox(width: 56),
                    Text(
                      "Accepted",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                         fontFamily: FontFamily.w700),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
