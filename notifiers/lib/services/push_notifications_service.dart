//SHA1 -->  C0:DE:74:F0:4D:B9:C7:DA:D9:E6:B3:8D:AB:4A:E4:72:D6:55:98:82

import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationsService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;
  static StreamController<String> _messageStream = StreamController();
  static Stream<String> get messageStream => _messageStream.stream;

  static Future _backgroundHandler(RemoteMessage messageBackground) async {
    _messageStream.add(messageBackground.data['product'] ?? 'No data');
  }

  static Future _onMessageHandler(RemoteMessage messageBackground) async {
    _messageStream.add(messageBackground.data['product'] ?? 'No data');
  }

  static Future _onMessageOpenApp(RemoteMessage messageBackground) async {
    _messageStream.add(messageBackground.data['product'] ?? 'No data');
  }

  static Future initializeApp() async {
    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();

    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenApp);

    print('Token = ${token}');
  }

  static closeStreams() {
    _messageStream.close();
  }
}
