import 'package:flutter/material.dart';

class CardLogin extends StatelessWidget {
  const CardLogin({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: _createCard(),
        child: child,
      ),
    );
  }

  BoxDecoration _createCard() => BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              blurRadius: 15,
              offset: Offset(0, 10),
            )
          ]);
}
