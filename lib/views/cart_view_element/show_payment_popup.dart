import 'package:flutter/material.dart';

void showPaymentPopup (BuildContext context) {
  showDialog(
    context: context, 
    builder: (context) =>  AlertDialog(
      content: const Column(
        children: [
          TextField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: "Card Number",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10,),
          TextField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: "Card Holder",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Expiration date    ",
                  border: OutlineInputBorder(),
                ),
              ),
              TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "CVV        ",
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
          SizedBox(height: 25,),
          Text("By confirm the payment, you agree to the property rules, terms and conditions, privacy policy",
              style: TextStyle(fontSize: 7),
          ),
          SizedBox(height: 10,)
        ],
      ),
      actions: [
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
          onPressed: () {Navigator.of(context).pop();}, 
          style: ElevatedButton.styleFrom(
            shape: const RoundedRectangleBorder( 
              borderRadius: BorderRadius.zero
            ),
            backgroundColor: Colors.blue,
            foregroundColor: Colors.black,
          ),
          child: const Text('CONFIRM')
        ),
      ],
    )
  );
}