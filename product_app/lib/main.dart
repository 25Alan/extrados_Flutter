import 'package:flutter/material.dart';
import 'package:product_app/screens/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Product App',
      initialRoute: 'home',
      routes: {
        'login': (_) => const LoginScreen(),
        'home': (_) => const HomeScreen(),
        'product': (_) => const DetailsProductScreen(),
      },
      theme: ThemeData(
        appBarTheme: const AppBarTheme(elevation: 0, color: Colors.indigo),
        scaffoldBackgroundColor: const Color.fromRGBO(112, 103, 125, 1),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color.fromRGBO(81, 71, 213, 1),
          elevation: 0,
        ),
      ),
    );
  }
}
