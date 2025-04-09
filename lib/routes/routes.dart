enum AppRoute {
  splash,
  onboarding,
  login,
  signUp,
  success,
  navbar,
}

extension AppRouteExtension on AppRoute {
  String get path {
    switch (this) {
      case AppRoute.splash:
        return '/';
      case AppRoute.login:
        return '/login';
      case AppRoute.signUp:
        return '/signUp';
      case AppRoute.success:
        return '/success';
      case AppRoute.navbar:
        return '/navbar';
      case AppRoute.onboarding:
        return '/onboarding';
    }
  }
}

enum NavRoutes {
  categoryList,
  productList,
  productDetail,
  filter,
  cart,
  coupon,
  checkout,
  addressList,
  upsertAddress,
  order,
  traking,
  home,
  notification,
  profile,
}

extension NavRoutesExtension on NavRoutes {
  String get path {
    switch (this) {
      case NavRoutes.categoryList:
        return "/categoryList";
      case NavRoutes.productList:
        return "/productList";
      case NavRoutes.productDetail:
        return "/productDetail";
      case NavRoutes.filter:
        return "/filter";
      case NavRoutes.cart:
        return "/cart";
      case NavRoutes.coupon:
        return "/coupon";
      case NavRoutes.checkout:
        return "/checkout";
      case NavRoutes.addressList:
        return "/addressList";
      case NavRoutes.upsertAddress:
        return "/upsertAddress";
      case NavRoutes.order:
        return "/order";
      case NavRoutes.traking:
        return "/traking";
      case NavRoutes.home:
        return "/home";
      case NavRoutes.notification:
        return "/notification";
      case NavRoutes.profile:
        return "/profile";
    }
  }
}
