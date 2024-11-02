
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
        items: [ 
          BottomNavigationBarItem( 
            icon: _buildCircleIcon(Icons.home_filled, currentIndex, 0),
            label: 'Home',
          ),
          BottomNavigationBarItem( 
            icon: _buildCircleIcon(Icons.search, currentIndex, 1),
            label: 'Search',
          ),
          BottomNavigationBarItem( 
            icon: _buildCircleIcon(Icons.favorite, currentIndex, 2),
            label: 'Favorite',
          ),
          BottomNavigationBarItem( 
            icon: _buildCircleIcon(Icons.shopping_cart, currentIndex, 3),
            label: 'Cart',
          ),
          BottomNavigationBarItem( 
            icon: _buildCircleIcon(Icons.people, currentIndex, 4),
            label: 'Login',
          ),
        ],
    );
  }

}

Widget _buildCircleIcon(IconData icon, int currentIndex, int index) {
  final isSelected = currentIndex == index;
  return Container(
    decoration: BoxDecoration(
      color: isSelected ? Colors.blue.withOpacity(0.2) : const Color.fromARGB(255, 104, 99, 99), // Couleur du cercle en fond
      shape: BoxShape.circle,
    ),
    padding: const EdgeInsets.all(4.0),
    child: Icon(icon, color: isSelected ? Colors.blue : Colors.black), // Couleur de l'icône
  );
}




