import 'package:flutter/material.dart';

class CardProduct extends StatelessWidget {
  const CardProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Container(
        margin: EdgeInsets.only(top: 30, bottom: 50),
        width: double.infinity,
        height: 10,
        color: Colors.red,
      ),
    );
  }
}
