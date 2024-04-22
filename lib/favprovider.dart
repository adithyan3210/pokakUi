import 'package:flutter/material.dart';

class Product {
  final String image;
  final String title;
  final String price;

  Product({
    required this.image,
    required this.title,
    required this.price,
  });
}

class FavoritesProvider extends ChangeNotifier {
  List<Product> _favoriteProducts = [];

  List<Product> get favoriteProducts => _favoriteProducts;

  void addProductToFavorites(Product product) {
    if (!isProductInFavorites(product)) {
      _favoriteProducts.add(product);
      notifyListeners();
    }
  }

  void removeProductFromFavorites(Product product) {
    _favoriteProducts.remove(product);
    notifyListeners();
  }

  bool isProductInFavorites(Product product) {
    return _favoriteProducts.contains(product);
    
  }
}
