import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management/models/category.dart';
import 'package:task_management/models/search_product_arguments.dart';
import 'package:task_management/utils/functions/perform_search.dart';
import 'package:task_management/utils/functions/product_provider.dart';

class ShopByCategory extends StatelessWidget {
  const ShopByCategory({super.key, required this.shopByCategory});
  final List<Category> shopByCategory;


  @override
  Widget build(BuildContext context) {
    
    
    final productProvider = Provider.of<ProductProvider>(context);

     return Column( 
      mainAxisAlignment: MainAxisAlignment.start,
      children: [ 
          const Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [ 
              Text( 
                  'Shop by Category',
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
                  runAlignment: WrapAlignment.start,
                  spacing: 7, //space horizontal
                  runSpacing: 5,
                  children: shopByCategory.map((e) => (
                    Container( 
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
                        height: 40,
                        child: IntrinsicWidth(
                          child:   GestureDetector(
                                  onTap: () {
                                      Navigator.of(context).pushNamed('/search_product_view', 
                                      arguments: SearchProductArguments(page: 1, initialProductToDisplay: performSearch(e.name, productProvider))
                                    );
                                  },
                                  child:  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [ 
                                      Image(image: AssetImage('assets/product_images/${e.photo}.png'),
                                            width: 40,  height: 40,),
                                      const SizedBox(width: 7),
                                      Text(e.name,)
                                    ],
                                  )
                          )
                        )
                      )
                    )
                  )).toList(),
                )
              )
            )
      ],
    );
  }
}




