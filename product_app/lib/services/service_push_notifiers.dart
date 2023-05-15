//30:4C:A3:E8:18:B6:34:7E:CD:BD:1B:75:DC:DD:8C:A7:5F:6E:51:2C

import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

mixin PushNotificationsService implements FirebaseMessaging {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;
  static StreamController<String> _messageStream = StreamController();
  static Stream<String> get messageStream => _messageStream.stream;

  static Future _backgroundHandler(RemoteMessage messageBackground) async {
    _messageStream
        .add(messageBackground.data['product'] ?? 'No data background');
  }

  static Future _onMessageHandler(RemoteMessage messageBackground) async {
    _messageStream
        .add(messageBackground.data['product'] ?? 'No data messageHandler');
  }

  static Future _onMessageOpenApp(RemoteMessage messageBackground) async {
    _messageStream
        .add(messageBackground.data['product'] ?? 'No data MessageOpen');
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
