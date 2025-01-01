import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management/models/product.dart';
import 'package:task_management/utils/functions/perform_search.dart';
import 'package:task_management/utils/functions/product_provider.dart';

class SearchSection extends StatefulWidget {
  const SearchSection({super.key});

  @override
  State<SearchSection> createState() => _SearchSectionState();
}

class _SearchSectionState extends State<SearchSection> {
  final TextEditingController _searchController = TextEditingController();
  
  List<Product> productToDisplay = [];
 

  @override
  Widget build(BuildContext context) {
   
   final productProvider = Provider.of<ProductProvider>(context);

   return Row(
    children: [ 
      Expanded(
        child: TextField( 
          controller: _searchController,
          keyboardType: TextInputType.text,
          decoration: InputDecoration( 
            labelText: 'Search...',
            hintText: 'Enter search term',
            border: OutlineInputBorder( 
              borderRadius: BorderRadius.circular(7)
            ),
            prefixIcon: const Icon(Icons.search)
          ),
          onSubmitted: (value) => {
            setState(() {
              productToDisplay = performSearch(value, productProvider);
            })
          },
        ),
      ),
      const SizedBox(width: 5),
      ElevatedButton(
        onPressed: () {performSearch(_searchController.text, productProvider);},
        style: ElevatedButton.styleFrom( 
          shape: RoundedRectangleBorder( 
            borderRadius: BorderRadius.circular(27),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
        ),
        child: const Icon(Icons.search, size: 27,)
      )
    ],
   );
  }
}