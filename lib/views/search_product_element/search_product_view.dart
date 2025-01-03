import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management/models/product.dart';
import 'package:task_management/utils/functions/product_provider.dart';
import 'package:task_management/views/search_product_element/product_list.dart';
import 'package:task_management/views/search_product_element/recent_searches_section.dart';
import 'package:task_management/views/search_product_element/recommended_for_you_section.dart';
import 'package:task_management/utils/components/search_section.dart';

class SearchProductView extends StatefulWidget{

  const SearchProductView({super.key, required this.initialProductToDisplay});

  final List<Product> initialProductToDisplay;

  @override
  State<SearchProductView> createState() => _SearchProductViewState();
}

class _SearchProductViewState extends State<SearchProductView> {

  late List<Product> productToDisplay;

  @override
  void initState() {
    super.initState();
    productToDisplay = widget.initialProductToDisplay; // Initialize from widget
  }

  void searchEntry(List<Product> products) {
    setState(() {
      productToDisplay = products; // Update state
    });
  }

  String? searchValue;
  List<String> recentSearches = [
    'Kitchen appliances', 'Iphone 14 promax', 'Headphone',
    'High heels', 'T-Shirt', 'Light stick',
  ];
 
  @override
  Widget build(BuildContext context) {
    
    final productProvider = Provider.of<ProductProvider>(context);
    
    return Padding( 
      padding: const EdgeInsets.all(7),
      
        child: Column( 
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(),
            SearchSection(searchEntry: searchEntry),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
            
              child: Column(children: [
                RecentSearchesSection(recentSearches: recentSearches),
                const SizedBox(height: 25),
                RecommendedForYouSection(recommendedForYou:
                 productProvider.bestSelling + productProvider.news + productProvider.seasonSuggestion
                ),
                const SizedBox(height: 10),
                Divider( 
                  color: Colors.grey[110],
                  thickness: 1,
            
                ),
                const SizedBox(height: 10),
                
                ProductList(productList: productToDisplay),
                const SizedBox(height: 25,),
              ],)
            )
          ],
        ),
    );
  }
}