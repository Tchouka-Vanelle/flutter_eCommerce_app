import 'package:flutter/material.dart';
import 'package:task_management/models/product.dart';
import 'package:task_management/views/show_product_details.dart';

class RecommendedForYouSection extends StatelessWidget {
  const RecommendedForYouSection({super.key, required this.recommendedForYou});
  final List<Product> recommendedForYou;

  @override
  Widget build(BuildContext context) {
    return  Column( 
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
                child: Row(
                  children:  recommendedForYou.asMap().entries.map((pro) {

                    Product e = pro.value;
                    
                    return Container( 
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
                              GestureDetector(
                                onTap: () {
                                  showDialog( 
                                    context: context,
                                    builder: (BuildContext context) {
                                      return  ShowProductDetails(product: e);
                                    },
                                  );
                                },
                                child: Image(image: AssetImage('assets/product_images/${e.images[0]}.png'),
                                    width: 30,  height: 30,),
                              ),
                              const SizedBox(width: 4),
                              Text(e.name,)
                            ],
                          )
                        )
                      )
                    );
                  }).toList(),
                )
              )
            )
          )
      ],
    );
  }
}