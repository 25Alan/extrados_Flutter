import 'package:flutter/material.dart';

class ServiceNotifiers {
  static GlobalKey<ScaffoldMessengerState> messengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static showSnackBar(String message) {
    final snackBar = SnackBar(
        content: Text(
      message,
      style: const TextStyle(fontSize: 18),
    ));

    messengerKey.currentState!.showSnackBar(snackBar);
  }
}
