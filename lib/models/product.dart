import 'package:flutter/foundation.dart';

class Product {
  String name;
  double price;
  String description;
  int id;
  int nbrAchat;
  List<String> images;
  Category? category;

  Product({
    required this.name,
    required this.price,
    required this.description,
    required this.id,
    required this.nbrAchat,
    required this.images,
    this.category,
  }) ;

}
