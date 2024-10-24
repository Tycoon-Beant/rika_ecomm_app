import 'package:flutter/material.dart';
import 'package:rika_ecomm_app/config/common.dart';
import 'package:timeline_tile/timeline_tile.dart';

class Trakingaddress extends StatefulWidget {
  const Trakingaddress({super.key});

  @override
  State<Trakingaddress> createState() => _TrakingaddressState();
}

class _TrakingaddressState extends State<Trakingaddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset("assets/images/3x/arrowback.png"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'US 2343445668',
              style: TextStyle(fontSize: 24, fontFamily: FontFamily.w700),
            ),
            Text(
              'Washington - Georgia',
              style: TextStyle(color: Colors.grey, fontSize: 18),
            ),
            const SizedBox(height: 20),
            Image.asset(
              "assets/images/3x/map.png",
              width: 400,
              fit: BoxFit.fill,
            ),
            SizedBox(height: 20),
            Text(
              'Collection Point',
              style: TextStyle(fontSize: 22, fontFamily: FontFamily.w400),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '10:00-11:00 - 25 June,2021',
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                    Text(
                      '3512 Pearl Street, California,US',
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                  ],
                ),
                const SizedBox(width: 80),
                Image.asset("assets/images/maparrow.png")
              ],
            ),
            const SizedBox(height: 10),
            Container(
              height: 2,
              width: 400,
              color: const Color.fromARGB(255, 210, 209, 209),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'You can change pick-up time for',
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                    Text(
                      'your order by 10:00, 24 June',
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                  ],
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: Text(
                    'Change',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'History',
              style: TextStyle(fontFamily: FontFamily.w400, fontSize: 22),
            ),
          TimelineTile(
              alignment: TimelineAlign.manual,
              lineXY: 0.2,
              isFirst: true,
              indicatorStyle: IndicatorStyle(
                width: 10,
                color: Colors.black,
              ),
              beforeLineStyle: LineStyle(
                color: Colors.black,
                thickness: 2,
              ),
              afterLineStyle: LineStyle(
                color: Colors.black,
                thickness: 2,
              ),
              startChild: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '26 June ',
                      style: TextStyle(fontSize: 18, fontFamily: FontFamily.w700),
                    ),
                    Text(
                      '11:00',
                      style: TextStyle(fontSize: 18,color: Colors.grey),
                    ),
                  ],
                ),
              ),
              endChild: Padding(
                padding: const EdgeInsets.only(top: 20,bottom: 10,left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Package have been received",
                      style:
                          TextStyle(fontFamily: FontFamily.w700, fontSize: 18),
                    ),
                    
                    Text(
                      "Washington - Georgia",
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            TimelineTile(
              alignment: TimelineAlign.manual,
              lineXY: 0.2,
              
              indicatorStyle: IndicatorStyle(
                width: 10,
                color: Colors.black,
              ),
              beforeLineStyle: LineStyle(
                color: Colors.black,
                thickness: 2,
              ),
              afterLineStyle: LineStyle(
                color: Colors.black,
                thickness: 2,
              ),
              startChild: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '25 June ',
                      style: TextStyle(fontSize: 18, fontFamily: FontFamily.w700),
                    ),
                    Text(
                      '20:30',
                      style: TextStyle(fontSize: 18,color: Colors.grey),
                    ),
                  ],
                ),
              ),
              endChild: Padding(
                padding: const EdgeInsets.only(top: 20,bottom: 10,left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Arrived at destination area",
                      style:
                          TextStyle(fontFamily: FontFamily.w700, fontSize: 18),
                    ),
                    
                    Text(
                      "End of tracking delivery tomorrow",
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            TimelineTile(
              alignment: TimelineAlign.manual,
              lineXY: 0.2,
              
              indicatorStyle: IndicatorStyle(
                width: 10,
                color: Colors.black,
              ),
              beforeLineStyle: LineStyle(
                color: Colors.black,
                thickness: 2,
              ),
              afterLineStyle: LineStyle(
                color: Colors.black,
                thickness: 2,
              ),
              startChild: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '24 June ',
                      style: TextStyle(fontSize: 18, fontFamily: FontFamily.w700),
                    ),
                    Text(
                      '09:45',
                      style: TextStyle(fontSize: 18,color: Colors.grey),
                    ),
                  ],
                ),
              ),
              endChild: Padding(
                padding: const EdgeInsets.only(top: 20,bottom: 10,left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Accepted by GHL",
                      style:
                          TextStyle(fontFamily: FontFamily.w700, fontSize: 18),
                    ),
                    
                    Text(
                      "Washington - Llinois",
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            TimelineTile(
              alignment: TimelineAlign.manual,
              lineXY: 0.2,
              isLast: true,
              indicatorStyle: IndicatorStyle(
                width: 10,
                color: Colors.black,
              ),
              beforeLineStyle: LineStyle(
                color: Colors.black,
                thickness: 2,
              ),
              afterLineStyle: LineStyle(
                color: Colors.black,
                thickness: 2,
              ),
              startChild: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '22 June ',
                      style: TextStyle(fontSize: 18, fontFamily: FontFamily.w700),
                    ),
                    Text(
                      '13:05',
                      style: TextStyle(fontSize: 18,color: Colors.grey),
                    ),
                  ],
                ),
              ),
              endChild: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Arrived at destination",
                      style:
                          TextStyle(fontFamily: FontFamily.w700, fontSize: 14),
                    ),
                    
                    Text(
                      "Washington - Llinois",
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
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
