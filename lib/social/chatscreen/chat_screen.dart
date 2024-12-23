import 'package:flutter/material.dart';
import 'package:rika_ecomm_app/config/common.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {


  final TextEditingController _messageController = TextEditingController();
List<Map<String,dynamic>> chatList = [];
  // Function to add a new message
  void _addMessage() {
    final String newMessage = _messageController.text.trim();

    if (newMessage.isNotEmpty) {
      setState(() {
        chatList.add({"user": "sender", "message": newMessage});
        _messageController.clear(); // Clear the text field
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                foregroundColor: Color(0xff128C7E),
                radius: 20,
                backgroundImage: AssetImage("assets/social_media/profile2.png"),
              ),
              const SizedBox(width: 10),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  "Michale Snow",
                  style: context.theme.titleMedium!.copyWith(fontFamily: FontFamily.w700),
                ),
                Text("@snowmichael09",
                    style: context.theme.bodyMedium!.copyWith(color: Colors.grey))
              ])
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            BuildChatBubble(chat: chatList.reversed.toList(),),
            const SizedBox(height: 10),
            TextFormField(
              controller: _messageController,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromARGB(255, 219, 217, 217),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none
                ),
                hintText: "Type message here!....",
                hintStyle: context.theme.bodySmall!.copyWith(color: Colors.grey),
                prefixIcon: Icon(Icons.emoji_emotions_outlined,color: Colors.black,),
                suffixIcon: IconButton(onPressed: _addMessage,
                icon: Icon(Icons.send_outlined,color: Colors.black,))
              ),
            )
          ],
        ),
      ),
    );
  }
}

 

// List<Map<String, dynamic>> chat = [
    // {
    //   "user": "sender",
    //   "message" : "Hi!"
    // }, 
    // {
    //   "user": "reciever",
    //   "message" : "Hey!"
    // }, 
    // {
    //   "user": "reciever",
    //   "message" : "What's up"
    // }, 
    // {
    //   "user": "sender",
    //   "message" : "nothing, just want to ask for hang out."
    // }, 
    // {
    //   "user": "reciever",
    //   "message" : "ok"
    // }, 
    // {
    //   "user": "sender",
    //   "message" : "Then  meet me at 7 , Hangries."
    // }, 
    // {
    //   "user": "reviever",
    //   "message" : "Done👍"
    // }, 
      
  // ];
 
class BuildChatBubble extends StatelessWidget {
  final List<Map<String,dynamic>> chat ;
  const BuildChatBubble({
    super.key,
     required this.chat
  });

  
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
            itemCount: chat.length,
            reverse: true,
            itemBuilder: (BuildContext context, int index) { 
              final String user = chat[index]["user"] as String;
              final String message = chat[index]["message"] as String;
              return Row(
                mainAxisAlignment: user == "sender" ? MainAxisAlignment.end : MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment:user == "sender"? CrossAxisAlignment.end : CrossAxisAlignment.start,
                    children: [
                      Text(
                    "$user: ",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.grey),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: user == "sender" ? Colors.black : const Color.fromARGB(255, 213, 212, 212),
                      borderRadius:user == "sender"? BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20), bottomRight: Radius.circular(40)) : BorderRadius.only(topRight: Radius.circular(20),bottomLeft: Radius.circular(40), bottomRight: Radius.circular(20))
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        message ,
                      
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color:user == "sender" ? Colors.white : Colors.black),
                      ),
                    ),
                  ),
                    ],
                  )
                  
                ],
              );
             }, separatorBuilder: (BuildContext context, int index) {  
              return const SizedBox(height: 8);
             },
            
          ),
    );
  }
}
