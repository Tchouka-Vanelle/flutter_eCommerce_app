import 'package:flutter/material.dart';

class ShowPaymentPopup extends StatelessWidget{
  const ShowPaymentPopup({super.key});
  
  @override
  Widget build (BuildContext context) {
     
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
        child: const SingleChildScrollView(
          padding: EdgeInsets.only(right: 14),
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisSize: MainAxisSize.min, // only use the necessary space
            children: [
              SizedBox(
                width: 350,
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Card Number",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              SizedBox(
                width: 350,
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Card Holder",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 200,
                    child: TextField(
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                        labelText: "Expiration date    ",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: TextField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: "CVV        ",
                        border: OutlineInputBorder(),
                      ),
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
              onPressed: () {Navigator.of(context).pop();}, 
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