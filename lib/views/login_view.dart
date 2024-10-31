import 'package:flutter/material.dart';
import 'package:task_management/models/user.dart';
import '../controllers/authentification.dart';
import 'package:google_sign_in/google_sign_in.dart';

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

    try {
      var user = await Authentification.login(email, password);

      if(user != null) {
        //Check if the widget is still mounted before going to context
        if(!mounted) return; 

        User.currentUser = user;
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

  //Method to manage the connexion with google
  Future<void> _loginWithGoogle() async {
    try {
      GoogleSignIn _googleSignIn = GoogleSignIn();
      final googleUser = await _googleSignIn.signIn();

      if (googleUser != null){
          User.currentUser = User( 
            email: googleUser.email,
            userName: googleUser.displayName ?? 'Google User'
          );

          if(!mounted) return;
          Navigator.pushReplacementNamed(context, '/searchPage');
      }

    } catch(e) {
      setState(() {
        _errorMessage= 'Connection error with google! please try again!';
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
                const Text('SIGN IN'),
                const SizedBox(height: 40),
                TextField( 
                  controller: _emailController,
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
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: _login,
                  child: const Text('Sign In'),
                ),
                
                const SizedBox(height: 35),

                const Text('Or Sign in with'),
                const SizedBox(height: 10),
                ElevatedButton( 
                  onPressed: _loginWithGoogle,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder( 
                      borderRadius: BorderRadius.circular(7)
                    ),
                    padding: const EdgeInsets.all(1),
                    minimumSize: const Size(20, 20),
                  ),
                   child: Image.asset( 
                    'assets/images/connexion/googleSignIn.jpeg',
                    height: 14,
                    width: 14

                  ),
                ),

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







