import 'package:flutter/material.dart';
import 'package:task_management/models/product.dart';

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
                  'Shop by Category',
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
                  children: productList.map((e) => (
                    Container( 
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
                              Image(image: AssetImage('assets/product_images/${e.image}.png'),
                                    width: 100,  height: 100,),
                              const SizedBox(height: 2),
                            
                                      Text('\$${e.price}'),
                                      Text(e.name, overflow: TextOverflow.ellipsis,),
                                      const SizedBox(height: 6),
                                      Text(e.description, overflow: TextOverflow.ellipsis,),
                                      const SizedBox(height: 7),
                                      Align(
                                        alignment: Alignment.center,
                                        child:  ElevatedButton(
                                                onPressed: () {}, 
                                                style: ElevatedButton.styleFrom(
                                                  shape: const RoundedRectangleBorder( 
                                                    borderRadius: BorderRadius.zero
                                                  )
                                                ),
                                                child: const Text('Add to cart')),
                                      )
                                    
                              
                            ],
                          
                        )
                      )
                    )
                  )).toList(),
                )
              )
            )
      ],
    );
  }

}