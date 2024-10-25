import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class Authentification {

  static const String apiUrl = 'https://jsonplaceholder.typicode.com/users';

  static Future<User?> login(String userEmail, String password) async {
    final response = await http.get(Uri.parse('$apiUrl?email=$userEmail&username=$password'));


    // we check if the request succeed
    if(response.statusCode == 200) {
      List<dynamic> usersList = jsonDecode(response.body);

      if(usersList.isNotEmpty){
        return User.fromJson(usersList[0]);
      }
    } else {
      //echec
      throw Exception('Failed to load user: ${response.statusCode}');
    }
    return null;
  }

}


