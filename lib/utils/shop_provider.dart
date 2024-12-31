

import 'package:flutter/material.dart';
import 'package:task_management/models/cart_item.dart';
import 'package:task_management/models/product.dart';

class ShopProvider extends ChangeNotifier {

  List<Product> _favItems = [];
  List<CartItem> _cartItems = [];

  List<Product> get favItems => _favItems;
  List<CartItem> get cartItems => _cartItems;

  set favItems(List<Product> items) {
    _favItems = items;
    notifyListeners();
  }

  set cartItems(List<CartItem> items) {
    _cartItems = items;
    notifyListeners();
  }

  void toggleFavorite(Product product) {
    
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
    
    final existingItem = _cartItems.firstWhere(
      (item) => item.product == product,
      orElse: () => CartItem(product: product, quantity: 0),
    );

    if (existingItem.quantity == 0) {
      _cartItems.add(CartItem(product: product, quantity: 1));
    } else {
      existingItem.quantity ++;
    }
    notifyListeners();
  }

  void removeFromCart(Product product) {
    
    final existingItem = _cartItems.firstWhere(
      (item) => item.product == product,
      orElse: () => CartItem(product: product, quantity: 0),
    );

    if (existingItem.quantity > 1) {
      existingItem.quantity --;
    } else {
      _cartItems.remove(existingItem);
    }
    notifyListeners();
  }

  bool isInCart(Product product) {
    return _cartItems.any((item) => item.product == product);
  }

  int get cartItemCount => _cartItems.fold(0, (total, item) => total + item.quantity);

  int getQuantity(Product product) {
    
    final existingItem = _cartItems.firstWhere(
      (item) => item.product == product,
      orElse: () => CartItem(product: product, quantity: 0)
    );
    return existingItem.quantity;
  }

  void clear() {
    _favItems.clear();
    _cartItems.clear();
    notifyListeners();
  }

}