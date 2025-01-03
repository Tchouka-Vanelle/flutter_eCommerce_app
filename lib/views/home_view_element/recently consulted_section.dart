import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management/models/search_product_arguments.dart';
import 'package:task_management/utils/functions/perform_search.dart';
import 'package:task_management/utils/functions/product_provider.dart';

class RecentlyConsultedSection extends StatelessWidget {

  const RecentlyConsultedSection({super.key, required this.recentlyConsulted});
  final List<String> recentlyConsulted;

  @override
  Widget build(BuildContext context) {
    
    final productProvider = Provider.of<ProductProvider>(context);

    return  Column( 
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [ 
          const Text( 
                'Recently Consulted',
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
              child: Wrap( 
                alignment: WrapAlignment.start,
                spacing: 7, //espace horizontale
                runSpacing: 5, // espace vertical
                children: recentlyConsulted.map((e) => (
                    Container( 
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration( 
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(14)
                      ),
                      child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed('/search_product_view', 
                                  arguments: SearchProductArguments(page: 1, initialProductToDisplay: performSearch(e, productProvider))
                              );
                            },
                            child: Text(e, style: const TextStyle(fontSize: 16))
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