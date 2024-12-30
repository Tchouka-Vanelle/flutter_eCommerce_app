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

  @override
    bool operator ==(Object other) {
      if(identical(this, other)) return true;
      if(other is! Product) return false;
      return id == other.id;
    }

  @override
  int get hashCode => id.hashCode;


}
