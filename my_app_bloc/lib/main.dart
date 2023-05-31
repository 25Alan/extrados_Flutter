import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app_bloc/bloc/items_bloc.dart';
import 'package:my_app_bloc/screens/list_screen.dart';
import 'firebase_options.dart';

import 'package:my_app_bloc/screens/screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => ItemsBloc())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'home',
        routes: {
          'home': (_) => const HomeScreen(),
          'info': (_) => InfoScreen(),
          'list': (_) => const ListScreen(),
        },
        theme: ThemeData.dark(useMaterial3: true),
      ),
    );
  }
}
