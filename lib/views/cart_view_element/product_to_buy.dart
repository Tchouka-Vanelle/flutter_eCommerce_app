import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management/models/cart_item.dart';
import 'package:task_management/models/product.dart';
import 'package:task_management/utils/shop_provider.dart';
import 'package:task_management/views/cart_view_element/show_payment_popup.dart';
import 'package:task_management/utils/show_product_details.dart';

class ProductToBuy extends StatefulWidget {
  const ProductToBuy({super.key, required this.productToBuy});

  final List<CartItem> productToBuy;

  @override
  State<ProductToBuy> createState() => _ProductToBuyState();
}

class _ProductToBuyState extends State<ProductToBuy> {

  late List<bool> _isChecked;

  @override
  void initState(){
    super.initState();
     _isChecked = List<bool>.filled(widget.productToBuy.length, false);
  }
  double get _totalPrice => widget.productToBuy
            .asMap().entries.where((entry) => _isChecked[entry.key])
            .fold(
              0.0,
              (sum, entry) => sum + (entry.value.product.price * entry.value.quantity) );

  List<Product> get _selectedProduct => widget.productToBuy.asMap()
            .entries.where((entry) => _isChecked[entry.key] == true)
            .map((entry) => entry.value.product)
            .toList();


  @override
  Widget build(BuildContext context) {

    final shopProvider = Provider.of<ShopProvider>(context);

    return Column( 
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children:  [ 
          const Text( 
            'Cart',
            style: TextStyle( 
              fontSize: 20,
              fontWeight: FontWeight.bold,
              
            ),
          ),
             
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 7),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                  
                  children:[ 
                    ListView.builder(
                    shrinkWrap: true, // s'adapte à la taille du contenu
                    physics: const NeverScrollableScrollPhysics(), // désactive le défilement interne
                    itemCount: widget.productToBuy.length,
                    itemBuilder: (context, index) {
                      debugPrint('Building item at index $index: ${widget.productToBuy[index].product.name}');
                      return 
                        Card(
                          margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 16),
                          child:  IntrinsicHeight(
                            child: ListTile(
                              leading: SizedBox( 
                                width: 30,
                                child: Checkbox(
                                  value: _isChecked[index], 
                                  onChanged: (bool? val){
                                    setState(() {
                                      _isChecked[index]=val ?? false;
                                      debugPrint('_isChecked[$index] updated to ${_isChecked[index]}');
                                    });
                                  }
                                ),
                              ),
                              title:Text(widget.productToBuy[index].product.name, 
                                    style: const TextStyle(fontSize: 17),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,),
                              subtitle: Text('Price: \$${widget.productToBuy[index].product.price.toStringAsFixed(2)}',
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(fontSize: 18),
                                        maxLines: 1,),
                              trailing: SizedBox(
                                width: 240,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          showDialog( 
                                            context: context,
                                            builder: (BuildContext context) {
                                              return  ShowProductDetails(product: widget.productToBuy[index].product);
                                            },
                                          );
                                        },
                                        child:  Image(image: AssetImage('assets/product_images/${widget.productToBuy[index].product.images[0]}.png'),
                                            fit: BoxFit.scaleDown,
                                            width: 50,  height: 150,),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          IconButton(
                                            onPressed: (){
                                              setState(() {
                                                shopProvider.removeFromCart(widget.productToBuy[index].product);
                                              });
                                            }, 
                                            icon: const Icon(Icons.remove)
                                          ),
                                          Text(shopProvider.getQuantity(widget.productToBuy[index].product).toString(),
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold
                                              ),
                                          ),
                                          IconButton(
                                            onPressed: (){
                                              setState(() {
                                                  shopProvider.addToCart(widget.productToBuy[index].product);
                                              });
                                            }, 
                                            icon: const Icon(Icons.add)
                                          )
                                        ],
                                      ),
                                      IconButton( 
                                        icon: Icon( 
                                          shopProvider.isFavorite(widget.productToBuy[index].product) ? Icons.favorite : Icons.favorite_border ,
                                          color: Colors.black),
                                        onPressed: () => shopProvider.toggleFavorite(widget.productToBuy[index].product)
                                      ),
                                    ],
                                  )
                                          
                            )
                      )
                                        
                         )
                                      
                    );
                   }
                ),
                Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Total:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold )),
                          Text('\$${_totalPrice.toStringAsFixed(2)}',
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)
                        ]
                      ),
                      const SizedBox(height: 14,),
                      ElevatedButton(
                        onPressed: _totalPrice > 0 ? (){
                          showDialog( 
                            context: context,
                            builder: (BuildContext context) {
                              return ShowPaymentPopup(selectedProduct: _selectedProduct);
                            },
                          );
                        } : null, 
                        style: ElevatedButton.styleFrom(
                            shape: const RoundedRectangleBorder( 
                              borderRadius: BorderRadius.zero
                            ),
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.black,
                          ),
                        child: const Text('BUY')
                       
                      ),
                    ]
                  )
                ),
              ]
            )      
          )
        ) 
      ]
    );
  }
}