import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:rika_ecomm_app/di/service_locator.dart';
import 'package:rika_ecomm_app/screens/address_screen/add_address_screen.dart';
import 'package:rika_ecomm_app/screens/address_screen/address_screen.dart';
import 'package:rika_ecomm_app/screens/address_screen/cubit/address_cubit.dart';
import 'package:rika_ecomm_app/screens/address_screen/cubit/address_list_cubit.dart';
import 'package:rika_ecomm_app/screens/botton_nav_bar/notificationScreen.dart';
import 'package:rika_ecomm_app/screens/cart/cart_screen.dart';
import 'package:rika_ecomm_app/screens/cart/model/user_cart_model.dart';
import 'package:rika_ecomm_app/screens/category_and_product/categorie_screen.dart';
import 'package:rika_ecomm_app/screens/category_and_product/products_screen.dart';
import 'package:rika_ecomm_app/screens/coupon/coupon_screen.dart';
import 'package:rika_ecomm_app/screens/coupon/cubit/apply_coupon_cubit.dart';
import 'package:rika_ecomm_app/screens/filter/filter_screen.dart';
import 'package:rika_ecomm_app/screens/home_screen/home_screen.dart';
import 'package:rika_ecomm_app/screens/order_screens/cubit/order_address_cubit/get_order_address_cubit.dart';
import 'package:rika_ecomm_app/screens/order_screens/cubit/placed_order_cubit/get_placed_order_id_cubit.dart';
import 'package:rika_ecomm_app/screens/order_screens/cubit/placed_order_cubit/my_order_cubit.dart';
import 'package:rika_ecomm_app/screens/order_screens/cubit/placed_order_cubit/post_placed_order_cubit.dart';
import 'package:rika_ecomm_app/screens/order_screens/model/orders_model.dart';
import 'package:rika_ecomm_app/screens/order_screens/myorder.dart';
import 'package:rika_ecomm_app/screens/order_screens/orderdetails.dart';
import 'package:rika_ecomm_app/screens/order_screens/trakingaddress.dart';
import 'package:rika_ecomm_app/screens/product_details/product_detail_screen.dart';
import 'package:rika_ecomm_app/screens/profile_next_screens/cubit/my_profile_list_cubit.dart';
import 'package:rika_ecomm_app/screens/profile_next_screens/profile_screen.dart';

class PresistentBottomBar extends StatefulWidget {
  const PresistentBottomBar({super.key});

  @override
  State<PresistentBottomBar> createState() => _PresistentBottomBarState();
}

class _PresistentBottomBarState extends State<PresistentBottomBar> {
  late PersistentTabController _controller;

  @override
  void initState() {
    _controller = PersistentTabController(initialIndex: 0);
    super.initState();
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.home),
          title: "Home",
          activeColorPrimary: Colors.black,
          inactiveColorPrimary: Colors.grey,
          routeAndNavigatorSettings: RouteAndNavigatorSettings(
              initialRoute: "/",
              routes: {
                "/": (context) => HomeScreen(),
                "/categoryList": (context) => CategoriScreen(),
                "/filter": (context) => FilterScreen(),
              },
              onGenerateRoute: (value) {
                if (value.name == "/productDetail") {
                  final product = value.arguments as Product;
                  return MaterialPageRoute(
                      builder: (context) => ProductDetailScreen(
                            products: product,
                          ));
                }
                return null;
              })),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.shopping_cart),
        title: "Cart",
        activeColorPrimary: Colors.black,
        inactiveColorPrimary: Colors.grey,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: "/",
          routes: {
            "/": (context) => const CartScreen(),
            "/coupon": (_) => BlocProvider(
                  create: (context) => getIt<ApplyCouponCubit>(),
                  child: const CouponScreen(),
                ),
            "/checkout": (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => getIt<PostPlacedOrderCubit>(),
                    ),
                    BlocProvider(
                      create: (context) => getIt<GetOrderAddressCubit>(),
                    ),
                  ],
                  child: const Orderdetails(),
                ),
            "/address": (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => getIt<AddressListCubit>(),
                    ),
                    BlocProvider(
                      create: (context) => getIt<AddressCubit>(),
                    ),
                  ],
                  child: AddressScreen(),
                ),
            "/myOrder": (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => getIt<MyOrderCubit>(),
                    ),
                    BlocProvider(
                      create: (context) => getIt<PostPlacedOrderCubit>(),
                    ),
                  ],
                  child: Myorder(),
                ),
          },
          onGenerateRoute: (settings) {
            if (settings.name == "/trakingAddress") {
              final order = settings.arguments as Orders;
              return MaterialPageRoute(
                  builder: (context) => BlocProvider(
                        create: (context) => getIt<GetPlacedOrderIdCubit>(),
                        child: Trakingaddress(orders: order),
                      ));
            }
            return null;
          },
        ),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.notifications),
        title: "Notification",
        activeColorPrimary: Colors.black,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person),
        title: "Profile",
        activeColorPrimary: Colors.black,
        inactiveColorPrimary: Colors.grey,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: "/",
          routes: {
            "/": (context) => BlocProvider(
                  create: (context) => getIt<MyProfileListCubit>(),
                  child: Profilescreen(),
                ),
            "/addAddress": (context) => BlocProvider(
                  create: (context) => getIt<AddressCubit>(),
                  child: AddAddressScreen(),
                ),
          },
        ),
      ),
    ];
  }

  List<Widget> _buildScreens() {
    return [
      _wrapWithNavigator(
        initialRoute: '/home',
        routes: {
          '/home': (_) => const HomeScreen(),
          '/categoryListScreen': (_) => const CategoriScreen(),
          '/productScreen': (_) => const ProductScreen(),
          '/productdetailscreen': (_) => const ProductDetailScreen(),
        },
      ),
      const CartScreen(),
      const Notificationscreen(),
      const Profilescreen(),
    ];
  }

  Widget _wrapWithNavigator({
    required String initialRoute,
    required Map<String, WidgetBuilder> routes,
  }) {
    return Navigator(
      initialRoute: initialRoute,
      onGenerateRoute: (RouteSettings settings) {
        final builder = routes[settings.name];
        if (builder != null) {
          return MaterialPageRoute(
            builder: (ctx) => builder(ctx),
            settings: settings,
          );
        }
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text("Page not found")),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      backgroundColor: Colors.white,
      decoration: const NavBarDecoration(
        colorBehindNavBar: Colors.white,
        border: Border(
          top: BorderSide(color: Colors.grey, width: 0.5),
        ),
      ),
      navBarHeight: 66,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      // confineInSafeArea: true,
    );
  }
}
