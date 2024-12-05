import 'package:flutter/material.dart';
import 'package:rika_ecomm_app/config/common.dart';

class Notificationscreen extends StatefulWidget {
  const Notificationscreen({super.key});

  @override
  State<Notificationscreen> createState() => _NotificationscreenState();
}

class _NotificationscreenState extends State<Notificationscreen> {
  List img = [
    "assets/images/3x/notifiimg.png",
    "assets/images/3x/notifiimg1.png",
    "assets/images/3x/notifiimg2.png",
    "assets/images/3x/notifiimg3.png",
    "assets/images/3x/notifiimg.png",
    "assets/images/3x/notifiimg1.png",
    "assets/images/3x/notifiimg2.png",
    "assets/images/3x/notifiimg3.png",
  ];
  List<String> names = [
    "Kritine Jones ",
    "Kay Hicks ",
    "Cheryl Moretti ",
    "Jhone Stuart ",
    "Kritine Jones ",
    "Kay Hicks ",
    "Cheryl Moretti ",
    "Jhone Stuart "
  ];
  List<String> desc = [
    "  It is a long established fact that a reader will be distracted by the readable content of a page.",
    "  There are many variations of passages of Lorem Ipsum available.",
    "  If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing.",
    "  If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing.",
    "  It is a long established fact that a reader will be distracted by the readable content of a page.",
    "  There are many variations of passages of Lorem Ipsum available.",
    "  If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing.",
    "  If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing."
  ];
  List time = [
    "2 hours ago",
    "2 hours ago",
    "6 hours ago",
    "1 day ago",
    "2 hours ago",
    "2 hours ago",
    "6 hours ago",
    "1 day ago"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        leading: Image.asset("assets/images/arrowback.png"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: Offset(3, 2), // changes position of shadow
                    ),
                  ],
                ),
                child: Image.asset("assets/images/more.png")),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Notification',
            style: context.theme.headlineSmall
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: names.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(          
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 50,
                          child: CircleAvatar(
                              radius: 32, child: Image.asset(img[index])),
                        ),
                        const SizedBox(width: 8),
                        SizedBox(
                          width: 300,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                  text: TextSpan(
                                      text: names[index],
                                      style: context.theme.titleSmall,
                                      children: [
                                    TextSpan(
                                        text: desc[index],
                                        style: context.theme.bodySmall!.copyWith(color: Colors.grey))
                                  ])),
                                  const SizedBox(height: 8),
                                  Text(time[index],style:TextStyle(color: Colors.grey,),),
                            ],
                          ),
                        )
                      ],
                    ),
                    
                     SizedBox(height: 10),
                    Container(
                      height: 1,
                      color:  Colors.grey.shade300,
                      width: 400,
                    ),
                    const SizedBox(height: 10),
                  ],
                );
              },
            ),
          )
        ]),
      ),
    );
  }
}
