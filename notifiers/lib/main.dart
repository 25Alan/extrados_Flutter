import 'package:flutter/material.dart';
import 'package:notifiers/screens/screens.dart';
import 'package:notifiers/services/push_notifications_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PushNotificationsService.initializeApp();
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    PushNotificationsService.messageStream.listen((message) {
      print('My App : $message');

      navigatorKey.currentState?.pushNamed('message', arguments: message);

      final SnackBar snackBar = SnackBar(content: Text(message));
      scaffoldMessengerKey.currentState?.showSnackBar(snackBar);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: scaffoldMessengerKey,
      routes: {
        'home': (_) => const HomeScreen(),
        'message': (_) => const MessageScreen(),
      },
    );
  }
}
