import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/provider/data_class.dart';
import 'package:provider_app/views/home_page.dart';
import 'package:provider_app/views/shopping_cart_page.dart';
import 'package:provider_app/views/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => DataClass(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          initialRoute: '/',
          routes: {
            '/' : (context) => const SplashScreen(),
            '/home' : (context) => const HomePage(),
            '/shopping-cart' : (context) => const ShoppingCart()
          },
        ));
  }
}
