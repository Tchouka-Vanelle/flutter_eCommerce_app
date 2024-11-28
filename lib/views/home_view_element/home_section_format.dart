import 'package:flutter/material.dart';
import 'package:task_management/models/product.dart';

class HomeSectionFormat extends StatelessWidget {
  const HomeSectionFormat({super.key, required this.value, required this.name});
  final List<Product> value;
  final String name;

  @override
  Widget build(BuildContext context) {
    return  Column( 
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [ 
          Text( 
              name,
              style: const TextStyle( 
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
          ),
           
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 7),
            child: SizedBox(
              height: 110,
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8, //horizontal space
                  mainAxisSpacing: 8 // vertical space
                ),
                itemCount: value.length,
                itemBuilder: (context, index) {
                  final e = value[index];
                  print('Product name: ${e.name}');
                  return Container( 
                      padding: const EdgeInsets.all(7),
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
                              Image(image: AssetImage('assets/product_images/${e.images[0]}.png'),
                                    width: 30,  height: 30,),
                              const SizedBox(width: 4),
                              Expanded(child: Text(e.name, maxLines: 1,))
                            ],
                          )
                        )
                      )
                    );
                }
              ),
               
            )
          )
      ],
    );
  }
}