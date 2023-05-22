import 'package:flutter/material.dart';
import 'package:product_app/models/models.dart';
import 'package:product_app/screens/screens.dart';
import 'package:product_app/services/services.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ServicePushNotifiers.initializeApp();

  runApp(const AppState());
}

class AppState extends StatefulWidget {
  const AppState({super.key});

  @override
  State<AppState> createState() => _AppStateState();
}

class _AppStateState extends State<AppState> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();

    ServicePushNotifiers.messageStream.listen((message) {
      final newProduct = Product.fromMap(message);
      navigatorKey.currentState
          ?.pushReplacementNamed('product', arguments: newProduct);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ServiceProducts()),
        ChangeNotifierProvider(create: (_) => ServiceAuth()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Product App',
        initialRoute: 'check',
        navigatorKey: navigatorKey,
        routes: {
          'login': (_) => const LoginScreen(),
          'register': (_) => const RegisterScreen(),
          'check': (_) => const CheckScreen(),
          'home': (_) => const HomeScreen(),
          'product': (_) => DetailsProductScreen(),
        },
        scaffoldMessengerKey: ServiceNotifiers.messengerKey,
        theme: customTheme,
      ),
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
