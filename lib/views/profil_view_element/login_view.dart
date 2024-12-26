import 'package:flutter/material.dart';
import 'package:task_management/models/product.dart';
import 'package:task_management/models/user.dart';
import 'package:task_management/models/user_session.dart';
import '../../controllers/authentification.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  
  bool _isLoading = false;
  String _errorMessage = '';
  bool _isPasswordVisible = false;

  //Method to manage the connexion with an email and an password
  Future<void> _login() async {

    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    String email = _emailController.text;
    String password = _passwordController.text;
    

    UserSession session = await UserSession.instance;

    try {
      var user = await Authentification.login(email, password);
      if(user != null) {
        //Check if the widget is still mounted before going to context
        if(!mounted) return; 

        User.currentUser = user;
         
        session.setUserEmail(email);
        session.setUserId(user.id);
        session.setIsLoggedIn(true);

        var cartItems = [
        Product(description: 'description2', price: 18.0, images: ['coat'], id: 2, name: 'coattttttttttttttttttttttttttttt tttttttttt', nbrAchat: 15),
        Product(description: 'description5', price: 14.0, images: ['robe'], id: 4, name: 'tshirt', nbrAchat: 7),
        Product(description: 'description6', price: 18.0, images: ['coat'], id: 2, name: 'jupe', nbrAchat: 7),
        ];
        var favItems =  [
        Product(description: 'description1 oi zkzks  n,kpq^dl qskdp jjjjjjjj kkkkkkk o nnkkk llll ppppp eeeee ttt y y m zz eer zzzz eedd eer zzz zzz ee eee pppp jjj hhhh fder', price: 14.0, images: ['robe', 'coat', 'robe', 'coat'], id: 1, name: 'robe', nbrAchat: 18),
        Product(description: 'description2', price: 18.5, images: ['coat'], id: 2, name: 'coattttttttttttttttttttttttttttt tttttttttt', nbrAchat: 15),
        Product(description: 'description3 kal lpzpz pp', price: 27.0, images: ['robe'], id: 3, name: 'pantalon', nbrAchat: 14),];

        session.setCartItems(cartItems);
        session.setFavItems(favItems);

        session.saveSession();

        // redirection to search page
        Navigator.pushReplacementNamed(context, '/pages');
      }else {
        setState(() {
          _errorMessage = 'email or password incorrect';
        });
      }
    } catch(e) {
      setState(() {
        _errorMessage= 'connection error! please try again!';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold( 
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Stack( 
        children: [
          Padding( 
            padding: const EdgeInsets.all(17.0),
            child: Column( 
              mainAxisAlignment: MainAxisAlignment.center,
              children: [ 
                const Icon(Icons.lock, size: 54),
                const SizedBox(height: 40),
                TextField( 
                  controller: _emailController,
                   keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                   
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                const SizedBox(height: 20),
                TextField( 
                  controller: _passwordController,
                  obscureText: !_isPasswordVisible,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton( 
                      icon: Icon( 
                        _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      }
                    )
                  ),
                  onSubmitted: (_) => _login(),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom( 
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Sign In')
                ),
                
                const SizedBox(height: 35),

                if(_errorMessage.isNotEmpty)
                  Text( 
                    _errorMessage,
                    style: const TextStyle(color: Colors.red),
                  ),
              ],
            )
          ),
          if(_isLoading)
            Container( 
              color: Colors.black54,
              child: const Center(child: CircularProgressIndicator())
            )   
        ]
      )
    );
  }
}






