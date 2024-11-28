import 'package:flutter/material.dart';
import 'package:task_management/models/product.dart';
import 'package:task_management/models/category.dart';
import 'package:task_management/views/home_view_element/recently%20consulted_section.dart';
import 'package:task_management/views/home_view_element/home_section_format.dart';
import 'package:task_management/views/home_view_element/search_section.dart';
import 'package:task_management/views/home_view_element/shop_by_category.dart';

class HomeView extends StatefulWidget{
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String? searchValue;
  List<String> recentlyConsulted = [
    'Kitchen appliances', 'Iphone 14 promax', 'Headphone',
    'High heels', 'T-Shirt', 'Light stick',
  ];
  List<Product> saisonalSuggestion = [
    Product(description: 'description1 oi zkzks  n,kpq^dl qskdp jjjjjjjj kkkkkkk o nnkkk llll ppppp eeeee ttt y y m zz eer zzzz eedd eer zzz zzz ee eee pppp jjj hhhh fder', price: 14.0, images: ['robe', 'coat', 'robe', 'coat'], id: 1, name: 'robe', nbrAchat: 18),
    Product(description: 'description2', price: 18.0, images: ['coat'], id: 2, name: 'coat', nbrAchat: 15),
    Product(description: 'description3 kal lpzpz pp', price: 14.0, images: ['robe'], id: 3, name: 'pantalon', nbrAchat: 14),
    Product(description: 'description4 lolipop', price: 18.0, images: ['coat'], id: 4, name: 'pull', nbrAchat: 11),
    Product(description: 'description5', price: 14.0, images: ['robe'], id: 4, name: 'tshirt', nbrAchat: 7),
    Product(description: 'description6', price: 18.0, images: ['coat'], id: 2, name: 'jupe', nbrAchat: 7),
  ];
    List<Product> bestSelling = [
    Product(description: 'description1 oi zkzks  n,kpq^dl qskdp jjjjjjjj kkkkkkk o nnkkk llll ppppp eeeee ttt y y m zz eer zzzz eedd eer zzz zzz ee eee pppp jjj hhhh fder', price: 14.0, images: ['robe', 'coat', 'robe', 'coat'], id: 1, name: 'robe', nbrAchat: 18),
    Product(description: 'description2', price: 18.0, images: ['coat'], id: 2, name: 'coat', nbrAchat: 15),
    Product(description: 'description3 kal lpzpz pp', price: 14.0, images: ['robe'], id: 3, name: 'pantalon', nbrAchat: 14),
    Product(description: 'description4 lolipop', price: 18.0, images: ['coat'], id: 4, name: 'pull', nbrAchat: 11),
    Product(description: 'description5', price: 14.0, images: ['robe'], id: 4, name: 'tshirt', nbrAchat: 7),
    Product(description: 'description6', price: 18.0, images: ['coat'], id: 2, name: 'jupe', nbrAchat: 7),
  ];
    List<Product> news = [
    Product(description: 'description1 oi zkzks  n,kpq^dl qskdp jjjjjjjj kkkkkkk o nnkkk llll ppppp eeeee ttt y y m zz eer zzzz eedd eer zzz zzz ee eee pppp jjj hhhh fder', price: 14.0, images: ['robe', 'coat', 'robe', 'coat'], id: 1, name: 'robe', nbrAchat: 18),
    Product(description: 'description2', price: 18.0, images: ['coat'], id: 2, name: 'coat', nbrAchat: 15),
    Product(description: 'description3 kal lpzpz pp', price: 14.0, images: ['robe'], id: 3, name: 'pantalon', nbrAchat: 14),
    Product(description: 'description4 lolipop', price: 18.0, images: ['coat'], id: 4, name: 'pull', nbrAchat: 11),
    Product(description: 'description5', price: 14.0, images: ['robe'], id: 4, name: 'tshirt', nbrAchat: 7),
    Product(description: 'description6', price: 18.0, images: ['coat'], id: 2, name: 'jupe', nbrAchat: 7),
  ];
  List<Category> shopByCategory = [
    Category(name: "category1", photo: "robe"),
    Category(name: "category2", photo: "coat"),
    Category(name: "category3", photo: "robe"),
    Category(name: "category4", photo: "coat"),
    Category(name: "category5", photo: "robe"),
    Category(name: "category6", photo: "coat"),
    Category(name: "category7", photo: "robe"),
    Category(name: "category8", photo: "coat"),
    Category(name: "category9", photo: "robe"),
  ];

  void searchEntry(String searchValue) {
    setState((){this.searchValue = searchValue;});
  }

  @override
  Widget build(BuildContext context) {
    
    return Padding( 
      padding: const EdgeInsets.all(7),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column( 
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(),
            SearchSection(searchEntry: searchEntry),
            const SizedBox(height: 20),
            RecentlyConsultedSection(recentlyConsulted: recentlyConsulted),
            const SizedBox(height: 25),
            
            HomeSectionFormat(value: saisonalSuggestion, name : "Saisonal Suggestion"),
            const SizedBox(height: 10),
            Divider( 
              color: Colors.grey[110],
              thickness: 1,

            ),
            const SizedBox(height: 25),
            HomeSectionFormat(value: bestSelling, name : "Best Selling"),
            const SizedBox(height: 10),
            Divider( 
              color: Colors.grey[110],
              thickness: 1,

            ),
            const SizedBox(height: 25),
            HomeSectionFormat(value: news, name : "News"),
            const SizedBox(height: 10),
            Divider( 
              color: Colors.grey[110],
              thickness: 1,

            ),
            const SizedBox(height: 10),
            ShopByCategory(shopByCategory: shopByCategory),
            const SizedBox(height: 25,),
            
          ],
        ),
      )
    );
  }
}