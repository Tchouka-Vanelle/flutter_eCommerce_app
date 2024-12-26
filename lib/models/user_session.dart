import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_management/models/product.dart';


class UserSession {
  static UserSession? _instance;
  static SharedPreferences? _prefs;

  bool _isLoggedIn = false;
  int? _userId;
  String? _userEmail;
  List<Product> _cartItems = [];
  List<Product> _favItems = [];

  UserSession._privateConstructor();

  static Future<UserSession> get instance async{
    _instance ??= UserSession._privateConstructor();

    _prefs = await SharedPreferences.getInstance();
    await _instance!.loadSession();

    return _instance!;
  }

  bool get isLoggedIn => _prefs?.getBool('isLoggedIn') ?? false;
  int get userId => _prefs?.getInt('userId') ?? -1;
  String get userEmail => _prefs?.getString('userEmail') ?? '';
  List<Product> get cartItems => _cartItems;
  List<Product> get favItems => _favItems;

  // Setters
  void setIsLoggedIn(bool isLoggedIn) {
    _isLoggedIn = isLoggedIn;
    _prefs?.setBool('isLoggedIn', isLoggedIn);
  }

  void setUserId(int id) {
    _userId = id;
    _prefs?.setInt('userId', id);
  }

  void setUserEmail(String email) {
    _userEmail = email;
    _prefs?.setString('userEmail', email);
  }

  void setCartItems(List<Product> items) => _cartItems = items;
  void setFavItems(List<Product> items) => _favItems = items;

  // Add to cart
  void addToCart(Product product) {
    _cartItems.add(product);
    setCartItems(_cartItems);
  }

  // Remove from cart
  void removeFromCart(Product product) {
    _cartItems.remove(product);
    setCartItems(_cartItems);
  }

  // Add to fav
  void addToFavorites(Product product) {
    _favItems.add(product);
    setFavItems(_favItems);
  }

  // Remove from fav
  void removeFromFavorites(Product product) {
    _favItems.remove(product);
    setFavItems(_favItems);
  }

  // Save session to sharedPreferences
  Future<void> saveSession() async {
    _prefs?.setString('userEmail', _userEmail ?? '');
    _prefs?.setInt('userId', _userId ?? -1);
    _prefs?.setBool('isLoggedIn', _isLoggedIn);
  }

  // Load session from sharedPreferences
  Future<void> loadSession() async {
    _userId = _prefs?.getInt("userId") ?? -1;
    _userEmail = _prefs?.getString("userEmail") ?? '';
    _isLoggedIn = _prefs?.getBool("isLoggedIn") ?? false;
  }

  // Clear session
  Future<void> clearSession() async {
    await _prefs?.clear();
    _isLoggedIn = false;
    _userId = null;
    _userEmail = null;
    _cartItems.clear();
    _favItems.clear();
  }

}