import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:rika_ecomm_app/routes/app_router.dart';
import 'package:rika_ecomm_app/routes/routes.dart';
import 'package:rika_ecomm_app/screens/botton_nav_bar/notificationScreen.dart';
import 'package:rika_ecomm_app/screens/cart/cart_screen.dart';
import 'package:rika_ecomm_app/screens/home_screen/home_screen.dart';
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
          initialRoute: NavRoutes.home.path,
          routes: HomeRouter.routes,
          onGenerateRoute: HomeRouter.onGenerateRoute,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.shopping_cart),
        title: "Cart",
        activeColorPrimary: Colors.black,
        inactiveColorPrimary: Colors.grey,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: NavRoutes.cart.path,
          routes: HomeRouter.routes,
          onGenerateRoute: HomeRouter.onGenerateRoute,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.notifications),
        title: "Notification",
        activeColorPrimary: Colors.black,
        inactiveColorPrimary: Colors.grey,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: NavRoutes.notification.path,
          routes: HomeRouter.routes,
          onGenerateRoute: HomeRouter.onGenerateRoute,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person),
        title: "Profile",
        activeColorPrimary: Colors.black,
        inactiveColorPrimary: Colors.grey,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: NavRoutes.profile.path,
          routes: HomeRouter.routes,
          onGenerateRoute: HomeRouter.onGenerateRoute,
        ),
      ),
    ];
  }

  List<Widget> _buildScreens() {
    return [
      const HomeScreen(),
      const CartScreen(),
      const Notificationscreen(),
      const Profilescreen(),
    ];
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
