import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management/models/product.dart';
import 'package:task_management/models/category.dart';
import 'package:task_management/models/product_category.dart';
import 'package:task_management/utils/functions/perform_search.dart';
import 'package:task_management/utils/functions/product_provider.dart';
import 'package:task_management/utils/functions/shop_provider.dart';
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
    Product(description: 'description0', price: 21.0, images: ['coat'], id: 7, name: 'culotte', nbrAchat: 27),
    Product(description: 'description1 oi zkzks  n,kpq^dl qskdp jjjjjjjj kkkkkkk o nnkkk llll ppppp eeeee ttt y y m zz eer zzzz eedd eer zzz zzz ee eee pppp jjj hhhh fder', price: 19.0, images: ['robe', 'coat', 'robe', 'coat'], id: 1, name: 'robe', nbrAchat: 18),
    Product(description: 'description2', price: 18.0, images: ['coat'], id: 2, name: 'coat', nbrAchat: 15),
    Product(description: 'description3 kal lpzpz pp', price: 14.0, images: ['robe'], id: 3, name: 'pantalon', nbrAchat: 14),
    Product(description: 'description4 lolipop', price: 18.0, images: ['coat'], id: 4, name: 'pull', nbrAchat: 11),
    Product(description: 'description5', price: 14.0, images: ['robe'], id: 5, name: 'tshirt', nbrAchat: 7),
    Product(description: 'description6', price: 18.0, images: ['coat'], id: 6, name: 'jupe', nbrAchat: 7),
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
    Category(id: 1, name: "category1", photo: "robe"),
    Category(id: 2, name: "category2", photo: "coat"),
    Category(id: 3, name: "category3", photo: "robe"),
    Category(id: 4, name: "category4", photo: "coat"),
    Category(id: 5, name: "category5", photo: "robe"),
    Category(id: 6, name: "category6", photo: "coat"),
    Category(id: 7, name: "category7", photo: "robe"),
    Category(id: 8, name: "category8", photo: "coat"),
  ];

  List<ProductCategory> productCategory = [
    ProductCategory(idCategory: 1, idProduct: 5),
    ProductCategory(idCategory: 1, idProduct: 3),
    ProductCategory(idCategory: 3, idProduct: 1),
    ProductCategory(idCategory: 3, idProduct: 2),
    ProductCategory(idCategory: 3, idProduct: 6),
    ProductCategory(idCategory: 4, idProduct: 4),
    ProductCategory(idCategory: 4, idProduct: 6),
    ProductCategory(idCategory: 4, idProduct: 1),
  ];


  @override
  Widget build(BuildContext context) {
    
    final shopProvider = Provider.of<ShopProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);

    return Padding( 
      padding: const EdgeInsets.all(7),
     
        child: Column( 
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(),
            const SearchSection(),
            const SizedBox(height: 20),

            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(children: [
              
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
              )
                        
              ),
            )
          ]
        )
    );
          
  }       

}