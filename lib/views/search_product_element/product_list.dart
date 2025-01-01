import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management/models/product.dart';
import 'package:task_management/utils/functions/shop_provider.dart';
import 'package:task_management/utils/components/show_product_details.dart';

class ProductList extends StatelessWidget {

  const ProductList({super.key, required this.productList});

  final List<Product> productList;

  @override
  Widget build(BuildContext context) {

    return Column( 
      mainAxisAlignment: MainAxisAlignment.start,
      children: [ 
          const Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [ 
              Text( 
                  'Result of your search',
                  style: TextStyle( 
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 7),
            child: SizedBox(
              width: double.infinity,
              child: Wrap(
                  runAlignment: WrapAlignment.start,
                  spacing: 7, //space horizontal
                  runSpacing: 5,
                  children: productList.asMap().entries.map((entry) {
                    
                    Product e = entry.value;

                    return Consumer<ShopProvider>(
                      builder: (context, shopProvider, child) {

                        final isFavorite = shopProvider.isFavorite(e);
                        final isIncart = shopProvider.isInCart(e);

                      return  Container( 
                        padding: const EdgeInsets.all(7),
                        margin: const EdgeInsets.all(7),
                        decoration: BoxDecoration( 
                          color:  Colors.grey[30],
                          border: Border.all( 
                            color: Colors.grey.shade300,
                            width: 1.5,
                          ), 
                        ),
                        child: SizedBox(
                          width: 100,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [ 
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: const EdgeInsets.all(3),
                                      child: IconButton( 
                                        icon: Icon( 
                                          isFavorite ? Icons.favorite : Icons.favorite_border ,
                                          color: Colors.black),
                                        onPressed: () => shopProvider.toggleFavorite(e)
                                      )
                                  )
                                ),
                                GestureDetector(
                                  onTap: () {
                                    showDialog( 
                                      context: context,
                                      builder: (BuildContext context) {
                                        return  ShowProductDetails(product: e);
                                      },
                                    );
                                  },
                                  child:  Image(
                                      image: AssetImage('assets/product_images/${e.images[0]}.png'),
                                      width: 100,  height: 100,
                                    ),
                                ),
                                const SizedBox(height: 2),
                              
                                Text('\$${e.price.toStringAsFixed(2)}', style: const TextStyle(fontWeight: FontWeight.bold),),
                                Text(e.name, overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(fontWeight: FontWeight.bold),),
                                const SizedBox(height: 11),
                                Text(e.description, overflow: TextOverflow.ellipsis,),
                                const SizedBox(height: 11),
                                Align(
                                  alignment: Alignment.center,
                                  child:  ElevatedButton(
                                      onPressed: isIncart ? null : () => shopProvider.addToCart(e), 
                                      style: ElevatedButton.styleFrom(
                                        shape: const RoundedRectangleBorder( 
                                          borderRadius: BorderRadius.zero
                                        ),
                                        backgroundColor: Colors.blue,
                                        foregroundColor: Colors.black,
                                      ),
                                      child: const Text('Add to cart')
                                    ),
                                )
                              
                                
                              ],
                            
                          )
                        )
                      );
                    }
                  );
                  }).toList(),
                )
              )
            )
      ],
    );
  }
}


