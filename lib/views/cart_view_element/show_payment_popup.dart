import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management/models/product.dart';
import 'package:task_management/utils/shop_provider.dart';

class ShowPaymentPopup extends StatefulWidget{
  const ShowPaymentPopup({super.key, required this.selectedProduct});

  final List<Product> selectedProduct;

  @override
  State<ShowPaymentPopup> createState() => _ShowPaymentPopupState();
}

class _ShowPaymentPopupState extends State<ShowPaymentPopup> {
  final TextEditingController cardNumberController = TextEditingController();

  final TextEditingController cardHolderController = TextEditingController();

  final TextEditingController cvvController = TextEditingController();

  final TextEditingController expirationDateController = TextEditingController();

  DateTime? expirationDate;

  @override
  Widget build (BuildContext context) {
     
    final shopProvider = Provider.of<ShopProvider>(context);
    return  AlertDialog(

      contentPadding:  const EdgeInsets.all(16),
      shape: RoundedRectangleBorder( 
        borderRadius: BorderRadius.circular(11),
      ),      
      content: ConstrainedBox(
        constraints: const BoxConstraints(
            maxHeight: 300,
            maxWidth: 400,
        ),
        child:  SingleChildScrollView(
          padding: const EdgeInsets.only(right: 14),
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisSize: MainAxisSize.min, // only use the necessary space
            children: [
               SizedBox(
                width: 350,
                child: TextField(
                  controller: cardNumberController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Card Number",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 10,),
               SizedBox(
                width: 350,
                child: TextField(
                  controller: cardHolderController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: "Card Holder",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 200,
                    child: TextField(
                      controller: expirationDateController,
                      readOnly: true,
                      keyboardType: TextInputType.datetime,
                      decoration: const InputDecoration(
                        labelText: "Expiration date    ",
                        border: OutlineInputBorder(),
                      ),
                      onTap: () async {
                        final pickedDate = await showDatePicker(
                          context: context,
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now().add(const Duration(days: 365*15))
                        );
                        if (pickedDate != null){
                          setState(() {
                            expirationDate = pickedDate;
                            expirationDateController.text = 
                              "${pickedDate.month.toString().padLeft(2, '0')}/${pickedDate.year}";
                          });
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: TextField(
                      controller: cvvController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: "CVV        ",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25,),
              const Text("By confirm the payment, you agree to the property rules, terms and conditions, privacy policy",
                  style: TextStyle(fontSize: 7),
              ),
              const SizedBox(height: 10,)
            ],
          ),
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () {Navigator.of(context).pop();}, 
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder( 
                  borderRadius: BorderRadius.zero
                ),
                backgroundColor: Colors.blue,
                foregroundColor: Colors.black,
              ),
              child: const Text('CANCEL')
            ),
            ElevatedButton(
              onPressed: () {
                if(cardNumberController.text.isEmpty ||
                   cardHolderController.text.isEmpty ||
                   expirationDate == null ||
                   cvvController.text.isEmpty
                ) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Please fill all fields!"),
                      backgroundColor: Colors.red,
                    )
                  );
                } else {
                  Navigator.of(context).pop();
                  widget.selectedProduct.forEach(shopProvider.removeFromCart);
                }

              }, 
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder( 
                  borderRadius: BorderRadius.zero
                ),
                backgroundColor: Colors.blue,
                foregroundColor: Colors.black,
              ),
              child: const Text('CONFIRM 😊')
            ),
          ],
        ),
      ],
    );
  }
}