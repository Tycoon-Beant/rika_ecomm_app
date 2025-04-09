import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:rika_ecomm_app/di/service_locator.dart';
import 'package:rika_ecomm_app/screens/auth/cubit/login_cubit/login_cubit.dart';
import 'package:rika_ecomm_app/screens/auth/login_screen.dart';
import 'package:rika_ecomm_app/screens/botton_nav_bar/bottom_nav_bar.dart';
import 'package:rika_ecomm_app/screens/cart/cubit/cart_cubit.dart';
import 'package:rika_ecomm_app/screens/cart/cubit/cart_list_cubit.dart';
import 'package:rika_ecomm_app/screens/cart/service/cart_services.dart';
import 'package:rika_ecomm_app/screens/category_and_product/categorie_screen.dart';

import 'package:rika_ecomm_app/screens/category_and_product/cubit/category_list_cubit.dart';
import 'package:rika_ecomm_app/screens/category_and_product/cubit/product_cubit.dart';
import 'package:rika_ecomm_app/screens/category_and_product/products_screen.dart';
import 'package:rika_ecomm_app/screens/category_and_product/service/category_and_product_services.dart';
import 'package:rika_ecomm_app/screens/coupon/cubit/apply_coupon_cubit.dart';
import 'package:rika_ecomm_app/screens/coupon/cubit/coupon_list_cubit.dart';
import 'package:rika_ecomm_app/screens/home_screen/cubit/home_screen_products_cubit.dart';
import 'package:rika_ecomm_app/screens/home_screen/home_screen.dart';
import 'package:rika_ecomm_app/screens/home_screen/service/home_screen_products_service.dart';
import 'package:rika_ecomm_app/screens/profile_next_screens/cubit/favorite_cubit.dart';
import 'package:rika_ecomm_app/screens/profile_next_screens/cubit/product_by_id_cubit.dart';
import 'package:rika_ecomm_app/screens/splash/splash_screen.dart';

class Routes {
  Map<String, Widget Function(BuildContext)> routes = {
    "/": (context) => Splashscreen(),
    "/categoryListScreen": (context) => CategoriScreen(),
  };

  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/login":
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => getIt<LoginCubit>(),
                  child: Login(),
                ));
      case "/homeScreen":
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case "/categoryListScreen":
        return MaterialPageRoute(
          builder: (context) => CategoriScreen(),
        );

      case "/productScreen":
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<ProductCubit>(),
            child: ProductScreen(),
          ),
        );
      case "/bottomNavbar":
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => getIt<CategoryListCubit>()),
              BlocProvider(
                  create: (context) => getIt<HomeScreenProductsCubit>()),
              BlocProvider(create: (context) => getIt<CartCubit>()),
              BlocProvider(create: (context) => getIt<CartListCubit>()),
              BlocProvider(create: (context) => getIt<ApplyCouponCubit>()),
              BlocProvider(create: (context) => getIt<CouponListCubit>()),
              BlocProvider(create: (context) => getIt<FavoritesCubit>()),
            ],
            child: PresistentBottomBar(),
          ),
        );
    }
    return null;
  }
}
