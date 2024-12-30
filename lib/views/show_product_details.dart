
import 'package:flutter/material.dart';
import 'package:task_management/models/product.dart';
import 'package:task_management/models/user_session.dart';

class ShowProductDetails extends StatefulWidget {

  const ShowProductDetails({super.key, required this.product});

  final Product product;
  @override
  State<ShowProductDetails> createState() => _ShowProductDetailsState();
}

class _ShowProductDetailsState extends State<ShowProductDetails> {
 int photo = 0;


  
  late ValueNotifier<List<Product>> _favoriteProductsNotifier = ValueNotifier([]);
  bool _isLoaded = false;


  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  void _loadFavorites() async{
     final session = await UserSession.instance;
      _favoriteProductsNotifier = ValueNotifier<List<Product>>(session.favItems);
      setState(() {
        _isLoaded = true;
      });
  }


  void _toggleFavorite(Product product) async {
    final session = await UserSession.instance;

     if (_favoriteProductsNotifier.value.contains(product)) {
      _favoriteProductsNotifier.value =
          List.from(_favoriteProductsNotifier.value)..remove(product);
    } else {
      _favoriteProductsNotifier.value =
          List.from(_favoriteProductsNotifier.value)..add(product);
    }

    session.setFavItems(_favoriteProductsNotifier.value);

  }


  @override
  Widget build(BuildContext context) {

    if (!_isLoaded) {
    return const Center(child: CircularProgressIndicator());
    }
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
                        child:  ValueListenableBuilder<List<Product>>(
                                      valueListenable: _favoriteProductsNotifier,
                                      builder: (context, favoriteProducts, child) {
                                        return
                                            IconButton( 
                                              icon: Icon( 
                                                favoriteProducts.contains(widget.product) ? Icons.favorite : Icons.favorite_border ,
                                                color: Colors.black),
                                              onPressed: () => _toggleFavorite(widget.product)
                                            );
                                      }
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


