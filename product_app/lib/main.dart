import 'package:flutter/material.dart';
import 'package:product_app/screens/screens.dart';
import 'package:product_app/services/service_products.dart';
import 'package:provider/provider.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ServiceProducts())],
      child: const MyApp(),
    );
  }
}

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
        scaffoldBackgroundColor: Color.fromARGB(255, 76, 240, 255),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color.fromRGBO(81, 71, 213, 1),
          elevation: 0,
        ),
      ),
    );
  }
}
