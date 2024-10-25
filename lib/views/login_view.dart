import 'package:flutter/material.dart';
import '../controllers/user_service.dart';
import '../controllers/authentification.dart';

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


  //Method to manage the connexion
  Future<void> _login() async {

    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    String email = _emailController.text;
    String password = _passwordController.text;

    try {
      var user = await Authentification.login(email, password);

      if(user != null) {
        //Check if the widget is still mounted before going to context
        if(!mounted) return; 

        // redirection to search page
        Navigator.pushReplacementNamed(context, '/searchPage');
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
      appBar: AppBar(title: const Text('Identification')),
      body: Stack( 
        children: [
          Padding( 
            padding: const EdgeInsets.all(17.0),
            child: Column( 
              mainAxisAlignment: MainAxisAlignment.center,
              children: [ 
                TextField( 
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
                TextField( 
                  controller: _passwordController,
                  decoration: const InputDecoration(labelText: 'password'),
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _login,
                  child: const Text('Sign In'),
                ),
                if(_errorMessage.isNotEmpty)
                  Text( 
                    _errorMessage,
                    style: const TextStyle(color: Colors.red),
                  )
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







