import 'package:flutter/material.dart';
import 'package:task_management/models/product.dart';
import 'package:task_management/views/show_product_details.dart';


class FavoriteView extends StatelessWidget {

  FavoriteView({super.key});

  final List<Product> favoriteProduct = [
    Product(description: 'description1 oi zkzks  n,kpq^dl qskdp jjjjjjjj kkkkkkk o nnkkk llll ppppp eeeee ttt y y m zz eer zzzz eedd eer zzz zzz ee eee pppp jjj hhhh fder', price: 14.0, images: ['robe', 'coat', 'robe', 'coat'], id: 1, name: 'robe', nbrAchat: 18),
    Product(description: 'description2', price: 18.0, images: ['coat'], id: 2, name: 'coattttttttttttttttttttttttttttt tttttttttt', nbrAchat: 15),
    Product(description: 'description3 kal lpzpz pp', price: 14.0, images: ['robe'], id: 3, name: 'pantalon', nbrAchat: 14),
  ];

  @override
  Widget build(BuildContext context) {
    return Column( 
      mainAxisAlignment: MainAxisAlignment.start,
      children: [ 
          const Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [ 
              Text( 
                  'Your Favorites',
                  style: TextStyle( 
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
              ),
             
            ],
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(left: 7),
            child: SizedBox(
              width: double.infinity,
              child: Wrap(
                  runAlignment: WrapAlignment.start,
                  spacing: 7, //space horizontal
                  runSpacing: 5,
                  children: favoriteProduct.asMap().entries.map((entry) {
                    
                    Product e = entry.value;
                    int index = entry.key;

                    return GestureDetector(
                      onTap: () {
                        showDialog( 
                          context: context,
                          builder: (BuildContext context) {
                            return  ShowProductDetails(product: e, index: index);
                          },
                        );
                      },
                      child:  Container( 
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
                                const Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: EdgeInsets.all(3),
                                    child: Icon( 
                                      Icons.favorite,
                                      color: Colors.black
                                    )
                                  )
                                ),
                                Image(
                                      image: AssetImage('assets/product_images/${e.images[0]}.png'),
                                      width: 100,  height: 100,
                                    ),
                                const SizedBox(height: 2),
                              
                                Text('\$${e.price.toStringAsFixed(2)}', style: const TextStyle(fontWeight: FontWeight.bold),),
                                Text(e.name, overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 11),
                                Align(
                                  alignment: Alignment.center,
                                  child:  ElevatedButton(
                                      onPressed: () {}, 
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
                      )
                    );
                  }).toList(),
                )
              )
            )
      ],
    );
  }
}


