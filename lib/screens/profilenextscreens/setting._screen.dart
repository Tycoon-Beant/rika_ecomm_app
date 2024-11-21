import 'package:flutter/material.dart';
import 'package:rika_ecomm_app/config/common.dart';
import 'package:rika_ecomm_app/screens/profilenextscreens/language.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> with TickerProviderStateMixin {
  
  bool notificationOn = true;
  bool isDarkmode = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Image.asset("assets/images/arrowback.png")),
        ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                'Settings',
                style: context.theme.headlineSmall!
                    .copyWith(fontFamily: FontFamily.w700),
              ),
              const SizedBox(height: 20),
              Container(
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
                          Text(
                            "English",
                            style: context.theme.titleMedium!.copyWith(
                                color: const Color.fromARGB(255, 182, 181, 181)),
                          ),
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
                      const SizedBox(height: 20),
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
                      const SizedBox(height: 20),
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
                      const SizedBox(height: 20),
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
                ],
              ),
      ),
    );
  }
}