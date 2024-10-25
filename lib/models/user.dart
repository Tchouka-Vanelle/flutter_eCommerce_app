class User {
  final int userId;
  final String email;
  final String passWord;
  final String tel;

  User({required this.userId, required this.passWord, required this.email, required this.tel});

  factory User.fromJson(Map<String, dynamic> jsonVal) {
    return User(
      userId: jsonVal['id'],
      email: jsonVal['email'].toString(),
      passWord: jsonVal['username'].toString(),
      tel: jsonVal['phone']
    );
  }

}