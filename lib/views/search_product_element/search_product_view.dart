import 'package:flutter/material.dart';
import 'package:task_management/models/product.dart';
import 'package:task_management/views/search_product_element/product_list.dart';
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
    Product(id: 1, description: 'description1 oi zkzks  n,kpq^dl qskdp jjjjjjjj kkkkkkk o nnkkk llll ppppp eeeee ttt y y m zz eer zzzz eedd eer zzz zzz ee eee pppp jjj hhhh fder', price: 14.0, images: ['robe', 'coat', 'robe', 'coat'], name: 'robe', nbrAchat: 18),
    Product(id: 2, description: 'description2', price: 18.0, images: ['coat'], name: 'coattttttttttttttttttttttttttttt tttttttttt', nbrAchat: 15),
    Product(id: 3, description: 'description3 kal lpzpz pp', price: 24.0, images: ['robe'], name: 'pantalon', nbrAchat: 14),
    Product(id: 4, description: 'description4 lolipop', price: 29.0, images: ['coat'],  name: 'pull', nbrAchat: 11),
    Product(id: 5, description: 'description5', price: 33.0, images: ['robe'], name: 'tshirt', nbrAchat: 7),
    Product(id: 6, description: 'description6', price: 41.0, images: ['coat'], name: 'jupe', nbrAchat: 7),
    Product(id: 7, description: 'description7 kal lpzpz pp', price: 64.0, images: ['robe'], name: 'iphone', nbrAchat: 4),
    Product(id: 8, description: 'description8 lolipop', price: 37.0, images: ['coat'],  name: 'kitchen appliances', nbrAchat: 2),
    Product(id: 9, description: 'description9', price: 5.0, images: ['robe'], name: 'stick', nbrAchat: 26),
   
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
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
              
                child: Column(children: [
                  RecentSearchesSection(recentSearches: recentSearches),
                  const SizedBox(height: 25),
                  RecommendedForYouSection(recommendedForYou: recommendedForYou),
                  const SizedBox(height: 10),
                  Divider( 
                    color: Colors.grey[110],
                    thickness: 1,
              
                  ),
                  const SizedBox(height: 10),
                  
                  ProductList(productList: recommendedForYou),
                  const SizedBox(height: 25,),
                ],)
              ),
            )
          ],
        ),
    );
  }
}