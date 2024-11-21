import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rika_ecomm_app/cubits/cart_bloc_cubit/cart_cubit.dart';
import 'package:rika_ecomm_app/cubits/cart_bloc_cubit/cart_list_cubit.dart';
import 'package:rika_ecomm_app/config/common.dart';
import 'package:rika_ecomm_app/cubits/categotry_cubit/category_list_cubit.dart';
import 'package:rika_ecomm_app/cubits/my_profile_cubit/my_profile_list_cubit.dart';
import 'package:rika_ecomm_app/cubits/product_cubit/product_cubit.dart';
import 'package:rika_ecomm_app/cubits/coupon_cubit/apply_coupon_cubit.dart';
import 'package:rika_ecomm_app/screens/splash_screen.dart';
import 'package:rika_ecomm_app/services/cart_services.dart';
import 'package:rika_ecomm_app/services/local_storage_service.dart';
import 'package:rika_ecomm_app/services/login_services.dart';

void main() async {
  // final prefs = await SharedPreferences.getInstance();

  runApp(
    MultiProvider(
      providers: [
        Provider(create: (context) => LocalStorage()),
        // ChangeNotifierProvider(
        //   lazy: true,
        //   create: (context) => CategoryNotifier(),
        // ),
        // ChangeNotifierProvider(
        //   lazy: true,
        //   create: (context) => ProductNotifier(),
        // )
      ],
      child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(create: (context) => LocalStorageService()),
          RepositoryProvider(create: (context) => CartServices(context.read<LocalStorageService>())),
          RepositoryProvider(create: (context) => LoginServices(context.read<LocalStorageService>()))
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => ApplyCouponCubit()),
            BlocProvider(create: (context) => CartCubit(context.read<CartServices>())),
            BlocProvider(create: (context) => CartListCubit(context.read<CartServices>())),
            BlocProvider(create: (context) => CategoryListCubit()),
            BlocProvider(create: (context) => ProductCubit()),
            BlocProvider(create: (context) => MyProfileListCubit())
          ],
          child: const MyApp(),
        ),
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
        home: const Splashscreen(),
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
