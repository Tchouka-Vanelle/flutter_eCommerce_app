import 'package:flutter/material.dart';
import 'package:task_management/models/product.dart';
import 'package:task_management/views/cart_view_element/show_payment_popup.dart';
import 'package:task_management/views/show_product_details.dart';

class ProductToBuy extends StatefulWidget {
  const ProductToBuy({super.key, required this.productToBuy});

  final List<Product> productToBuy;

  @override
  State<ProductToBuy> createState() => _ProductToBuyState();
}

class _ProductToBuyState extends State<ProductToBuy> {
  late List<bool> _isChecked;
  late List<int> _quantity;
  @override
  void initState(){
    super.initState();
     _isChecked = List<bool>.filled(widget.productToBuy.length, false);
     _quantity = List<int>.filled(widget.productToBuy.length, 1);
  }
 double get _totalPrice => widget.productToBuy
            .asMap().entries.where((entry) => _isChecked[entry.key])
            .fold(
              0.0,
              (sum, entry) => sum + (entry.value.price * _quantity[entry.key]) );

  @override
  Widget build(BuildContext context) {


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
                      debugPrint('Building item at index $index: ${widget.productToBuy[index].name}');
                      return 
                        Card(
                          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                          child: SizedBox(
                            height: 80,
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
                              title:Text(widget.productToBuy[index].name, 
                                    style: const TextStyle(fontSize: 17),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,),
                              subtitle: Text('Price: \$${widget.productToBuy[index].price.toStringAsFixed(2)}',
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(fontSize: 18),
                                        maxLines: 1,),
                              trailing: SizedBox(
                                width: 240,
                                child: GestureDetector(
                                  onTap: () {
                                    debugPrint('Tapped on product details for ${widget.productToBuy[index].name}');
                                    showDialog( 
                                      context: context,
                                      builder: (BuildContext context) {
                                        return  ShowProductDetails(product: widget.productToBuy[index], index: index);
                                      },
                                    );
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container( 
                                        padding: const EdgeInsets.all(7),
                                        margin: const EdgeInsets.all(7),
                                        decoration: BoxDecoration( 
                                          color:  Colors.grey[70],
                                          border: Border.all( 
                                            color: Colors.grey.shade300,
                                            width: 1.5,
                                          ), 
                                        ),
                                        child: SizedBox(
                                          height: double.infinity,
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [ 
                                              Image(image: AssetImage('assets/product_images/${widget.productToBuy[index].images[0]}.png'),
                                                    width: 100,  height: 100,),
                                            ],
                                          )
                                        )
                                      ),
                                      SizedBox(
                                        width: 100,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            IconButton(
                                              onPressed: (){
                                                setState(() {
                                                  if(_quantity[index] > 1) {
                                                    _quantity[index]--;
                                                  }else{
                                                    widget.productToBuy.removeAt(index);
                                                  }
                                                });
                                              }, 
                                              icon: const Icon(Icons.remove)
                                            ),
                                            Text(_quantity[index].toString()),
                                            IconButton(
                                              onPressed: (){
                                                setState(() {
                                                    _quantity[index]++;
                                                });
                                              }, 
                                              icon: const Icon(Icons.add)
                                            )
                                          ],
                                        ),
                                      ),
                                              
                                    ],
                                  )
                                ),
                              )
                                              
                            ),
                          ),
                          
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
                        onPressed: _totalPrice > 0 ? () => showPaymentPopup(context) : null, 
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

                ])
                  
                )
              )
            
      ],
    );
  }
}