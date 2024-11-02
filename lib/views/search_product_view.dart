import 'package:flutter/cupertino.dart';
import 'package:task_management/models/product.dart';
import 'package:task_management/views/search_product_element/recent_searches_section.dart';
import 'package:task_management/views/search_product_element/recommended_for_you_section.dart';
import 'package:task_management/views/search_product_element/search_section.dart';

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
    Product(description: 'description', price: 14.0, image: 'robe', id: 1, name: 'robe', nbrAchat: 18),
    Product(description: 'description', price: 18.0, image: 'coat', id: 2, name: 'coat', nbrAchat: 15),
    Product(description: 'description', price: 14.0, image: 'robe', id: 3, name: 'robe', nbrAchat: 14),
    Product(description: 'description', price: 18.0, image: 'coat', id: 4, name: 'coat', nbrAchat: 11),
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
          const SizedBox(height: 20),
          RecommendedForYouSection(recommendedForYou: recommendedForYou),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}