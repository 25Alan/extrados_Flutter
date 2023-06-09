// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBfNPkxPDBx0Kp1165SILyWYaty9WbCTkk',
    appId: '1:23718005584:web:333f4e239cfed7fc41ba55',
    messagingSenderId: '23718005584',
    projectId: 'extrados-cli',
    authDomain: 'extrados-cli.firebaseapp.com',
    storageBucket: 'extrados-cli.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCAKHUCRWHodJmlJqryr1oBU_PYkSW96UU',
    appId: '1:23718005584:android:124bce299dd80ebe41ba55',
    messagingSenderId: '23718005584',
    projectId: 'extrados-cli',
    storageBucket: 'extrados-cli.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAkRTL7m4S2VpNwTyixvW45otT0p640rU4',
    appId: '1:23718005584:ios:a7b7f14fe3ca581941ba55',
    messagingSenderId: '23718005584',
    projectId: 'extrados-cli',
    storageBucket: 'extrados-cli.appspot.com',
    iosClientId: '23718005584-vhv4ng3g75b35bgq41h0dgrfa5ga03l3.apps.googleusercontent.com',
    iosBundleId: 'com.example.productNotifiersApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAkRTL7m4S2VpNwTyixvW45otT0p640rU4',
    appId: '1:23718005584:ios:a7b7f14fe3ca581941ba55',
    messagingSenderId: '23718005584',
    projectId: 'extrados-cli',
    storageBucket: 'extrados-cli.appspot.com',
    iosClientId: '23718005584-vhv4ng3g75b35bgq41h0dgrfa5ga03l3.apps.googleusercontent.com',
    iosBundleId: 'com.example.productNotifiersApp',
  );
}
