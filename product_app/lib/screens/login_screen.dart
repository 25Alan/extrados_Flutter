import 'package:flutter/material.dart';
import 'package:product_app/interface/input_decorations.dart';
import 'package:product_app/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(
              height: 300,
            ),
            CardLogin(
              child: Column(children: [
                const SizedBox(
                  height: 10,
                ),
                Text('LOGIN', style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(
                  height: 30,
                ),
                const _FormLogin(),
              ]),
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              'CREATE A NEW ACCOUNT',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 60,
            )
          ]),
        ),
      ),
    );
  }
}

class _FormLogin extends StatelessWidget {
  const _FormLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
          child: Column(
        children: [
          TextFormField(
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecorations.authInputDecorations(
              hintText: 'example@email.com',
              labelText: 'Email',
              prefixIcon: Icons.email,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          TextFormField(
            autocorrect: false,
            obscureText: true,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecorations.authInputDecorations(
              hintText: '******',
              labelText: 'Password',
              prefixIcon: Icons.lock,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            disabledColor: Colors.grey,
            elevation: 8,
            color: Colors.deepPurple,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: const Text(
                'SIGN-IN',
                style: TextStyle(color: Colors.white),
              ),
            ),
            onPressed: () {},
          )
        ],
      )),
    );
  }
}
