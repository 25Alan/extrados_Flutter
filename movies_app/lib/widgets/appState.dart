import 'package:flutter/material.dart';
import 'package:movies_app/screens/actor_Info_screen.dart';
import 'package:movies_app/screens/screens.dart';
import 'package:provider/provider.dart';

import 'package:movies_app/providers/provider_App.dart';

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MoviesProvider(), lazy: false),
      ],
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
      title: 'Películas',
      initialRoute: 'home',
      routes: {
        'home': (_) => Home_page(),
        'details': (_) => const DetailsScreen(),
        'actorInfo': (_) {
          final args = ModalRoute.of(context)?.settings.arguments;
          if (args is int) {
            return Actor_Info_Screen(idActor: args);
          }
          return const Text('null');
        },
      },
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromRGBO(38, 6, 74, 1),
        textTheme: const TextTheme(
          bodySmall: TextStyle(color: Color.fromRGBO(28, 255, 47, 1)),
          bodyMedium: TextStyle(color: Color.fromRGBO(204, 204, 204, 1)),
          bodyLarge: TextStyle(color: Color.fromRGBO(205, 12, 12, 1)),
          titleMedium: TextStyle(color: Colors.white),
          headlineSmall: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
