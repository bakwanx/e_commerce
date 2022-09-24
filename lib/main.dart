import 'package:e_commerce/providers/auth_provider.dart';
import 'package:e_commerce/providers/cart_provider.dart';
import 'package:e_commerce/providers/page_provider.dart';
import 'package:e_commerce/providers/product_provider.dart';
import 'package:e_commerce/providers/transaction_provider.dart';
import 'package:e_commerce/providers/wishlist_provider.dart';
import 'package:e_commerce/views/cart_screen.dart';
import 'package:e_commerce/views/checkout_screen.dart';
import 'package:e_commerce/views/checkout_success_screen.dart';
import 'package:e_commerce/views/edit_profile_screen.dart';
import 'package:e_commerce/views/fragments/main_screen.dart';
import 'package:e_commerce/views/login_screen.dart';
import 'package:e_commerce/views/register_screen.dart';
import 'package:e_commerce/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PageProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WishlistProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TransactionProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashScreen(),
          '/login': (context) => LoginScreen(),
          '/register': (context) => RegisterScreen(),
          '/main-screen': (context) => MainScreen(),
          '/edit-profile': (context) => EditProfileScreen(),
          '/cart': (context) => CartScreen(),
          '/checkout': (context) => CheckoutScreen(),
          '/checkout-success': (context) => CheckoutSuccessScreen(),
        },
      ),
    );
  }
}
