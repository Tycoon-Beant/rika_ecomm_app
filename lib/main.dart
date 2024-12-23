import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:rika_ecomm_app/screens/addressScreen/cubit/address_cubit.dart';
import 'package:rika_ecomm_app/screens/addressScreen/cubit/address_list_cubit.dart';
import 'package:rika_ecomm_app/screens/bottonnav/bottom_nav_bar.dart';
import 'package:rika_ecomm_app/screens/cart/cubit/cart_cubit.dart';
import 'package:rika_ecomm_app/screens/cart/cubit/cart_list_cubit.dart';
import 'package:rika_ecomm_app/config/common.dart';
import 'package:rika_ecomm_app/screens/categorys/cubit/category_list_cubit.dart';
import 'package:rika_ecomm_app/screens/profilenextscreens/cubit/my_profile_list_cubit.dart';
import 'package:rika_ecomm_app/screens/profilenextscreens/cubit/profile_cubit.dart';
import 'package:rika_ecomm_app/screens/orderscreens/cubit/order_address_cubit/order_address_cubit.dart';
import 'package:rika_ecomm_app/screens/orderscreens/cubit/placed_order_cubit/place_order_list_cubit.dart';
import 'package:rika_ecomm_app/screens/orderscreens/cubit/placed_order_cubit/placed_order_cubit.dart';
import 'package:rika_ecomm_app/screens/orderscreens/cubit/placed_order_cubit/placed_order_id_cubit.dart';
import 'package:rika_ecomm_app/screens/categorys/cubit/product_cubit.dart';
import 'package:rika_ecomm_app/screens/coupon/cubit/apply_coupon_cubit.dart';
import 'package:rika_ecomm_app/screens/addressScreen/services/address_services.dart';
import 'package:rika_ecomm_app/screens/cart/service/cart_services.dart';
import 'package:rika_ecomm_app/screens/categorys/service/category_services.dart';
import 'package:rika_ecomm_app/screens/coupon/service/coupons_services.dart';
import 'package:rika_ecomm_app/screens/splash/splash_screen.dart';
import 'package:rika_ecomm_app/services/local_storage_service.dart';
import 'package:rika_ecomm_app/screens/auth/service/login_services.dart';
import 'package:rika_ecomm_app/screens/orderscreens/service/order_address_services.dart';
import 'package:rika_ecomm_app/screens/orderscreens/service/order_by_id_services.dart';
import 'package:rika_ecomm_app/screens/orderscreens/service/placed_order_services.dart';
import 'package:rika_ecomm_app/social/post_cubit/post_cubit.dart';
import 'package:rika_ecomm_app/social/post_service/add_post_service.dart';
import 'package:rika_ecomm_app/social/post_cubit/all_post_list_cubit.dart';
import 'package:rika_ecomm_app/social/post_service/all_post_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/profilenextscreens/service/my_profile_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => LocalStorageService(prefs)),
        RepositoryProvider(create: (context) => CartServices(context.read<LocalStorageService>())),
        RepositoryProvider(create: (context) => LoginServices(context.read<LocalStorageService>())),
        RepositoryProvider(create: (context) => MyProfileServices(context.read<LocalStorageService>())),
        RepositoryProvider(create: (context) => CouponsServices(context.read<LocalStorageService>())),
        RepositoryProvider(create: (context) => AddressServices(context.read<LocalStorageService>())),
        RepositoryProvider(create: (context) => OrderAddressServices(context.read<LocalStorageService>())),
        RepositoryProvider(create: (context) => PlacedOrderServices(context.read<LocalStorageService>())),
        RepositoryProvider(create: (context) => OrderByIdServices(context.read<LocalStorageService>())),
        RepositoryProvider(create: (context) => CategoryServices(context.read<LocalStorageService>())),
        RepositoryProvider(create: (context) => AllPostService(context.read<LocalStorageService>())),
        RepositoryProvider(create: (context) => AddPostService(context.read<LocalStorageService>()))
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ApplyCouponCubit(context.read<CouponsServices>())),
          BlocProvider(create: (context) => CartCubit(context.read<CartServices>())),
          BlocProvider(create: (context) => CartListCubit(context.read<CartServices>())),
          BlocProvider(create: (context) => CategoryListCubit(context.read<CategoryServices>())),
          BlocProvider(create: (context) => ProductCubit(context.read<CategoryServices>())),
          BlocProvider(create: (context) => MyProfileListCubit(context.read<MyProfileServices>())),
          BlocProvider(create: (context) => ProfileCubit(context.read<MyProfileServices>())),
          BlocProvider(create: (context) => AddressListCubit(context.read<AddressServices>())),
          BlocProvider(create: (context) => AddressCubit(context.read<AddressServices>(),context.read<LocalStorageService>())),
          BlocProvider(create: (context) => OrderAddressCubit(context.read<OrderAddressServices>())),
          BlocProvider(create: (context) => PlaceOrderListCubit(context.read<PlacedOrderServices>())),
          BlocProvider(create: (context) => PlacedOrderCubit(context.read<PlacedOrderServices>())),
          BlocProvider(create: (context) => PlacedOrderIdCubit(context.read<OrderByIdServices>())),
          BlocProvider(create: (context) => AllPostListCubit(context.read<AllPostService>())),
          BlocProvider(create: (context) => PostCubit(context.read<AddPostService>()))
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
      child: MaterialApp(
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
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          textTheme: Theme.of(context).textTheme.copyWith(
                headlineSmall: TextStyle(
                    fontSize: 28,
                    fontFamily: FontFamily.w700,
                    color: Colors.black),
                titleMedium:
                    TextStyle(fontFamily: FontFamily.w700, color: Colors.black),
              ),
          primaryColor: Colors.black,
          useMaterial3: true,
          fontFamily: "Mont_Blanc_Regular",
          appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
        ),
        home:  Splashscreen(),
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
