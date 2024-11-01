
import 'package:flutter/material.dart';

class NavbarApp extends StatelessWidget {
 
  final int currentIndex;
  final Function(int) onTabSelected;

  const NavbarApp({super.key, required this.currentIndex, required this.onTabSelected});

  @override
  Widget build(BuildContext context) {
    return  BottomNavigationBar( 

        currentIndex: currentIndex,
        onTap: onTabSelected,
        selectedItemColor: Colors.blue,
        selectedFontSize: 14,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        backgroundColor: const Color.fromARGB(223, 255, 255, 255),
        items: const [ 
          BottomNavigationBarItem( 
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem( 
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem( 
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem( 
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem( 
            icon: Icon(Icons.people),
            label: 'Login',
          ),
        ],
    );
  }

}




