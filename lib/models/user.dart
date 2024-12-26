class User {
  int id;
  String email;
  String userName;
  static User? currentUser;// to save the connected user


  User({ required this.id, required this.userName, required this.email});

  factory User.fromJson(Map<String, dynamic> jsonVal){
    return User( 
      id: jsonVal['id'],
      userName: jsonVal['username'],
      email: jsonVal['email']
    );
  }

}
