import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class ServicePushNotifiers {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;
  static final StreamController<String> _messageStream = StreamController();
  static Stream<String> get messageStream => _messageStream.stream;

  static Future _onBackgroundHandler(RemoteMessage newMessage) async {
    _messageStream.add(newMessage.data['product'] ?? 'Data empty');
  }

  static Future _onMessageHandler(RemoteMessage newMessage) async {
    _messageStream.add(newMessage.data['product'] ?? 'Data empty');
  }

  static Future _onMessageOpenApp(RemoteMessage newMessage) async {
    _messageStream.add(newMessage.data['product'] ?? 'Data empty');
  }

  static Future initializeApp() async {
    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();

    FirebaseMessaging.onBackgroundMessage(_onBackgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenApp);

    print('TOKEN = ${token}');
  }

  static closeStreams() {
    _messageStream.close();
  }
}
