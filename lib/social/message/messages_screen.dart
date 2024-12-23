import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:rika_ecomm_app/config/common.dart';
import 'package:rika_ecomm_app/social/chatscreen/chat_screen.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

List profileimg = [
  "assets/social_media/profile1.png",
  "assets/social_media/profile2.png",
  "assets/social_media/person1.png",
  "assets/social_media/person2.png",
  "assets/social_media/person3.png",
  "assets/social_media/person4.png",
  "assets/social_media/profile1.png",
  "assets/social_media/profile2.png",
  "assets/social_media/person1.png",
  "assets/social_media/person2.png",
  "assets/social_media/person3.png",
  "assets/social_media/person4.png",
];
List name = [
  "Sansa Indira",
  "Samuel Lannister",
  "Michael Snow",
  "Samuel Seaworth",
  "Sandor Clegane",
  "Mike Renly",
  "Robb Jamie",
  "Sansa Indira",
  "Samuel Lannister",
  "Michael Snow",
  "Samuel Seaworth",
  "Sandor Clegane",
  "Mike Renly",
  "Robb Jamie",
];

List message = [
  "I'm at the office right now.",
  "It's pretty cheap I think and so do u",
  "I'm okay, how about you?",
  "Maybe I can help you tomorrow or i will inform you",
  "Yes of course, I like that very much!",
  "Can your friends do it tonight?",
  "I'm at the office right now.",
  "It's pretty cheap I think and so do u",
  "I'm okay, how about you?",
  "Maybe I can help you tomorrow or i will inform you",
  "Yes of course, I like that very much!",
  "Can your friends do it tonight?",
];

List msgCount = ["3", "1", "4", "2", "", "", "3", "1", "4", "2", "", ""];

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        title: Text(
          "Chats",
          style: context.theme.headlineMedium!
              .copyWith(fontFamily: FontFamily.w700),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(Icons.more_vert),
          )
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: profileimg.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      SwipeActionCell(
                        key: ObjectKey(profileimg[index]),
                        trailingActions: <SwipeAction>[
                          SwipeAction(
                              color: Colors.white,
                              icon: Icon(
                                Icons.delete_outline,
                                color: Colors.red,
                              ),
                              onTap: (CompletionHandler handler) async {
                                // profileimg.removeAt(index);
                                // setState(() {

                                // });

                                deleteSheet(context, index);
                              })
                        ],
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ChatScreen()));
                          },
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.grey,
                                foregroundColor: Color(0xff128C7E),
                                radius: 25,
                                backgroundImage: AssetImage(profileimg[index]),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(name[index],
                                        style: context.theme.titleMedium!
                                            .copyWith(
                                                fontFamily: FontFamily.w700)),
                                    Text(message[index],
                                        overflow: TextOverflow.ellipsis,
                                        style: context.theme.bodySmall!
                                            .copyWith(
                                                color: Colors.grey,
                                                fontFamily: FontFamily.w400))
                                  ],
                                ),
                              ),
                              const SizedBox(width: 20),
                              if (int.tryParse(msgCount[index]) != null)
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Center(
                                          child: Text(msgCount[index],
                                              style: TextStyle(
                                                  color: Colors.white))),
                                    ),
                                  ],
                                )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Future<dynamic> deleteSheet(BuildContext context, int index) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(20),
          height: 400,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.warning_amber_rounded,color: const Color.fromARGB(255, 137, 15, 6),size: 80,),
                Spacer(),
                Text(
                  "Delete Chat?",
                  style: context.theme.headlineSmall!.copyWith(
                    fontFamily: FontFamily.w800,
                    
                  ),
                ),
                Spacer(),
                const Text(
                  "All the messages will be deleted permanently and can't be restored, are you sure?",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),
                const Spacer(),
                
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    fixedSize: Size(MediaQuery.sizeOf(context).width, 50)
                  ),
                  onPressed: () {
                    setState(() {
                      profileimg.removeAt(index);
                      name.removeAt(index);
                      message.removeAt(index);
                      msgCount.removeAt(index);
                    });
                    Navigator.pop(context);
                  },
                  child:  Text("Delete",style: context.theme.titleMedium!.copyWith(color: Colors.white)),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
