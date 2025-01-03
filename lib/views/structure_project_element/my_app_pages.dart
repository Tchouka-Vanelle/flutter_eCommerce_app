import 'package:flutter/material.dart';
import 'package:task_management/models/product.dart';
import 'package:task_management/views/cart_view_element/cart_view.dart';
import 'package:task_management/views/favorite_view_element/favorite_view.dart';
import 'package:task_management/views/home_view_element/home_view.dart';
import 'package:task_management/views/structure_project_element/nav_bar_app.dart';
import 'package:task_management/views/profil_view_element/profil_menu.dart';
import 'package:task_management/views/search_product_element/search_product_view.dart';

class MyAppPages extends StatefulWidget {
  const MyAppPages({super.key, required this.page, required this.initialProductToDisplay});

  final int page;
  final List<Product> initialProductToDisplay;

  @override
  State<MyAppPages> createState() => _MyAppPagesState();
}

class _MyAppPagesState extends State<MyAppPages> {

  late int page;

  late List<Product> productToDisplay;

  @override
  void initState() {
    super.initState();
    page = widget.page;
    productToDisplay = widget.initialProductToDisplay; // Initialize from widget
  }


  void onTabSelected(int val) => setState(() {page = val;});

  final List<String> titles = const [
    'Home',
    'Search',
    'Favorite',
    'Cart',
  ];

  @override
  Widget build(BuildContext context) {
    
    
    // list of pages
    final List<Widget> pages =  [
      const HomeView(),
      SearchProductView(initialProductToDisplay: productToDisplay),
      const FavoriteView(),
      CartView(),
    ];

    return Scaffold(
      appBar: AppBar(
        actions: const [
          ProfilMenu()
        ],
      ),
      body: pages[page],
      bottomNavigationBar: NavbarApp(
        currentIndex: page, onTabSelected: onTabSelected),
    );
  }
}






