import 'package:get_it/get_it.dart';
import 'package:rika_ecomm_app/routes/routes.dart';
import 'package:rika_ecomm_app/screens/address_screen/cubit/address_cubit.dart';
import 'package:rika_ecomm_app/screens/address_screen/cubit/address_list_cubit.dart';
import 'package:rika_ecomm_app/screens/address_screen/services/address_services.dart';
import 'package:rika_ecomm_app/screens/auth/cubit/login_cubit/login_cubit.dart';
import 'package:rika_ecomm_app/screens/auth/cubit/signup_cubit/signup_cubit.dart';
import 'package:rika_ecomm_app/screens/auth/service/login_services.dart';
import 'package:rika_ecomm_app/screens/auth/service/signup_services.dart';
import 'package:rika_ecomm_app/screens/cart/cubit/cart_cubit.dart';
import 'package:rika_ecomm_app/screens/cart/cubit/cart_list_cubit.dart';
import 'package:rika_ecomm_app/screens/cart/service/cart_services.dart';
import 'package:rika_ecomm_app/screens/category_and_product/cubit/category_list_cubit.dart';
import 'package:rika_ecomm_app/screens/category_and_product/cubit/product_cubit.dart';
import 'package:rika_ecomm_app/screens/category_and_product/service/category_and_product_services.dart';
import 'package:rika_ecomm_app/screens/coupon/cubit/apply_coupon_cubit.dart';
import 'package:rika_ecomm_app/screens/coupon/cubit/coupon_list_cubit.dart';
import 'package:rika_ecomm_app/screens/coupon/service/coupons_services.dart';
import 'package:rika_ecomm_app/screens/filter/cubit/filter_cubit.dart';
import 'package:rika_ecomm_app/screens/home_screen/cubit/home_screen_products_cubit.dart';
import 'package:rika_ecomm_app/screens/home_screen/service/home_screen_products_service.dart';
import 'package:rika_ecomm_app/screens/order_screens/cubit/order_address_cubit/get_order_address_cubit.dart';
import 'package:rika_ecomm_app/screens/order_screens/cubit/placed_order_cubit/get_placed_order_id_cubit.dart';
import 'package:rika_ecomm_app/screens/order_screens/cubit/placed_order_cubit/my_order_cubit.dart';
import 'package:rika_ecomm_app/screens/order_screens/cubit/placed_order_cubit/post_placed_order_cubit.dart';
import 'package:rika_ecomm_app/screens/order_screens/service/get_order_addressId_services.dart';
import 'package:rika_ecomm_app/screens/order_screens/service/get_order_by_id_services.dart';
import 'package:rika_ecomm_app/screens/order_screens/service/placed_order_services.dart';
import 'package:rika_ecomm_app/screens/profile_next_screens/cubit/favorite_cubit.dart';
import 'package:rika_ecomm_app/screens/profile_next_screens/cubit/my_profile_list_cubit.dart';
import 'package:rika_ecomm_app/screens/profile_next_screens/cubit/product_by_id_cubit.dart';
import 'package:rika_ecomm_app/screens/profile_next_screens/cubit/profile_cubit.dart';
import 'package:rika_ecomm_app/screens/profile_next_screens/service/my_profile_services.dart';
import 'package:rika_ecomm_app/services/local_storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  getIt.registerSingletonAsync(() async => SharedPreferences.getInstance());
  await getIt.isReady<SharedPreferences>();

  getIt.registerSingleton<LocalStorageService>(
      LocalStorageService(getIt.get<SharedPreferences>()));
  getIt.registerSingleton<CategoryAndProductServices>(
      CategoryAndProductServices());
  getIt.registerSingleton<HomeScreenProductsService>(
      HomeScreenProductsService());
  getIt.registerSingleton<CartServices>(CartServices());
  getIt.registerSingleton<LoginServices>(LoginServices(getIt()));
  getIt.registerSingleton<SignupServices>(SignupServices());
  getIt.registerSingleton<MyProfileServices>(MyProfileServices());
  getIt.registerSingleton<CouponsServices>(CouponsServices());
  getIt.registerSingleton<AddressServices>(AddressServices());
  getIt.registerSingleton<GetOrderAddressIdService>(GetOrderAddressIdService());
  getIt.registerSingleton<PlacedOrderServices>(PlacedOrderServices());
  getIt.registerSingleton<GetOrderByIdServices>(GetOrderByIdServices());

  // Register Factory for Cubit
  getIt.registerFactory<CartCubit>(() => CartCubit(getIt()));

  getIt.registerFactory<ApplyCouponCubit>(
      () => ApplyCouponCubit(getIt<CouponsServices>()));
  getIt.registerFactory<CouponListCubit>(
      () => CouponListCubit(getIt<CouponsServices>()));
  getIt.registerFactory<FavoritesCubit>(() => FavoritesCubit(getIt()));
 
  getIt.registerFactory<CategoryListCubit>(
      () => CategoryListCubit(getIt<CategoryAndProductServices>()));

  getIt.registerFactory<CartListCubit>(() => CartListCubit(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
  getIt.registerFactory<SignupCubit>(() =>SignupCubit());
  getIt.registerFactory<ProductCubit>(() => ProductCubit(getIt()));
  getIt.registerFactory<FilterCubit>(() => FilterCubit());
  getIt.registerFactory<MyOrderCubit>(() => MyOrderCubit(getIt()));
  getIt.registerFactory<ProductByIdCubit>(() => ProductByIdCubit(getIt()));
  getIt.registerFactory<MyProfileListCubit>(() => MyProfileListCubit(getIt()));
  getIt.registerFactory<ProfileCubit>(() => ProfileCubit(getIt()));
  getIt.registerFactory<GetOrderAddressCubit>(() => GetOrderAddressCubit(getIt()));
  getIt.registerFactory<GetPlacedOrderIdCubit>(() => GetPlacedOrderIdCubit(getIt()));
  getIt.registerFactory<PostPlacedOrderCubit>(() => PostPlacedOrderCubit(getIt()));
  getIt.registerFactory<AddressListCubit>(() => AddressListCubit(getIt()));
  getIt.registerFactory<AddressCubit>(() => AddressCubit(getIt(), getIt()));
  getIt.registerFactory<HomeScreenProductsCubit>(
      () => HomeScreenProductsCubit(getIt()));
  getIt.registerFactory<Routes>(() => Routes());
}
