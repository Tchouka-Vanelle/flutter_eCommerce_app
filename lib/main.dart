import 'package:flutter/material.dart';
import 'package:task_management/models/cart_item.dart';
import 'package:task_management/models/product.dart';
import 'package:task_management/models/user_session.dart';
import 'package:task_management/utils/my_app_pages.dart';
import 'package:task_management/utils/shop_provider.dart';
import 'views/profil_view_element/login_view.dart';
import 'package:provider/provider.dart';

void main() async{
  /** ensures that Flutter is fully initialized before running any code
   *  that depends on it, such as access to SharedPreferences */
  WidgetsFlutterBinding.ensureInitialized();

  UserSession session = await UserSession.instance;

  final shopProvider = ShopProvider();

    // Recharge les données si l'utilisateur est connecté
    if (session.isLoggedIn) {
       shopProvider.favItems = [
        Product(id: 1, description: 'description1 oi zkzks  n,kpq^dl qskdp jjjjjjjj kkkkkkk o nnkkk llll ppppp eeeee ttt y y m zz eer zzzz eedd eer zzz zzz ee eee pppp jjj hhhh fder', price: 14.0, images: ['robe', 'coat', 'robe', 'coat'], name: 'robe', nbrAchat: 18),
        Product(id: 2, description: 'description2', price: 18.0, images: ['coat'], name: 'coattttttttttttttttttttttttttttt tttttttttt', nbrAchat: 15),
        Product(id: 6, description: 'description6', price: 41.0, images: ['coat'], name: 'jupe', nbrAchat: 7),
      ];
      var cartItems = [
        Product(id: 1, description: 'description1 oi zkzks  n,kpq^dl qskdp jjjjjjjj kkkkkkk o nnkkk llll ppppp eeeee ttt y y m zz eer zzzz eedd eer zzz zzz ee eee pppp jjj hhhh fder', price: 14.0, images: ['robe', 'coat', 'robe', 'coat'], name: 'robe', nbrAchat: 18),
        Product(id: 3, description: 'description3 kal lpzpz pp', price: 24.0, images: ['robe'], name: 'pantalon', nbrAchat: 14),
        Product(id: 5, description: 'description5', price: 33.0, images: ['robe'], name: 'tshirt', nbrAchat: 7),
      ];
      var cartItemList = cartItems.map((product) => CartItem(product: product, quantity: 1)).toList();
      shopProvider.cartItems = cartItemList;
    }

  debugPrint('Après déconnexion : isLoggedIn = ${session.isLoggedIn}');
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => shopProvider)
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
        '/pages': (context) => const MyAppPages()
      },
      home: isLoggedIn == true ?  const MyAppPages() : const LoginView(),
    );
  }
}

