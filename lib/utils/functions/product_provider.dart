

import 'package:flutter/material.dart';
import 'package:task_management/models/category.dart';
import 'package:task_management/models/product.dart';
import 'package:task_management/models/product_category.dart';

class ProductProvider extends ChangeNotifier {

  List<Product> _allProducts = [];
  List<String> _recentlyConsulted = [];
  List<Product> _saisonalSuggestion = [];
  List<Product> _bestSelling = [];
  List<Product> _news = [];
  List<Category> _categories = [];
  List<ProductCategory> _productCategory = [];

  List<Product> get allProducts => _allProducts;
  set allProducts(List<Product> value) {
    _allProducts = value;
    notifyListeners();
  }

  List<String> get recentlyConsulted => _recentlyConsulted;
  set recentlyConsulted(List<String> value) {
    _recentlyConsulted = value;
    notifyListeners();
  }

  List<Product> get seasonSuggestion => _saisonalSuggestion;
  set seasonSuggestion(List<Product> value) {
    _saisonalSuggestion = value;
    notifyListeners();
  }

  List<Product> get bestSelling => _bestSelling;
  set bestSelling(List<Product> value) {
    _bestSelling = value;
    notifyListeners();
  }

  List<Product> get news => _news;
  set news(List<Product> value) {
    _news = value;
    notifyListeners();
  }

  List<Category> get categories => _categories;
  set categories(List<Category> value) {
    _categories = value;
    notifyListeners();
  }

  List<ProductCategory> get productCategory => _productCategory;
  set productCategory(List<ProductCategory> value) {
    _productCategory = value;
    notifyListeners();
  }

}