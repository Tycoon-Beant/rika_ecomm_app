import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rika_ecomm_app/config/common.dart';
import 'package:rika_ecomm_app/di/service_locator.dart';
import 'package:rika_ecomm_app/screens/botton_nav_bar/bottom_nav_bar.dart';
import 'package:rika_ecomm_app/screens/category_and_product/cubit/category_list_cubit.dart';
import 'package:rika_ecomm_app/screens/home_screen/cubit/home_screen_products_cubit.dart';
import 'package:rika_ecomm_app/screens/profile_next_screens/cubit/favorite_cubit.dart';

class Succesfulscreen extends StatefulWidget {
  const Succesfulscreen({super.key});

  @override
  State<Succesfulscreen> createState() => _SuccesfulscreenState();
}

class _SuccesfulscreenState extends State<Succesfulscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // SizedBox(height: 100,),
                    Center(child: Image.asset("assets/images/tikicon.png")),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Successful!",
                      style: context.theme.headlineSmall,
                    ),
                    Text(
                      "You have successfully registered in our app and start working in it.",
                      textAlign: TextAlign.center,
                      style: context.theme.titleSmall!
                          .copyWith(color: Colors.grey),
                    ),
                  ],
                )),
            Container(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(MediaQuery.sizeOf(context).width, 50),
                    backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                  ),
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MultiBlocProvider(
                                providers: [
                                  BlocProvider(
                                    create: (context) =>
                                        getIt<CategoryListCubit>(),
                                  ),
                                  BlocProvider(
                                    create: (context) => getIt<HomeScreenProductsCubit>(),
                                  ),
                                  BlocProvider(
                                    create: (context) => getIt<FavoritesCubit>(),
                                  ),
                                ],
                                child: PresistentBottomBar(),
                              ))),
                  child: Text(
                    "Start Shopping",
                    style: context.theme.titleMedium!
                        .copyWith(color: Colors.white),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
