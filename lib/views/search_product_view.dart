import 'package:flutter/cupertino.dart';
import 'package:task_management/views/search_product_element/recent_searches_section.dart';
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
        ],
      ),
    );
  }
}