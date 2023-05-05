import 'package:flutter/material.dart';
import 'package:product_app/screens/screens.dart';
import 'package:product_app/services/services.dart';
import 'package:provider/provider.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ServiceProducts()),
        ChangeNotifierProvider(create: (_) => ServiceAuth()),
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
      title: 'Product App',
      initialRoute: 'check',
      routes: {
        'login': (_) => const LoginScreen(),
        'register': (_) => const RegisterScreen(),
        'check': (_) => const CheckScreen(),
        'home': (_) => const HomeScreen(),
        'product': (_) => const DetailsProductScreen(),
      },
      scaffoldMessengerKey: ServiceNotifiers.messengerKey,
      theme: customTheme,
    );
  }
}

final Map<String, Color> customColorPalette = {
  'blackBackground': const Color.fromRGBO(0, 0, 0, 1),
  'darkGray': const Color.fromRGBO(18, 18, 18, 1),
  'mediumGray': const Color.fromRGBO(30, 30, 30, 1),
  'lightGray': const Color.fromRGBO(36, 36, 36, 1),
  'white': const Color.fromRGBO(255, 255, 255, 1),
};

final ThemeData customTheme = ThemeData(
  scaffoldBackgroundColor: customColorPalette['darkGray'],
  primaryColor: customColorPalette['lightGray'],
  cardColor: customColorPalette['mediumGray'],
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors
        .grey, // aquí puedes seleccionar un swatch que se adapte a tus necesidades
  ).copyWith(
    secondary: customColorPalette['white'],
  ),
  appBarTheme:
      const AppBarTheme(backgroundColor: Color.fromRGBO(0, 255, 60, 1)),
);
