import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ExampleMap extends StatelessWidget {
  ExampleMap({super.key});

  List<String> names = [
    "alan",
    "luciano",
    "gaston",
    "david",
    "ivan",
    "emilia",
    "sofia"
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: names
          .map((name) => Text(
                name,
                style: const TextStyle(decoration: TextDecoration.none),
              ))
          .toList(),
    );
  }
}
