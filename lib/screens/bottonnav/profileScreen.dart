import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rika_ecomm_app/config/common.dart';
import 'package:rika_ecomm_app/cubits/login_cubit/login_cubit.dart';
import 'package:rika_ecomm_app/cubits/my_profile_cubit/my_profile_list_cubit.dart';
import 'package:rika_ecomm_app/model/my_profile_model.dart';
import 'package:rika_ecomm_app/screens/login.dart';
import 'package:rika_ecomm_app/screens/orderscreens/orderdetails.dart';
import 'package:rika_ecomm_app/screens/profilenextscreens/payment_method_screen.dart';
import 'package:rika_ecomm_app/screens/profilenextscreens/myorder.dart';
import 'package:rika_ecomm_app/screens/profilenextscreens/profiledetails.dart';
import 'package:rika_ecomm_app/screens/profilenextscreens/setting._screen.dart';
import 'package:rika_ecomm_app/screens/profilenextscreens/wishlist_screen.dart';
import 'package:rika_ecomm_app/services/local_storage_service.dart';
import 'package:rika_ecomm_app/services/login_services.dart';

import '../../model/result.dart';

class Profilescreen extends StatefulWidget {
  const Profilescreen({super.key});

  @override
  State<Profilescreen> createState() => _ProfilescreenState();
}

class _ProfilescreenState extends State<Profilescreen> {
  final List<Map<String, dynamic>> profile = [
    {
      "icon": "assets/images/3x/profiledetail.png",
      "title": "Profile Details",
      "page": ProfileDetails(),
    },
    {
      "icon": "assets/images/3x/myorder.png",
      "title": "My Order",
      "page": Myorder(),
    },
    {
      "icon": "assets/images/3x/myfav.png",
      "title": "My Favorite",
      "page": WishlistScreen(),
    },
    {
      "icon": "assets/images/3x/shippingadd.png",
      "title": "Shipping Address",
      "page": Orderdetails(),
    },
    {
      "icon": "assets/images/3x/mycard.png",
      "title": "My Card",
      "page": PaymentMethodScreen(),
    },
    {
      "icon": "assets/images/3x/mysettiing.png",
      "title": "Settings",
      "page": SettingScreen(),
    }
  ];

  final List<Map<String, dynamic>> faq = [
    {
      "icon": "assets/images/3x/faq.png",
      "title": "FAQ",
      "page": Myorder(),
    },
    {
      "icon": "assets/images/3x/privacy.png",
      "title": "Privacy Policy",
      "page": Myorder(),
    },
    {
      "icon": "assets/images/3x/community.png",
      "title": "Community",
      "page": Myorder(),
    }
  ];

  @override
  Widget build(BuildContext context) {
    final profileState = context.watch<MyProfileListCubit>();
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        scrolledUnderElevation: 0.1,
        surfaceTintColor: Colors.white,
        // leading:
        //     GestureDetector(child: Image.asset("assets/images/arrowback.png")),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SettingScreen())),
              child: Image.asset(
                "assets/images/settings.png",
                scale: 0.7,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Card(
                color: Colors.white,
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Image.asset("assets/images/3x/profileimg.png"),
                      const SizedBox(width: 10),
                      BlocBuilder<MyProfileListCubit, Result<MyProfile>>(
                        builder: (context, state) {
                          return state.when(
                            onData: (profile) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      profile!.firstName! +
                                          " " +
                                          profileState.state.data!.lastName!,
                                      style: context.theme.titleMedium),
                                  Text(
                                    'rikafashionshop@gmail.com',
                                    style: context.theme.titleSmall!
                                        .copyWith(color: Colors.grey),
                                  ),
                                ],
                              );
                            },
                            onLoading: () {
                              return Center(
                                child: CircularProgressIndicator(
                                  color: Colors.black,
                                ),
                              );
                            },
                            onError: (Object? e) {
                              return Center(
                                child: Text(e.toString()),
                              );
                            },
                          );
                        },
                      )
                    ],
                  ),
                ),
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
                  child: Wrap(
                    runSpacing: 10,
                    children: [
                      ...profile.map((e) => ProfileItem(
                          title: e["title"], icon: e["icon"], page: e["page"])),
                    ],
                  ),
                ),
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
                  child: Wrap(
                    children: [
                      ...faq.map((e) => ProfileItem(
                          title: e["title"], icon: e["icon"], page: e["page"])),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {
                  context.read<LocalStorageService>().clearSession();
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => BlocProvider(
                                create: (context) => LoginCubit(context.read<LoginServices>()),
                                child: Login(),
                              )),
                      (route) => false);
                },
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
                      Text('Logout',
                          style: context.theme.titleMedium!
                              .copyWith(color: Colors.white)),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileItem extends StatelessWidget {
  final String title;
  final String icon;
  final Widget page;

  const ProfileItem(
      {super.key, required this.title, required this.icon, required this.page});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => page));
      },
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(icon),
              const SizedBox(width: 8),
              SizedBox(
                  width: 200,
                  child: Text(
                    title,
                    style: context.theme.bodyLarge!
                        .copyWith(fontFamily: FontFamily.w700),
                  )),
              const SizedBox(width: 20),
              SizedBox(
                width: 20,
                child: Icon(Icons.arrow_forward_ios),
              ),
            ],
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
