
import 'package:flutter/material.dart';
import 'package:task_management/models/product.dart';

class ShowProductDetails extends StatefulWidget {

  const ShowProductDetails({super.key, required this.product, required this.index});

  final Product product; final int index;
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
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(right: 14),
                scrollDirection: Axis.vertical,
                  child: Column( 
                    mainAxisSize: MainAxisSize.min, // only use the necessary space
                    children: [ 
                      Align(
                        alignment: Alignment.centerRight,
                        child: Icon( 
                          widget.index % 2 == 0 ? Icons.favorite_border : Icons.favorite,
                          color: Colors.black
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
                      Align(
                        alignment: Alignment.center,
                        child:  ElevatedButton(
                          onPressed: () {Navigator.of(context).pop();}, 
                          style: ElevatedButton.styleFrom(
                            shape: const RoundedRectangleBorder( 
                              borderRadius: BorderRadius.zero
                            ),
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.black,
                          ),
                          child: const Text('ADD TO CART')
                        ),
                      )
                  ]
                ),
              ),
            ),
          
        );
      }
}


