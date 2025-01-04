import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:task_management/utils/functions/shop_provider.dart';
import 'package:task_management/views/profil_view_element/login_view.dart';
void main() {
  testWidgets('LoginView displays correct Widget', (WidgetTester tester) async {
    // Create a mock ProductProvider with fake data
    final mockShopProvider = ShopProvider();

    // Build the widget tree with the mock provider
    await tester.pumpWidget(
      ChangeNotifierProvider.value(
        value: mockShopProvider,
        child:  const MaterialApp(home:  LoginView())
        
      ),
    );

    // Wait for the widget to render
    await tester.pumpAndSettle();

    // Verify if the expected title is displayed on the HomeView
    expect(find.byType(Scaffold), findsOneWidget); 
    expect(find.byType(TextField), findsNWidgets(2)); 
  });
}
