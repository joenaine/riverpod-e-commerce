import 'package:flutter/material.dart';
import 'package:grock/grock.dart';
import 'package:riverpodecomm/model/product_model.dart';

class ProductRiverpod extends ChangeNotifier {
  List<ProductModel> products = [];
  List<ProductModel> favorites = [];
  List<ProductModel> basketProducts = [];

  double totalPrice = 0.0;

  void setTotalPrice(ProductModel model) {
    totalPrice += model.price;
  }

  void setFavorite(ProductModel model) {
    if (model.isFavorite) {
      model.isFavorite = false;
      favorites.remove(model);
      notifyListeners();
    } else {
      model.isFavorite = true;
      favorites.add(model);
      notifyListeners();
    }
  }

  void addedCart(ProductModel model) {
    basketProducts.add(model);
    setTotalPrice(model);
    Grock.snackBar(title: 'Added', description: '${model.title} added to Cart', icon: Icons.check);
  }

  void init() {
    for (var i = 0; i < 15; i++) {
      products.add(ProductModel(
          isFavorite: false,
          imagePath: i.randomImage(),
          title: 'iPhone $i',
          price: 1000.0,
          description: 'Popular Phone'));
    }
  }
}
