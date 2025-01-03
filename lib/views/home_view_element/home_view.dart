import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management/models/product.dart';
import 'package:task_management/utils/functions/product_provider.dart';
import 'package:task_management/views/home_view_element/recently%20consulted_section.dart';
import 'package:task_management/views/home_view_element/home_section_format.dart';
import 'package:task_management/utils/components/search_section.dart';
import 'package:task_management/views/home_view_element/shop_by_category.dart';

class HomeView extends StatefulWidget{
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String? searchValue;

  void searchEntry(List<Product> productToDisplay) {
    setState((){
      this.productToDisplay = productToDisplay;
      Navigator.of(context).pushNamed('/search_product_view', arguments: this.productToDisplay);
    });
  }

  List<Product> productToDisplay = [];


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

            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(children: [
              
                  RecentlyConsultedSection(recentlyConsulted: productProvider.recentlyConsulted),
                  const SizedBox(height: 25),
              
                  HomeSectionFormat(value: productProvider.seasonSuggestion, name : "Saisonal Suggestion"),
                  const SizedBox(height: 10),
                  Divider( 
                    color: Colors.grey[110],
                    thickness: 1,
              
                  ),
                  const SizedBox(height: 25),
                  HomeSectionFormat(value: productProvider.bestSelling, name : "Best Selling"),
                  const SizedBox(height: 10),
                  Divider( 
                    color: Colors.grey[110],
                    thickness: 1,
              
                  ),
                  const SizedBox(height: 25),
                  HomeSectionFormat(value: productProvider.news, name : "News"),
                  const SizedBox(height: 10),
                  Divider( 
                    color: Colors.grey[110],
                    thickness: 1,
              
                  ),
                  const SizedBox(height: 10),
                  ShopByCategory(shopByCategory: productProvider.categories),
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