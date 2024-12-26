import 'package:flutter/material.dart';
import 'package:task_management/models/product.dart';
import 'package:task_management/models/user_session.dart';
import 'package:task_management/views/show_product_details.dart';


class FavoriteView extends StatelessWidget {

  const FavoriteView({super.key});

  Future<List<Product>> _loadFavoriteProducts() async {
    final session = await UserSession.instance;
    return session.favItems;
  }

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
              child:  FutureBuilder(
              future: _loadFavoriteProducts(), 
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
                  final favoriteProduct = snapshot.data!;
                  return Wrap(
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
                  );
                }
                else {
                  return const Center(
                    child: Text(
                      'No favorite products yet.',
                      style: TextStyle(fontSize: 16),
                    ),
                  );
                }
              }
            ),
          )
        )
      ],
    );
  }
}


