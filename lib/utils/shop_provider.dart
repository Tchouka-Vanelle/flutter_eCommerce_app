

import 'package:flutter/material.dart';
import 'package:task_management/models/product.dart';

class ShopProvider extends ChangeNotifier {

  List<Product> _favItems = [];
  List<Product> _cartItems = [];

  List<Product> get favorites => _favItems;
  List<Product> get cartItems => _cartItems;

  void _toggleFavorite(Product product) {
    
    if (_favItems.contains(product)) {
      _favItems.remove(product);
    }
    else {
      _favItems.add(product);
    }
    notifyListeners();
  }

  bool isFavorite(Product product) {
    return _favItems.contains(product);
  }

  void addToCart(Product product) {
    if (!_cartItems.contains(product)){
      _cartItems.add(product);
      notifyListeners();
    }
  }

  void removeFromCart(Product product) {
    if(_cartItems.contains(product)){
      _cartItems.remove(product);
      notifyListeners();
    }
  }

  bool isInCart(Product product) {
    return _cartItems.contains(product);
  }

  int get cartItemCount => _cartItems.length;

}