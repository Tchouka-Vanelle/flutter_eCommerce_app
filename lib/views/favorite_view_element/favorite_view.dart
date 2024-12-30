import 'package:flutter/material.dart';
import 'package:task_management/models/product.dart';
import 'package:task_management/models/user_session.dart';
import 'package:task_management/utils/show_product_details.dart';


class FavoriteView extends StatefulWidget {

  const FavoriteView({super.key});

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {

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


  void _deleteFavorite(Product product) async {
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 7),
              child: SizedBox(
                width: double.infinity,
                child:  ValueListenableBuilder<List<Product>>(
                  valueListenable: _favoriteProductsNotifier,
                  builder: (context, favoriteProducts, child) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Wrap(
                        runAlignment: WrapAlignment.start,
                        spacing: 7, //space horizontal
                        runSpacing: 5,
                        children: favoriteProducts.asMap().entries.map((entry) {
                          
                          Product e = entry.value;
                      
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
                                              icon: const Icon(  Icons.favorite, color: Colors.black),
                                              onPressed: () => _deleteFavorite(e)
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
                                       Text(e.name, overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 2),
                                      Text('\$${e.price.toStringAsFixed(2)}', style: const TextStyle(fontWeight: FontWeight.bold),),
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
                          );
                        }).toList(),
                      ),
                    );
                  }
                )
              
              ),
            )
          ),
          
      ],
    );
  }
}


