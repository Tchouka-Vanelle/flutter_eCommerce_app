import 'package:flutter/material.dart';
import 'package:task_management/models/product.dart';
import 'package:task_management/models/user_session.dart';
import 'package:task_management/views/cart_view_element/product_to_buy.dart';
import 'package:task_management/views/search_product_element/recommended_for_you_section.dart';

class CartView extends StatelessWidget{
  CartView({super.key});

  Future<List<Product>> _loadCartItems() async {
    final session = await UserSession.instance;
    return session.cartItems;
  }

  final List<Product> recommendedForYou = [
    Product(description: 'description1 oi zkzks  n,kpq^dl qskdp jjjjjjjj kkkkkkk o nnkkk llll ppppp eeeee ttt y y m zz eer zzzz eedd eer zzz zzz ee eee pppp jjj hhhh fder', price: 14.0, images: ['robe', 'coat', 'robe', 'coat'], id: 1, name: 'robe', nbrAchat: 18),
    Product(description: 'description2', price: 18.0, images: ['coat'], id: 2, name: 'coattttttttttttttttttttttttttttt tttttttttt', nbrAchat: 15),
    Product(description: 'description3 kal lpzpz pp', price: 14.0, images: ['robe'], id: 3, name: 'pantalon', nbrAchat: 14),
    Product(description: 'description4 lolipop', price: 18.0, images: ['coat'], id: 4, name: 'pull', nbrAchat: 11),
    Product(description: 'description5', price: 14.0, images: ['robe'], id: 4, name: 'tshirt', nbrAchat: 7),
    Product(description: 'description6', price: 18.0, images: ['coat'], id: 2, name: 'jupe', nbrAchat: 7),
  ];

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
        
            FutureBuilder(
              future: _loadCartItems(), 
              builder: (context, snapshot){
                if(snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } 
                else if (snapshot.hasError) {
                  return const Text(
                            'Something went wrong. Please try again later.',
                            style: TextStyle(color: Colors.red, fontSize: 16),
                          );
                }
                else if (snapshot.hasData) {
                  final productToBuy = snapshot.data!;
                  return ProductToBuy(productToBuy: productToBuy);
                }
                else {
                  return const ProductToBuy(productToBuy: []);
                }
              }
            ),

            const SizedBox(height: 15),
            Divider( 
              color: Colors.grey[110],
              thickness: 1,
            ),
            const SizedBox(height: 15),
            RecommendedForYouSection(recommendedForYou: recommendedForYou),
            
          ],
        ),
      )
    );
  }
}