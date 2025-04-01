import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rika_ecomm_app/config/common.dart';
import 'package:rika_ecomm_app/screens/address_screen/address_screen.dart';
import 'package:rika_ecomm_app/screens/auth/cubit/login_cubit/login_cubit.dart';
import 'package:rika_ecomm_app/screens/auth/service/login_services.dart';
import 'package:rika_ecomm_app/screens/order_screens/myorder.dart';
import 'package:rika_ecomm_app/screens/profile_next_screens/cubit/my_profile_list_cubit.dart';
import 'package:rika_ecomm_app/screens/profile_next_screens/model/my_profile_model.dart';
import 'package:rika_ecomm_app/screens/profile_next_screens/payment_method_screen.dart';
import 'package:rika_ecomm_app/screens/profile_next_screens/profile_details_screen.dart';
import 'package:rika_ecomm_app/screens/profile_next_screens/setting_screen.dart';
import 'package:rika_ecomm_app/screens/profile_next_screens/favorite_screen.dart';
import 'package:rika_ecomm_app/screens/screen_not_working/community.dart';
import 'package:rika_ecomm_app/screens/screen_not_working/faq_screen.dart';
import 'package:rika_ecomm_app/screens/screen_not_working/privacy_prolicy.dart';
import 'package:rika_ecomm_app/screens/splash/splashscreentwo.dart';
import 'package:rika_ecomm_app/services/local_storage_service.dart';

import '../../../model/result.dart';

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
      "page": FavoriteScreen(),
    },
    {
      "icon": "assets/images/3x/shippingadd.png",
      "title": "Shipping Address",
      "page": AddressScreen(),
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
      "page": FaqScreen(),
    },
    {
      "icon": "assets/images/3x/privacy.png",
      "title": "Privacy Policy",
      "page": PrivacyProlicy(),
    },
    {
      "icon": "assets/images/3x/community.png",
      "title": "Community",
      "page": Community(),
    }
  ];

  @override
  Widget build(BuildContext context) {
    final coverImage =
        context.read<LocalStorageService>().getUser()?.avatar;
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        scrolledUnderElevation: 0.1,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SettingScreen())),
                child: Icon(Icons.settings)),
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                    // color: context.colorScheme.onSecondary,
                    border: Border.all(color: context.colorScheme.onSecondary),
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      coverImage?.localPath != null
                          ? SizedBox(
                            height: 80,
                            width: 80,
                            child: ClipRRect(
                               borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  coverImage?.localPath ?? '',fit: BoxFit.fill,
                                  errorBuilder: (context, error, stackTrace) =>
                                      Image.asset(
                                          "assets/images/3x/profileimg.png"),
                                ),
                              ),
                          )
                          : Image.asset("assets/images/3x/profileimg.png"),
                      const SizedBox(width: 10),
                      BlocBuilder<MyProfileListCubit, Result<MyProfile>>(
                        builder: (context, state) {
                          if (state.error != null) {
                            return Center(
                              child: Text("UnExpected Issue!!!"),
                            );
                          }
                          final currentUserEmail = context
                              .read<LocalStorageService>()
                              .getUser()
                              ?.email;
                          return state.when(
                            onData: (profile) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      "${profile!.firstName!}  ${profile.lastName!}",
                                      style: context.theme.titleMedium),
                                  Text(
                                    currentUserEmail ??
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
                        color: context.colorScheme.outline,
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
                        color: context.colorScheme.outline,
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
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {
                  context.read<LocalStorageService>().clearSession();
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => BlocProvider(
                                create: (context) =>
                                    LoginCubit(context.read<LoginServices>()),
                                child: SplashScreenTwo(),
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
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Logout',
                      ),
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
              Expanded(
                child: SizedBox(
                    child: Text(
                  title,
                  style: context.theme.bodyLarge!
                      .copyWith(fontFamily: FontFamily.w700),
                )),
              ),
              const SizedBox(width: 8),
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
