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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'US 2343445668',
                style:  context.theme.headlineSmall
              ),
              Text(
                'Washington - Georgia',
                style:  context.theme.titleMedium!.copyWith(color: Colors.grey)
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
                style:  context.theme.titleLarge!.copyWith(fontFamily: FontFamily.w700)
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '10:00-11:00 - 25 June,2021',
                        style:  context.theme.titleSmall!.copyWith(color: Colors.grey)
                      ),
                      Text(
                        '3512 Pearl Street, California,US',
                        style: context.theme.titleSmall!.copyWith(color: Colors.grey)
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
                        style:  context.theme.titleSmall!.copyWith(color: Colors.grey)
                      ),
                      Text(
                        'your order by 10:00, 24 June',
                        style:  context.theme.titleSmall!.copyWith(color: Colors.grey)
                      ),
                    ],
                  ),
                  const SizedBox(width: 40),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: Text(
                      'Change',
                      style:  context.theme.titleSmall!.copyWith(color: Colors.white)
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Text(
                'History',
                style: context.theme.titleLarge!.copyWith(fontFamily: FontFamily.w700)
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
                        style: context.theme.titleMedium!.copyWith(fontFamily: FontFamily.w700)
                      ),
                      Text(
                        '11:00',
                        style: context.theme.titleSmall!.copyWith(color: Colors.grey)
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
                            context.theme.titleMedium!.copyWith(fontFamily: FontFamily.w700)
                      ),
                      
                      Text(
                        "Washington - Georgia",
                        style: context.theme.titleSmall!.copyWith(color: Colors.grey)
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
                        style: context.theme.titleMedium!.copyWith(fontFamily: FontFamily.w700)
                      ),
                      Text(
                        '20:30',
                        style: context.theme.titleSmall!.copyWith(color: Colors.grey),)
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
                           context.theme.titleMedium!.copyWith(fontFamily: FontFamily.w700)
                      ),
                      
                      Text(
                        "End of tracking delivery tomorrow",
                        style:context.theme.titleSmall!.copyWith(color: Colors.grey)
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
                        style:context.theme.titleMedium!.copyWith(fontFamily: FontFamily.w700)
                      ),
                      Text(
                        '09:45',
                        style:context.theme.titleSmall!.copyWith(color: Colors.grey)
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
                           context.theme.titleMedium!.copyWith(fontFamily: FontFamily.w700)
                      ),
                      
                      Text(
                        "Washington - Llinois",
                        style: context.theme.titleSmall!.copyWith(color: Colors.grey)
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
                        style:context.theme.titleMedium!.copyWith(fontFamily: FontFamily.w700)
                      ),
                      Text(
                        '13:05',
                        style:context.theme.titleSmall!.copyWith(color: Colors.grey)
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
                            context.theme.titleMedium!.copyWith(fontFamily: FontFamily.w700)
                      ),
                      
                      Text(
                        "Washington - Llinois",
                        style: context.theme.titleSmall!.copyWith(color: Colors.grey)
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
