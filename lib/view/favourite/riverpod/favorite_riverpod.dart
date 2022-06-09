import 'package:flutter/material.dart';
import 'package:riverpodecomm/model/product_model.dart';

class FavoriteRiverpod extends ChangeNotifier {
  List<ProductModel> favorites = [];

  void setFavorite(ProductModel model) {
    if (model.isFavorite) {
      favorites.add(model);
    } else {
      favorites.remove(model);
    }
    notifyListeners();
  }
}
