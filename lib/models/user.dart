class User {
  String email;
  String userName;
  static User? currentUser;// to save the connected user


  User({required this.userName, required this.email});

  factory User.fromJson(Map<String, dynamic> jsonVal) {
    return User(
      userName: jsonVal['username'],
      email: jsonVal['email'],
    );
  }

}