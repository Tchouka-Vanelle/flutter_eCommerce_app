import 'package:flutter/material.dart';
import 'package:task_management/views/cart_view.dart';
import 'package:task_management/views/favorite_view.dart';
import 'package:task_management/views/home_view.dart';
import 'package:task_management/views/login_view.dart';
import 'package:task_management/views/nav_bar_app.dart';
import 'package:task_management/views/search_product_view.dart';

class MyAppPages extends StatefulWidget {
  const MyAppPages({super.key});

  @override
  State<MyAppPages> createState() => _MyAppPagesState();
}

class _MyAppPagesState extends State<MyAppPages> {

  int page = 1;
  void onTabSelected(int val) => setState(() {page = val;});

  //  list of pages
  final List<Widget> pages = const [
    HomeView(),
    SearchProductView(),
    FavoriteView(),
    CartView(),
    LoginView()
  ];
  final List<String> titles = const [
    'Home',
    'Search',
    'Favorite',
    'Cart',
    'Login'
  ];

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
    
      body: pages[page],
      bottomNavigationBar: NavbarApp(
        currentIndex: page, onTabSelected: onTabSelected),
    );
  }
}






