import 'package:flutter/material.dart';
import 'package:product_app/widgets/widgets.dart';

class DetailsProductScreen extends StatelessWidget {
  const DetailsProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Stack(
            children: [
              ProductImage(),
            ],
          )
        ]),
      ),
    );
  }
}
