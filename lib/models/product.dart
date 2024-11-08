import 'package:flutter/foundation.dart';

class Product {
  String name;
  double price;
  String description;
  int id;
  int nbrAchat;
  String image;
  Category? category;

  Product({
    required this.name,
    required this.price,
    required this.description,
    required this.id,
    required this.nbrAchat,
    required this.image,
    this.category,
  }) ;

}
