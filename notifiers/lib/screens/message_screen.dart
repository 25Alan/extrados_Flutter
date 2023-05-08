import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments ?? 'No arguments';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Message'),
      ),
      body: Center(
        child: Text('$args'),
      ),
    );
  }
}
