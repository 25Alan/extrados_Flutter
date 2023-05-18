import 'dart:async';
import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../firebase_options.dart';
import 'package:http/http.dart' as http;

class ServicePushNotifiers {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;
  static final StreamController<Map<String, dynamic>> _messageStream =
      StreamController();
  static Stream<Map<String, dynamic>> get messageStream =>
      _messageStream.stream;

  bool isFlutterLocalNotificationsInitialized = false;
  late AndroidNotificationChannel channel;
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  static void sendMessage(String token, String body, String title) async {
    try {
      await http.post(
        Uri.parse(
            'https://fcm.googleapis.com/v1/projects/myproject-b5ae1/messages:send'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ya29.ElqKBGN2Ri_Uz...HnS_uNreA',
        },
        body: jsonEncode(
          <String, dynamic>{
            'priority': 'high',
            'data': <String, dynamic>{
              'click_action': 'FLUTTER_NOTIFICATION_CLICK',
              'status': 'done',
              'body': body,
              'title': title,
            },
            'notification': <String, dynamic>{
              'title': title,
              'body': body,
              'android_channel_id': 'extrados'
            },
            'to': token,
          },
        ),
      );
    } catch (e) {
      print('push notification off');
    }
  }

  static void reqPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('Permissions enabled');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('provisional permit enabled');
    } else {
      print('Permissions not enabled');
    }
  }

  static Future _onBackgroundHandler(RemoteMessage newMessage) async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    // await setupFlutterNotifications();
    // setupFlutterNotifications(newMessage);
    _messageStream.add(newMessage.data);
    print('NEW BACKGROUND:  ${newMessage.notification?.android?.imageUrl}');
  }

  static Future _onMessageHandler(RemoteMessage newMessage) async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    _messageStream.add(newMessage.data['product'] ?? 'Data empty');
    print('NEW ON MESSAGE HANDLER:  ${newMessage.data}');
  }

  static Future _onMessageOpenApp(RemoteMessage newMessage) async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    _messageStream.add(newMessage.data['product'] ?? 'Data empty');
    print('NEW ON MESSAGE OPEN APP:  ${newMessage.data}');
  }

  static Future initializeApp() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    reqPermission();
    // await setupFlutterNotifications();
    // await showFlutterNotification();

    FirebaseMessaging.onBackgroundMessage(_onBackgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenApp);

    token = await FirebaseMessaging.instance.getToken();
    print('MESSAGE : ${_messageStream}');
    print('TOKEN = ${token}');
  }

  static closeStreams() {
    _messageStream.close();
  }

  Notifications() async {
    if (isFlutterLocalNotificationsInitialized) {
      return;
    }
    channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      description:
          'This channel is used for important notifications.', // description
      importance: Importance.high,
    );

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    isFlutterLocalNotificationsInitialized = true;
  }

  Future<void> setupFlutterNotifications([RemoteMessage? newMessage]) async {
    if (isFlutterLocalNotificationsInitialized) {
      return;
    }
    channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      description:
          'This channel is used for important notifications.', // description
      importance: Importance.high,
    );

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    isFlutterLocalNotificationsInitialized = true;
  }

  void showFlutterNotification(RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
    if (notification != null && android != null && !kIsWeb) {
      flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            channelDescription: channel.description,
            icon: 'launch_background',
          ),
        ),
      );
    }
  }
}
