import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:rika_ecomm_app/theme/app_theme.dart';
import 'package:rika_ecomm_app/screens/address_screen/cubit/address_cubit.dart';
import 'package:rika_ecomm_app/screens/address_screen/cubit/address_list_cubit.dart';
import 'package:rika_ecomm_app/screens/cart/cubit/cart_cubit.dart';
import 'package:rika_ecomm_app/screens/cart/cubit/cart_list_cubit.dart';
import 'package:rika_ecomm_app/screens/category_and_product/cubit/category_list_cubit.dart';
import 'package:rika_ecomm_app/screens/profile_next_screens/cubit/favorite_cubit.dart';
import 'package:rika_ecomm_app/screens/profile_next_screens/cubit/my_profile_list_cubit.dart';
import 'package:rika_ecomm_app/screens/profile_next_screens/cubit/product_by_id_cubit.dart';
import 'package:rika_ecomm_app/screens/profile_next_screens/cubit/profile_cubit.dart';
import 'package:rika_ecomm_app/screens/order_screens/cubit/order_address_cubit/get_order_address_cubit.dart';
import 'package:rika_ecomm_app/screens/order_screens/cubit/placed_order_cubit/post_placed_order_cubit.dart';
import 'package:rika_ecomm_app/screens/order_screens/cubit/placed_order_cubit/get_placed_order_id_cubit.dart';
import 'package:rika_ecomm_app/screens/category_and_product/cubit/product_cubit.dart';
import 'package:rika_ecomm_app/screens/address_screen/services/address_services.dart';
import 'package:rika_ecomm_app/screens/cart/service/cart_services.dart';
import 'package:rika_ecomm_app/screens/category_and_product/service/category_and_product_services.dart';
import 'package:rika_ecomm_app/screens/coupon/service/coupons_services.dart';
import 'package:rika_ecomm_app/screens/splash/splash_screen.dart';
import 'package:rika_ecomm_app/services/local_storage_service.dart';
import 'package:rika_ecomm_app/screens/auth/service/login_services.dart';
import 'package:rika_ecomm_app/screens/order_screens/service/get_order_addressId_services.dart';
import 'package:rika_ecomm_app/screens/order_screens/service/get_order_by_id_services.dart';
import 'package:rika_ecomm_app/screens/order_screens/service/placed_order_services.dart';
import 'package:rika_ecomm_app/theme/cubit/theme_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/profile_next_screens/service/my_profile_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => LocalStorageService(prefs)),
        RepositoryProvider(create: (context) => CartServices()),
        RepositoryProvider(
            create: (context) =>
                LoginServices(context.read<LocalStorageService>())),
        RepositoryProvider(create: (context) => MyProfileServices()),
        RepositoryProvider(create: (context) => CouponsServices()),
        RepositoryProvider(create: (context) => AddressServices()),
        RepositoryProvider(create: (context) => GetOrderAddressIdService()),
        RepositoryProvider(create: (context) => PlacedOrderServices()),
        RepositoryProvider(create: (context) => GetOrderByIdServices()),
        RepositoryProvider(create: (context) => CategoryAndProductServices()),
        // RepositoryProvider(create: (context) => ProductListRepository(productService: context.read())),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
          create: (context) => CartCubit(context.read<CartServices>()),
        ),
          BlocProvider(
              create: (context) => CartListCubit(context.read<CartServices>())),
          BlocProvider(
              create: (context) => CategoryListCubit(
                  context.read<CategoryAndProductServices>())),
          BlocProvider(
              create: (context) =>
                  ProductCubit(context.read<CategoryAndProductServices>())),
          BlocProvider(
              create: (context) =>
                  MyProfileListCubit(context.read<MyProfileServices>())),
          BlocProvider(
              create: (context) =>
                  ProfileCubit(context.read<MyProfileServices>())),
          BlocProvider(
              create: (context) =>
                  AddressListCubit(context.read<AddressServices>())),
          BlocProvider(
              create: (context) => AddressCubit(context.read<AddressServices>(),
                  context.read<LocalStorageService>())),
          BlocProvider(
              create: (context) => GetOrderAddressCubit(
                  context.read<GetOrderAddressIdService>())),
          BlocProvider(
              create: (context) =>
                  PostPlacedOrderCubit(context.read<PlacedOrderServices>())),
          BlocProvider(
              create: (context) =>
                  GetPlacedOrderIdCubit(context.read<GetOrderByIdServices>())),
          BlocProvider(
              create: (context) =>
                  FavoritesCubit(context.read<LocalStorageService>())),
          BlocProvider(
            create: (context) =>
                ProductByIdCubit(context.read<CategoryAndProductServices>()),
          ),
          BlocProvider(create: (context) => ThemeCubit())
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
            home: Splashscreen(),
          );
        },
      ),
    );
  }
}

class LocalStorage {
  // static const _token = "token";

  // final SharedPreferences _sharedPreferences;

  // LocalStorage(this._sharedPreferences);

  // Future<void> saveToken(String token) async {
  //   _sharedPreferences.setString(_token, token);
  // }

  // String? token() {
  //   return _sharedPreferences.getString(_token);
  // }
}
