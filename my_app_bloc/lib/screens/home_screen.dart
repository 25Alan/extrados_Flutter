import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          'Welcome to !',
          style: TextStyle(fontSize: 20, decoration: TextDecoration.none),
        ),
        FilledButton.tonal(
          onPressed: () => {Navigator.pushReplacementNamed((context), 'info')},
          child: const Text('GO'),
        ),
      ],
    );
  }
}
