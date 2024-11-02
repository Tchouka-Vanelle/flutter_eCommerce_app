import 'package:flutter/material.dart';

class SearchSection extends StatelessWidget {
  SearchSection({super.key, required this.searchEntry});
  final Function(String) searchEntry;

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
   
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
          onSubmitted: (value) => searchEntry(value),
        ),
      ),
      const SizedBox(width: 5),
      ElevatedButton(
        onPressed: () {searchEntry(_searchController.text);},
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