import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rika_ecomm_app/screens/filter/cubit/filter_cubit.dart';
import 'package:rika_ecomm_app/screens/order_screens/order_screen.dart';
import 'package:rika_ecomm_app/screens/order_screens/tracking_screen.dart';

import '../screens/botton_nav_bar/notificationScreen.dart';
import '../screens/cart/cart_screen.dart';
import '../screens/category_and_product/categorie_screen.dart';
import '../screens/category_and_product/cubit/product_cubit.dart';
import '../screens/category_and_product/products_screen.dart';
import '../screens/coupon/coupon_screen.dart';
import '../screens/filter/filter_screen.dart';
import '../screens/home_screen/home_screen.dart';
import '../screens/order_screens/checkout_screen.dart';

import '../di/service_locator.dart';
import '../screens/address_screen/add_address_screen.dart';
import '../screens/address_screen/address_screen.dart';
import '../screens/address_screen/cubit/address_cubit.dart';
import '../screens/address_screen/cubit/address_list_cubit.dart';
import '../screens/address_screen/model/address_model.dart';
import '../screens/auth/cubit/login_cubit/login_cubit.dart';
import '../screens/auth/cubit/signup_cubit/signup_cubit.dart';
import '../screens/auth/login_screen.dart';
import '../screens/auth/signup_screen.dart';
import '../screens/botton_nav_bar/bottom_nav_bar.dart';
import '../screens/cart/cubit/cart_cubit.dart';
import '../screens/cart/cubit/cart_list_cubit.dart';

import '../screens/category_and_product/cubit/category_list_cubit.dart';
import '../screens/coupon/cubit/apply_coupon_cubit.dart';
import '../screens/coupon/cubit/coupon_list_cubit.dart';
import '../screens/home_screen/cubit/home_screen_products_cubit.dart';
import '../screens/onboarding_screen/on_boarding_screen.dart';
import '../screens/order_screens/cubit/placed_order_cubit/get_placed_order_id_cubit.dart';
import '../screens/order_screens/cubit/placed_order_cubit/my_order_cubit.dart';
import '../screens/order_screens/model/orders_model.dart';
import '../screens/profile_next_screens/cubit/favorite_cubit.dart';
import '../screens/profile_next_screens/profile_screen.dart';
import '../screens/splash/splash_screen.dart';
import '../screens/splash/succesful_screen.dart';

import '../screens/cart/model/user_cart_model.dart';
import '../screens/category_and_product/model/category_model.dart';
import '../screens/order_screens/cubit/order_address_cubit/get_order_address_cubit.dart';
import '../screens/order_screens/cubit/placed_order_cubit/post_placed_order_cubit.dart';
import '../screens/product_details/product_detail_screen.dart';
import '../services/local_storage_service.dart';
import 'routes.dart';

final rootNavigator = GlobalKey<NavigatorState>();

class AppRouter {
  Map<String, Widget Function(BuildContext)> routes = {
    AppRoute.splash.path: (context) => Splashscreen(),
    AppRoute.onboarding.path: (context) => OnBoarding(),
    AppRoute.login.path: (context) {
      return BlocProvider(create: (context) => getIt<LoginCubit>(), child: Login());
    },
    AppRoute.signUp.path: (context) {
      return BlocProvider(create: (context) => getIt<SignupCubit>(), child: SignUp());
    },
    AppRoute.success.path: (context) => SuccesfullScreen(),
    AppRoute.navbar.path: (context) {
      return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => getIt<CategoryListCubit>()),
          BlocProvider(create: (context) => getIt<HomeScreenProductsCubit>()),
          BlocProvider(create: (context) => getIt<CartCubit>()),
          BlocProvider(create: (context) => getIt<CartListCubit>()),
          BlocProvider(create: (context) => getIt<ApplyCouponCubit>()),
          BlocProvider(create: (context) => getIt<FavoritesCubit>()),
        ],
        child: PresistentBottomBar(),
      );
    },
  };
}

class HomeRouter {
  static Map<String, Widget Function(BuildContext)> routes = {
    NavRoutes.home.path: (context) => const HomeScreen(),
    NavRoutes.notification.path: (context) => const Notificationscreen(),
    NavRoutes.profile.path: (context) => const Profilescreen(),
    NavRoutes.categoryList.path: (context) => const CategoryScreen(),
    NavRoutes.cart.path: (context) => CartScreen(),
    NavRoutes.filter.path: (context) {
      return MultiBlocProvider(
        providers: [
          BlocProvider.value(value: getIt<FilterCubit>()),
        ],
        child: FilterScreen(),
      );
    },
    NavRoutes.coupon.path: (context) {
      return BlocProvider(
        create: (context) => getIt.get<CouponListCubit>(),
        child: CouponScreen(),
      );
    },
    NavRoutes.checkout.path: (context) {
      return MultiBlocProvider(
        providers: [
          BlocProvider.value(
            value: getIt<GetOrderAddressCubit>()
              ..getAddressId(getIt<LocalStorageService>().getAddressId()),
          ),
          BlocProvider(
            create: (context) => getIt<PostPlacedOrderCubit>(),
          ),
        ],
        child: CheckoutScreen(),
      );
    },
    NavRoutes.addressList.path: (context) {
      return MultiBlocProvider(
        providers: [
          BlocProvider.value(value: getIt<GetOrderAddressCubit>()),
          BlocProvider.value(value: getIt<AddressCubit>()),
          BlocProvider(create: (context) => getIt<AddressListCubit>()),
        ],
        child: AddressScreen(),
      );
    },
    NavRoutes.order.path: (context) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => getIt<MyOrderCubit>(),
            ),
            BlocProvider(
              create: (context) => getIt<PostPlacedOrderCubit>(),
            ),
          ],
          child: OrderScreen(),
        ),
  };

  static MaterialPageRoute? onGenerateRoute(RouteSettings settings) {
    if (NavRoutes.productDetail.path == settings.name) {
      final product = settings.arguments as Product;
      return MaterialPageRoute(
        builder: (context) => ProductDetailScreen(products: product),
      );
    }
    if (NavRoutes.productList.path == settings.name) {
      final category = settings.arguments as Categories?;
      return MaterialPageRoute(
        builder: (context) => MultiBlocProvider(
          providers: [
            BlocProvider.value(
              value: getIt<FilterCubit>(),
            ),
            BlocProvider(
              create: (context) => getIt<ProductCubit>(),
            ),
          ],
          child: ProductScreen(categoryId: category),
        ),
      );
    }
    if (NavRoutes.upsertAddress.path == settings.name) {
      final address = settings.arguments as Addresses?;
      return MaterialPageRoute(
        builder: (context) => BlocProvider.value(
          value: getIt<AddressCubit>(),
          child: AddAddressScreen(address: address),
        ),
      );
    }
    if (NavRoutes.traking.path == settings.name) {
      final order = settings.arguments as Orders;
      return MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) => getIt<GetPlacedOrderIdCubit>()..getOrderId(orderId: order.id!),
          child: TrackingScreen(orders: order),
        ),
      );
    }
    return null;
  }
}
