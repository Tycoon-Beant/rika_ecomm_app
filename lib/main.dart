import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:rika_ecomm_app/di/service_locator.dart';
import 'package:rika_ecomm_app/routes/routes.dart';
import 'package:rika_ecomm_app/screens/botton_nav_bar/bottom_nav_bar.dart';
import 'package:rika_ecomm_app/screens/cart/cubit/cart_cubit.dart';
import 'package:rika_ecomm_app/screens/cart/cubit/cart_list_cubit.dart';
import 'package:rika_ecomm_app/screens/category_and_product/categorie_screen.dart';
import 'package:rika_ecomm_app/screens/category_and_product/cubit/category_list_cubit.dart';
import 'package:rika_ecomm_app/screens/category_and_product/cubit/product_cubit.dart';
import 'package:rika_ecomm_app/screens/coupon/cubit/apply_coupon_cubit.dart';
import 'package:rika_ecomm_app/screens/coupon/cubit/coupon_list_cubit.dart';
import 'package:rika_ecomm_app/screens/home_screen/cubit/home_screen_products_cubit.dart';
import 'package:rika_ecomm_app/screens/profile_next_screens/cubit/favorite_cubit.dart';

import 'package:rika_ecomm_app/theme/app_theme.dart';
import 'package:rika_ecomm_app/theme/cubit/theme_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubit()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final routes = getIt<Routes>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            builder: (context, child) {
              final mediaQueryData = MediaQuery.of(context);
              return MediaQuery(
                data: mediaQueryData.copyWith(
                    textScaler: const TextScaler.linear(1.0)),
                child: child!,
              );
            },
            theme: AppTheme().lightTheme,
            darkTheme: AppTheme().darkTheme,
            themeMode: state,
            routes: routes.routes,
            onGenerateRoute: (RouteSettings settings) {
              switch (settings.name) {
                case "/categoryListScreen":
                  return MaterialPageRoute(
                    builder: (context) => CategoriScreen(),
                  );
                case "/bottomNavbar":
                  return MaterialPageRoute(
                    builder: (context) => MultiBlocProvider(
                      providers: [
                        BlocProvider(
                            create: (context) => getIt<CategoryListCubit>()),
                        BlocProvider(
                            create: (context) =>
                                getIt<HomeScreenProductsCubit>()),
                        BlocProvider(
                            create: (context) => getIt<FavoritesCubit>()),
                        BlocProvider(create: (context) => getIt<CartCubit>()),
                        BlocProvider(
                            create: (context) => getIt<CartListCubit>()),
                        BlocProvider(
                            create: (context) => getIt<CouponListCubit>()),
                        BlocProvider(
                            create: (context) => getIt<ApplyCouponCubit>()),
                            BlocProvider(
                            create: (context) => getIt<ProductCubit>()),
                      ],
                      child: PresistentBottomBar(),
                    ),
                  );
              }
              return null;
            },
          );
        },
      ),
    );
  }
}
