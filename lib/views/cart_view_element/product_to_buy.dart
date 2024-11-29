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
            'Recommended for you',
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
              child: SingleChildScrollView( 
                scrollDirection: Axis.horizontal,
                child: Column(
                  
                  children:[ ListView.builder(
                    itemCount: widget.productToBuy.length,
                    itemBuilder: (context, index) {
                      return 
                          Card(
                          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                          child: ListTile(
                            leading: Checkbox(
                              value: _isChecked[index], 
                              onChanged: (bool? val){
                                setState(() {
                                  _isChecked[index]=val ?? false;
                                });
                              }
                            ),
                            title: Text(widget.productToBuy[index].name, style: const TextStyle(fontSize: 12),),
                            subtitle: Text('Price: \$${widget.productToBuy[index].price.toStringAsFixed(2)}'),
                            trailing: GestureDetector(
                              onTap: () {
                                showDialog( 
                                  context: context,
                                  builder: (BuildContext context) {
                                    return  ShowProductDetails(product: widget.productToBuy[index], index: index);
                                  },
                                );
                              },
                              child: Row(
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
                                      height: 30,
                                      child: IntrinsicWidth(
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [ 
                                            Image(image: AssetImage('assets/product_images/${widget.productToBuy[index].images[0]}.png'),
                                                  width: 30,  height: 30,),
                                            const SizedBox(width: 4),
                                            Text(widget.productToBuy[index].name,)
                                          ],
                                        )
                                      )
                                    )
                                  ),
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
                              )
                            )
                  
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
                        ]),
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
            )
          
      ],
    );
  }
}