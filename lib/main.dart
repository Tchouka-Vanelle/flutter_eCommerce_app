import 'package:flutter/material.dart';
import 'package:task_management/models/product.dart';
import 'package:task_management/models/user_session.dart';
import 'package:task_management/views/my_app_pages.dart';
import 'views/profil_view_element/login_view.dart';

void main() async{
  /** ensures that Flutter is fully initialized before running any code
   *  that depends on it, such as access to SharedPreferences */
  WidgetsFlutterBinding.ensureInitialized();

  UserSession session = await UserSession.instance;

    // Recharge les données si l'utilisateur est connecté
    if (session.isLoggedIn) {
      session.setCartItems([
        Product(description: 'description1 oi zkzks  n,kpq^dl qskdp jjjjjjjj kkkkkkk o nnkkk llll ppppp eeeee ttt y y m zz eer zzzz eedd eer zzz zzz ee eee pppp jjj hhhh fder', price: 14.0, images: ['robe', 'coat', 'robe', 'coat'], id: 1, name: 'robe', nbrAchat: 18),
        Product(description: 'description2', price: 18.0, images: ['coat'], id: 2, name: 'coat', nbrAchat: 15),
        Product(description: 'description5', price: 14.0, images: ['robe'], id: 4, name: 'tshirt', nbrAchat: 7),
      ]);
      session.setFavItems([
         Product(description: 'description1 oi zkzks  n,kpq^dl qskdp jjjjjjjj kkkkkkk o nnkkk llll ppppp eeeee ttt y y m zz eer zzzz eedd eer zzz zzz ee eee pppp jjj hhhh fder', price: 14.0, images: ['robe', 'coat', 'robe', 'coat'], id: 1, name: 'robe', nbrAchat: 18),
        Product(description: 'description1', price: 14.0, images: ['robe'], id: 1, name: 'robe', nbrAchat: 18),
      ]);
    }

  runApp(MyApp(isLoggedIn: session.isLoggedIn));
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
      home: isLoggedIn != false ?  const MyAppPages() : const LoginView(),
    );
  }
}

