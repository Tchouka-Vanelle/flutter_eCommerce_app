import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_management/models/product.dart';

class RecommendedForYouSection extends StatelessWidget {
  const RecommendedForYouSection({super.key, required this.recommendedForYou});
  final List<Product> recommendedForYou;

  @override
  Widget build(BuildContext context) {
    return  Column( 
      mainAxisAlignment: MainAxisAlignment.start,
      children: [ 
          const Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [ 
              Text( 
                  'Recommended for you',
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
                alignment: WrapAlignment.start,
                spacing: 7, //espace horizontale
                runSpacing: 5, // espace vertical
                children: recommendedForYou.map((e) => (
                    Container( 
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration( 
                        color:  Colors.grey[300],
                        border: Border.all( 
                          color: Colors.grey.shade600,
                          width: 1.5,
                        ), 
                      ),
                      child: SizedBox(
                        width: 100,
                      child: Row(
                        
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [ 
                          Image(image: AssetImage('assets/product_images/${e.image}.png'),
                                width: 40,  height: 40,),
                          const SizedBox(width: 4),
                          Text(e.name,)
                        ],
                      ))
                    )
                  )).toList(),
              )
            )
          )
      ],
    );
  }
}