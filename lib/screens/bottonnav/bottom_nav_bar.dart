import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:rika_ecomm_app/screens/bottonnav/cart_screen.dart';
import 'package:rika_ecomm_app/screens/bottonnav/mine_page_screen.dart';
import 'package:rika_ecomm_app/screens/bottonnav/profileScreen.dart';
import 'package:rika_ecomm_app/screens/bottonnav/notificationScreen.dart';
class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<Widget> _buildScreens() {
    return [
      MinePage(),
      // ClothCategory(),
      CartScreen(),
      Notificationscreen(),
      Profilescreen()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Image(image: AssetImage("assets/images/home.png")),
        title: ("Home"),
        activeColorPrimary: Colors.black,
        inactiveColorPrimary: Colors.grey,
        textStyle: const TextStyle(color: Colors.white),
      ),
      PersistentBottomNavBarItem(
        icon: const Image(image: AssetImage("assets/images/cart.png")),
        title: ("Cart"),
        activeColorPrimary: Colors.black,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
          icon:
              const Image(image: AssetImage("assets/images/notification.png")),
          title: ("Notifications"),
          activeColorPrimary: Colors.black,
          inactiveColorPrimary: Colors.grey,
          textStyle: const TextStyle(fontSize: 12)),
      PersistentBottomNavBarItem(
        icon: const Image(image: AssetImage("assets/images/profile.png")),
        title: ("Profile"),
        activeColorPrimary: Colors.black,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineToSafeArea: true,
        backgroundColor: Colors.white, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset: true, // Default is true.
        stateManagement: true, // Default is true.
        // hideNavigationBarWhenKeyboardShows: true, // Default is true.
        decoration: const NavBarDecoration(
          colorBehindNavBar: Colors.grey,
          border: Border(top: BorderSide(color: Colors.grey, width: 0.5)),
        ),
        navBarHeight: 66,
        // popAllScreensOnTapOfSelectedTab: true, // Default is false.
        onWillPop: (context) async {
          return true; // Prevents back button from closing app
        },
      ),
    );
  }
}
