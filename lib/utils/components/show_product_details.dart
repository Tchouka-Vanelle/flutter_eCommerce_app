
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management/models/product.dart';
import 'package:task_management/utils/functions/shop_provider.dart';

class ShowProductDetails extends StatefulWidget {

  const ShowProductDetails({super.key, required this.product});

  final Product product;
  @override
  State<ShowProductDetails> createState() => _ShowProductDetailsState();
}

class _ShowProductDetailsState extends State<ShowProductDetails> {
 int photo = 0;

  @override
  Widget build(BuildContext context) {

    return AlertDialog( 
            
            contentPadding:  const EdgeInsets.all(16),
            shape: RoundedRectangleBorder( 
              borderRadius: BorderRadius.circular(11),
            ),
            
            content:  ConstrainedBox(
                constraints: const BoxConstraints(
                  maxHeight: 300,
                  maxWidth: 300,
                ),
              child: Consumer<ShopProvider>(
                builder: (context, shopProvider, child) {
                return SingleChildScrollView(
                  padding: const EdgeInsets.only(right: 14),
                  scrollDirection: Axis.vertical,
                    child: Column( 
                      mainAxisSize: MainAxisSize.min, // only use the necessary space
                      children: [ 
                        Align(
                          alignment: Alignment.centerRight,
                          child: IconButton( 
                            icon: Icon( 
                              shopProvider.favItems.contains(widget.product) ? Icons.favorite : Icons.favorite_border ,
                              color: Colors.black),
                            onPressed: () => shopProvider.toggleFavorite(widget.product)
                          )
                        ),
                        Row( 
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [ 
                            TextButton(
                              onPressed: (){
                                setState(() {
                                    photo = (photo-1 + widget.product.images.length) % widget.product.images.length;
                                });
                              }, 
                              child: const Icon(Icons.arrow_left_rounded)
                            ),
                            Image(
                              image: AssetImage('assets/product_images/${widget.product.images[photo]}.png'),
                              width: 150,  height: 150,
                            ),
                            TextButton(
                              onPressed: (){
                                setState(() {
                                  photo = (photo + 1) % widget.product.images.length;
                                });
                              }, 
                              child: const Icon(Icons.arrow_right_rounded)
                            ),
                          ],
                        ),
                    
                        const SizedBox(height: 11,),
                      
                        Text( 
                          widget.product.name, 
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child:  Text(
                            '\$${widget.product.price.toStringAsFixed(2)}',
                            textAlign: TextAlign.left,
                            style: const TextStyle( 
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.blue
                            )
                          ),
                        ),
                      
                        const SizedBox(height: 11,),
                        Text(
                          widget.product.description,
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(height: 21,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {Navigator.of(context).pop();}, 
                              style: ElevatedButton.styleFrom(
                                shape: const RoundedRectangleBorder( 
                                  borderRadius: BorderRadius.zero
                                ),
                                backgroundColor: Colors.red,
                                foregroundColor: Colors.black,
                              ),
                              child: const Text('CLOSE')
                            ),
                            ElevatedButton(
                              onPressed: shopProvider.isInCart(widget.product) ?  null : () => shopProvider.addToCart(widget.product), 
                              style: ElevatedButton.styleFrom(
                                shape: const RoundedRectangleBorder( 
                                  borderRadius: BorderRadius.zero
                                ),
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.black,
                              ),
                              child: const Text('ADD TO CART')
                            ),
                            
                          ],
                        )
                     
                  ]
                ));
              }),
            ),
          
        );
      }
}


