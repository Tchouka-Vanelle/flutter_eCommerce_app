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
                    int index = entry.key;

                    return GestureDetector(
                      onTap: () {
                        showDialog( 
                          context: context,
                          builder: (BuildContext context) {
                            return  ShowProductDetail(product: e, index: index);
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
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: const EdgeInsets.all(3),
                                    child: Icon( 
                                      index % 2 == 0 ? Icons.favorite_border : Icons.favorite,
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
                                    style: const TextStyle(fontWeight: FontWeight.bold),),
                                const SizedBox(height: 11),
                                Text(e.description, overflow: TextOverflow.ellipsis,),
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



class ShowProductDetail extends StatefulWidget {

  const ShowProductDetail({super.key, required this.product, required this.index});

  final Product product; final int index;
  @override
  State<ShowProductDetail> createState() => _ShowProductDetailState();
}

class _ShowProductDetailState extends State<ShowProductDetail> {
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
                    mainAxisSize: MainAxisSize.min,
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
                    
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text( 
                            widget.product.name, 
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)
                          ),
                          Text(
                            '\$${widget.product.price.toStringAsFixed(2)}',
                            style: const TextStyle( 
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.blue
                            )
                          ),
                        ],
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
                          child: const Text('Add to cart')
                        ),
                      )
                  ]
                ),
              ),
            ),
          
        );
      }
}


