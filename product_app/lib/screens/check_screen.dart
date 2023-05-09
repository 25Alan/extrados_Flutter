import 'package:flutter/material.dart';
import 'package:product_app/screens/home_screen.dart';
import 'package:product_app/screens/login_screen.dart';
import 'package:product_app/services/services.dart';
import 'package:provider/provider.dart';

class CheckScreen extends StatelessWidget {
  const CheckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authS = Provider.of<ServiceAuth>(context, listen: false);

    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: authS.readToken(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return const Text(
                'WAIT',
                style: TextStyle(color: Colors.white),
              );
            }

            if (snapshot.data == '') {
              Future.microtask(() {
                Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (_, __, ___) => const LoginScreen(),
                        transitionDuration: const Duration(seconds: 2)));
              });
            } else {
              Future.microtask(() {
                Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (_, __, ___) => const HomeScreen(),
                        transitionDuration: const Duration(seconds: 2)));
              });
            }
            return Container();
          },
        ),
      ),
    );
  }
}
