import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SelectCalc extends StatelessWidget {
  const SelectCalc({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Welcome',
                style: TextStyle(decoration: TextDecoration.none)),
            ElevatedButton(
              onPressed: () {
                AutoRouter.of(context).pushNamed('/calcTutorial');
              },
              child: const Text('Calc - Tutorial'),
            ),
            ElevatedButton(
              onPressed: () {
                AutoRouter.of(context).pushNamed('/secondPage');
              },
              child: const Text('Calc - modAlan'),
            ),
            ElevatedButton(
              onPressed: () {
                AutoRouter.of(context).pushNamed('/exampleMapPage');
              },
              child: const Text('Example Map'),
            ),
          ]),
    );
  }
}
