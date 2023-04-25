import 'package:calc/router/app.router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'App de notas',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      routerConfig: _appRouter.config(),
    );
  }
}
