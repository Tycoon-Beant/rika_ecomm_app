import 'package:bloc/bloc.dart';
import 'package:rika_ecomm_app/model/result.dart';
import 'package:rika_ecomm_app/screens/profile_next_screens/cubit/product_by_id_cubit.dart';
import 'package:rika_ecomm_app/services/local_storage_service.dart';

class LikeState {
  final List<String> productIds;

  LikeState({required this.productIds});

  bool isLiked(String productId) => productIds.contains(productId);
}

class FavoritesCubit extends Cubit<LikeState> {
  final LocalStorageService localStorageService;
  // final ProductByIdCubit _productByIdCubit;

  FavoritesCubit(this.localStorageService)
      : super(LikeState(productIds: [])) {
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    final favorites = await localStorageService.getFavorite() ?? [];
    emit(LikeState(productIds: favorites));
    // if (favorites.isNotEmpty) {
    //   _productByIdCubit.getProductById(favorites);
    // }
  }

  Future<void> addFavorite(String productId) async {
    await localStorageService.addFavorite(productId);
    final updatedFavorites = await localStorageService.getFavorite() ?? [];
    emit(LikeState(productIds: updatedFavorites));
    await loadFavorites();
  }

  Future<void> removeFavorite(String productId) async {
    await localStorageService.removeFavorite(productId);
    final updatedFavorites = await localStorageService.getFavorite() ?? [];
    emit(LikeState(productIds: updatedFavorites));
    await loadFavorites();
  }

  Future<void> clearFavorites() async {
    await localStorageService.clearFavorites();
    emit(LikeState(productIds: []));
    // _productByIdCubit.emit(Result(data: [])); 
  }
}
