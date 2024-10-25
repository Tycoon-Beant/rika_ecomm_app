// import 'dart:convert';
// import 'dart:io';
// import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rika_ecomm_app/config/common.dart';
import 'package:rika_ecomm_app/screens/profilenextscreens/language.dart';
// import 'package:image_picker/image_picker.dart';

class ProfileDetails extends StatefulWidget {
  const ProfileDetails({super.key});

  @override
  State<ProfileDetails> createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails>
    with TickerProviderStateMixin {
  bool _male = false;
  bool _female = false;
  bool notificationOn = true;
  bool isDarkmode = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(height: 20),
            Center(
                child: Stack(children: [
              SizedBox(
                height: 120,
                width: 120,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(
                      height: 100,
                      width: 100,
                      child: Image.asset(
                        "assets/images/3x/profileimg.png",
                        fit: BoxFit.fill,
                      )),
                ),
              ),
              Positioned(
                  top: 64,
                  left: 64,
                  child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              height: 100,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      topLeft: Radius.circular(20))),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white,
                                          elevation: 0),
                                      child: Icon(
                                        Icons.camera,
                                        size: 40,
                                      ),
                                      onPressed: () {
                                        // chooseImage("camera");
                                      },
                                    ),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.white,
                                            elevation: 0),
                                        onPressed: () {
                                          // chooseImage("gallery");
                                        },
                                        child: Icon(
                                          Icons.image,
                                          size: 40,
                                        ))
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                color: const Color.fromARGB(255, 209, 208, 208),
                                blurRadius: 5,
                                offset: Offset(12, 10))
                          ]),
                          child: Image.asset(
                            "assets/images/edit.png",
                            fit: BoxFit.fill,
                          ))))
            ])),
            const SizedBox(height: 10),
            Center(
              child: Text(
                'Upload Image',
                style: context.theme.titleMedium,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  "Name ",
                  style:
                      context.theme.titleMedium!.copyWith(color: Colors.grey),
                ),
                const SizedBox(width: 40),
                SizedBox(
                  width: 240,
                  child: TextField(
                      decoration: InputDecoration(
                    hintText: "Enter your name",
                    hintStyle: TextStyle(
                      color: const Color.fromARGB(255, 191, 189, 189),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  )),
                )
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Text(
                  "Gender ",
                  style:
                      context.theme.titleMedium!.copyWith(color: Colors.grey),
                ),
                const SizedBox(width: 40),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _male = !_male;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: _male ? Colors.black : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black)),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: [
                          Icon(
                            _male
                                ? Icons.radio_button_checked
                                : Icons.circle_outlined,
                            color: _male ? Colors.white : Colors.black,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "Male",
                            style: context.theme.titleMedium!
                                .copyWith(color: _male ? Colors.white : Colors.black,),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _female = !_female;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: _female ? Colors.black : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black)),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: [
                          Icon(
                            _female
                                ? Icons.radio_button_checked
                                : Icons.circle_outlined,
                            color: _female ? Colors.white : Colors.black,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "Female",
                            style: context.theme.titleMedium!
                                .copyWith(color: _male ? Colors.white : Colors.black,),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  "Age ",
                  style: context.theme.titleMedium!.copyWith(color: Colors.grey),
                ),
                const SizedBox(width: 56),
                SizedBox(
                  width: 240,
                  child: TextField(
                      decoration: InputDecoration(
                    hintText: "Enter your age",
                    hintStyle: TextStyle(
                      color: const Color.fromARGB(255, 191, 189, 189),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  )),
                )
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  "Email ",
                  style: context.theme.titleMedium!.copyWith(color: Colors.grey),
                ),
                const SizedBox(width: 46),
                SizedBox(
                  width: 240,
                  child: TextField(
                      decoration: InputDecoration(
                    hintText: "Enter your age",
                    hintStyle: TextStyle(
                      color: const Color.fromARGB(255, 191, 189, 189),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  )),
                )
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'Settings',
              style: context.theme.titleLarge!.copyWith(fontFamily: FontFamily.w700),
            ),
            const SizedBox(height: 10),
            Container(
              height: 264,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Color.fromARGB(255, 173, 170, 170),
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset("assets/images/3x/language.png"),
                        const SizedBox(width: 8),
                        SizedBox(
                            width: 100,
                            child: Text(
                              "Language",
                              style: context.theme.titleMedium,
                            )),
                        const SizedBox(width: 48),
                        Text("English",
                            style: context.theme.titleMedium!.copyWith(color: const Color.fromARGB(255, 182, 181, 181)),),
                        const SizedBox(width: 20),
                        SizedBox(
                          width: 20,
                          child: IconButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => LanguageScreen()));
                              },
                              icon: Icon(Icons.arrow_forward_ios)),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Image.asset("assets/images/3x/notificationset.png"),
                        const SizedBox(width: 8),
                        SizedBox(
                            width: 200,
                            child: Text(
                              "Notification",
                              style: context.theme.titleMedium,
                            )),
                        const SizedBox(width: 20),
                        SizedBox(
                          
                          width: 20,
                          child: Switch(
                            value: notificationOn,
                            activeColor: Colors.black,
                            onChanged: (bool value) {
                              setState(() {
                                notificationOn = value;
                              });
                            },
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Image.asset("assets/images/3x/darkmode.png"),
                        const SizedBox(width: 8),
                        SizedBox(
                            width: 150,
                            child: Text(
                              "Dark mode",
                              style: context.theme.titleMedium,
                            )),
                        SizedBox(
                          width: 30,
                          child: Text(
                            isDarkmode ? "on" : "off",
                            textAlign: TextAlign.right,
                            style: TextStyle(fontSize: 18, color: Colors.grey),
                          ),
                        ),
                        const SizedBox(width: 40),
                        SizedBox(
                          width: 20,
                          child: Switch(
                            value: isDarkmode,
                            activeColor: Colors.black,
                            onChanged: (bool value) {
                              setState(() {
                                isDarkmode = value;
                              });
                            },
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Image.asset("assets/images/3x/helpcenter.png"),
                        const SizedBox(width: 8),
                        SizedBox(
                            width: 200,
                            child: Text(
                              "Help Center",
                              style: context.theme.titleMedium,
                            )),
                        const SizedBox(width: 20),
                        SizedBox(
                          width: 20,
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.arrow_forward_ios)),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Logout',
                      style: context.theme.titleMedium!.copyWith(color: Colors.white)
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
          ]),
        ),
      ),
    );
  }
}
