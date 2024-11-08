import 'package:flutter/material.dart';

class RecentSearchesSection extends StatelessWidget {

  const RecentSearchesSection({super.key, required this.recentSearches});
  final List<String> recentSearches;

  @override
  Widget build(BuildContext context) {
    
    return  Column( 
      mainAxisAlignment: MainAxisAlignment.start,
      children: [ 
          Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [ 
              const Text( 
                    'Recent Searches',
                    style: TextStyle( 
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                ),
              IconButton(
                  onPressed: (){}, 
                  icon: const Icon(Icons.delete),
                  color: const Color.fromARGB(255, 26, 45, 91),
                )
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
                children: recentSearches.map((e) => (
                    Container( 
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration( 
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(14)
                      ),
                      child: Text(e, style: const TextStyle(fontSize: 16)),
                    )
                  )).toList(),
              )
            )
          )
      ],
    );
  }

  
}