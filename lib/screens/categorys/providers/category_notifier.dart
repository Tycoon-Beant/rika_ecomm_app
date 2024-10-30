import 'package:flutter/material.dart';
import 'package:rika_ecomm_app/services/category_services.dart';

class CategoryNotifier extends ChangeNotifier {
  bool isLoading = false;
  List<String> categoryList = [];
  Object? error;

  CategoryNotifier() {
    getCategoryList();
  }

  Future<void> getCategoryList() async {
    try {
      isLoading = true;
      notifyListeners();
      final categories = await CategoryServices().getCategories();
      categoryList = categories;
    } catch (e) {
      error = e;
      notifyListeners();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
