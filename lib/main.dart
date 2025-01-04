import 'package:flutter/material.dart';
import 'package:task_management/models/cart_item.dart';
import 'package:task_management/models/category.dart';
import 'package:task_management/models/product.dart';
import 'package:task_management/models/product_category.dart';
import 'package:task_management/models/search_product_arguments.dart';
import 'package:task_management/models/user_session.dart';
import 'package:task_management/utils/functions/product_provider.dart';
import 'package:task_management/views/structure_project_element/my_app_pages.dart';
import 'package:task_management/utils/functions/shop_provider.dart';
import 'views/profil_view_element/login_view.dart';
import 'package:provider/provider.dart';

void main() async{
  /** ensures that Flutter is fully initialized before running any code
   *  that depends on it, such as access to SharedPreferences */
  WidgetsFlutterBinding.ensureInitialized();

  UserSession session = await UserSession.instance;

  final shopProvider = ShopProvider();
  final productProvider = ProductProvider();

    // Reloads data if the user is logged in
    if (session.isLoggedIn) {
       shopProvider.favItems = [
        Product(id: 1, description: 'description1 oi zkzks  n,kpq^dl qskdp jjjjjjjj kkkkkkk o nnkkk llll ppppp eeeee ttt y y m zz eer zzzz eedd eer zzz zzz ee eee pppp jjj hhhh fder', price: 14.0, images: ['dress1', 'dress2', 'dress3', 'dress4'], name: 'dress', nbrAchat: 18),
        Product(id: 2, description: 'description2', price: 18.0, images: ['coat'], name: 'coattttttttttttttttttttttttttttt tttttttttt', nbrAchat: 15),
        Product(id: 6, description: 'description6', price: 41.0, images: ['bag'], name: 'bag', nbrAchat: 7),
      ];
      var cartItems = [
        Product(id: 1, description: 'description1 oi zkzks  n,kpq^dl qskdp jjjjjjjj kkkkkkk o nnkkk llll ppppp eeeee ttt y y m zz eer zzzz eedd eer zzz zzz ee eee pppp jjj hhhh fder', price: 14.0, images: ['dress1', 'dress2', 'dress3', 'dress4'], name: 'dress', nbrAchat: 18),
        Product(id: 3, description: 'description3 kal lpzpz pp', price: 24.0, images: ['pant'], name: 'pant', nbrAchat: 14),
        Product(id: 4, description: 'description4 lolipop', price: 29.0, images: ['sweater'],  name: 'sweater', nbrAchat: 11),
      ];
      var cartItemList = cartItems.map((product) => CartItem(product: product, quantity: 1)).toList();
      shopProvider.cartItems = cartItemList;
    }

    // Reload common data

    productProvider.allProducts = [
      
      Product(id: 1, description: 'description1 oi zkzks  n,kpq^dl qskdp jjjjjjjj kkkkkkk o nnkkk llll ppppp eeeee ttt y y m zz eer zzzz eedd eer zzz zzz ee eee pppp jjj hhhh fder', price: 14.0, images: ['dress1', 'dress2', 'dress3', 'dress4'], name: 'dress', nbrAchat: 18),
      Product(id: 2, description: 'description2', price: 18.0, images: ['coat'], name: 'coattttttttttttttttttttttttttttt tttttttttt', nbrAchat: 15),
      Product(id: 3, description: 'description3 kal lpzpz pp', price: 24.0, images: ['pant'], name: 'pant', nbrAchat: 14),
      Product(id: 4, description: 'description4 lolipop', price: 29.0, images: ['sweater'],  name: 'sweater', nbrAchat: 11),
      Product(id: 5, description: 'description5', price: 33.0, images: ['tshirt'], name: 'tshirt', nbrAchat: 7),
      Product(id: 6, description: 'description6', price: 41.0, images: ['bag'], name: 'bag', nbrAchat: 7),
      Product(id: 7, description: 'description7 kal lpzpz pp', price: 64.0, images: ['iphone'], name: 'iphone', nbrAchat: 4),
      Product(id: 8, description: 'description8 lolipop', price: 37.0, images: ['oven'],  name: 'oven appliance', nbrAchat: 2),
      Product(id: 9, description: 'description9', price: 5.0, images: ['earrings'], name: 'earrings', nbrAchat: 26),
      Product(id: 10, description: 'description10', price: 26.0, images: ['blender'], name: 'blender', nbrAchat: 36),
   
    ];

    productProvider.recentSearches= [];

    productProvider.recentlyConsulted = ['blender', 'bed', 'skirt', 'shoes', 'kitchen appliances'];

    productProvider.seasonSuggestion = [
      Product(id: 1, description: 'description1 oi zkzks  n,kpq^dl qskdp jjjjjjjj kkkkkkk o nnkkk llll ppppp eeeee ttt y y m zz eer zzzz eedd eer zzz zzz ee eee pppp jjj hhhh fder', price: 14.0, images: ['dress1', 'dress2', 'dress3', 'dress4'], name: 'dress', nbrAchat: 18),
      Product(id: 3, description: 'description3 kal lpzpz pp', price: 24.0, images: ['pant'], name: 'pant', nbrAchat: 14),
      Product(id: 4, description: 'description4 lolipop', price: 29.0, images: ['sweater'],  name: 'sweater', nbrAchat: 11),
      Product(id: 5, description: 'description5', price: 33.0, images: ['tshirt'], name: 'tshirt', nbrAchat: 7),
    ];

    productProvider.bestSelling = [
      Product(id: 9, description: 'description9', price: 5.0, images: ['earrings'], name: 'earrings', nbrAchat: 26),
      Product(id: 10, description: 'description10', price: 26.0, images: ['blender'], name: 'blender', nbrAchat: 36),
    ];

    productProvider.news = [
      Product(id: 7, description: 'description7 kal lpzpz pp', price: 64.0, images: ['iphone'], name: 'iphone', nbrAchat: 4),
      Product(id: 8, description: 'description8 lolipop', price: 37.0, images: ['oven'],  name: 'oven appliances', nbrAchat: 2),
    ];

    productProvider.categories = [
      
      Category(id: 1, name: "clothes", photo: "clothes"),
      Category(id: 2, name: "accessories", photo: "accessories"),
      Category(id: 3, name: "telephone", photo: "telephone"),
      Category(id: 4, name: "electro_menagers", photo: "electro_menagers"),
  
    ];

    productProvider.productCategory = [
      
      ProductCategory(idCategory: 1, idProduct: 4),
      ProductCategory(idCategory: 1, idProduct: 3),
      ProductCategory(idCategory: 1, idProduct: 1),
      ProductCategory(idCategory: 1, idProduct: 2),
      ProductCategory(idCategory: 1, idProduct: 5),
      ProductCategory(idCategory: 2, idProduct: 9),
      ProductCategory(idCategory: 2, idProduct: 6),
      ProductCategory(idCategory: 3, idProduct: 7),
      ProductCategory(idCategory: 4, idProduct: 8),
      ProductCategory(idCategory: 4, idProduct: 10),
  
    ];



  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => shopProvider),
        ChangeNotifierProvider(create: (_) => productProvider)
      ],
      child: MyApp(isLoggedIn: session.isLoggedIn)
    )
  );
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({super.key, required this.isLoggedIn});

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-COMMERCE APP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/pages': (context) => const MyAppPages(page: 0, initialProductToDisplay: []),
        
      },
      onGenerateRoute: (settings) {

        if (settings.name == '/search_product_view') {
          final args = settings.arguments;
          
          // Vérifiez si les arguments ne sont pas null avant de les caster
          if (args != null && args is SearchProductArguments) {
            return MaterialPageRoute(
              builder: (context) => MyAppPages(
                page: args.page,
                initialProductToDisplay: args.initialProductToDisplay
              )
            );
          }
        }
        return MaterialPageRoute(
            builder: (context) => const LoginView()
        );
      },
      home: isLoggedIn == true ?  const MyAppPages(page: 0, initialProductToDisplay: [],) : const LoginView(),
    );
  }
}

