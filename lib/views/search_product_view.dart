import 'package:flutter/material.dart';
import 'package:task_management/models/product.dart';
import 'package:task_management/models/category.dart';
import 'package:task_management/views/search_product_element/recent_searches_section.dart';
import 'package:task_management/views/search_product_element/recommended_for_you_section.dart';
import 'package:task_management/views/search_product_element/search_section.dart';
import 'package:task_management/views/search_product_element/shop_by_category.dart';

class SearchProductView extends StatefulWidget{
  const SearchProductView({super.key});

  @override
  State<SearchProductView> createState() => _SearchProductViewState();
}

class _SearchProductViewState extends State<SearchProductView> {
  String? searchValue;
  List<String> recentSearches = [
    'Kitchen appliances', 'Iphone 14 promax', 'Headphone',
    'High heels', 'T-Shirt', 'Light stick',
  ];
  List<Product> recommendedForYou = [
    Product(description: 'description', price: 14.0, image: 'robe', id: 1, name: 'robeoooooooooooooo', nbrAchat: 18),
    Product(description: 'description', price: 18.0, image: 'coat', id: 2, name: 'coat', nbrAchat: 15),
    Product(description: 'description', price: 14.0, image: 'robe', id: 3, name: 'robe', nbrAchat: 14),
    Product(description: 'description', price: 18.0, image: 'coat', id: 4, name: 'coat', nbrAchat: 11),
    Product(description: 'description', price: 14.0, image: 'robe', id: 4, name: 'robe', nbrAchat: 7),
  ];
  List<Category> shopByCategory = [
    Category(name: "category1", photo: "robe"),
    Category(name: "category2", photo: "coat"),
    Category(name: "category3", photo: "robe"),
    Category(name: "category4", photo: "coat"),
    Category(name: "category5", photo: "robe"),
  ];

  void searchEntry(String searchValue) {
    setState((){this.searchValue = searchValue;});
  }

  @override
  Widget build(BuildContext context) {
    
    return Padding( 
      padding: const EdgeInsets.all(7),
      child: Column( 
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(),
          SearchSection(searchEntry: searchEntry),
          const SizedBox(height: 20),
          RecentSearchesSection(recentSearches: recentSearches),
          const SizedBox(height: 25),
          RecommendedForYouSection(recommendedForYou: recommendedForYou),
          Divider( 
            color: Colors.grey[150],
            thickness: 1,

          ),
          const SizedBox(height: 25),
          ShopByCategory(shopByCategory: shopByCategory)
        ],
      ),
    );
  }
}