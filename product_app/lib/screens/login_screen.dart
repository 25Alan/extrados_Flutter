import 'package:flutter/material.dart';
import 'package:product_app/interface/input_decorations.dart';
import 'package:product_app/providers/login_provider.dart';
import 'package:product_app/widgets/widgets.dart';
import 'package:provider/provider.dart';
import '../services/services.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

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
                Text('LOGIN', style: textTheme.headlineLarge),
                const SizedBox(
                  height: 30,
                ),
                ChangeNotifierProvider(
                  create: (_) => LoginProvider(),
                  child: const _FormLogin(),
                ),
              ]),
            ),
            const SizedBox(
              height: 50,
            ),
            TextButton(
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, 'register'),
              child: const Text(
                'CREATE A NEW ACCOUNT',
                style: TextStyle(color: Colors.white),
              ),
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
  const _FormLogin();

  @override
  Widget build(BuildContext context) {
    final formLogin = Provider.of<LoginProvider>(context);

    return Form(
      key: formLogin.keyForm,
      autovalidateMode: AutovalidateMode.onUserInteraction,
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
            onChanged: (value) => formLogin.email = value,
            validator: (value) {
              String pattern =
                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
              RegExp regExp = RegExp(pattern);

              return regExp.hasMatch(value ?? '')
                  ? null
                  : 'The entered is not valid';
            },
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
            onChanged: (value) => formLogin.password = value,
            validator: (value) {
              return (value != null && value.length >= 6)
                  ? null
                  : 'Password must contain 6 characters';
            },
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
            onPressed: formLogin.isLoading
                ? null
                : () async {
                    FocusScope.of(context).unfocus();
                    final authS = Provider.of<ServiceAuth>(context,
                        listen:
                            false); // listen en false por que es mala practica escuchar dentro de un método
                    formLogin.isLoading = true;
                    final String? messageCreateUser = await authS.loginUser(
                        formLogin.email, formLogin.password);
                    if (messageCreateUser == null) {
                      Navigator.pushReplacementNamed(context, 'home');
                    } else {
                      ServiceNotifiers.showSnackBar(
                          '${messageCreateUser} [invalid data]');
                      formLogin.isLoading = false;
                    }
                  },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: Text(
                formLogin.isLoading ? 'WAIT' : 'SIGN-IN',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
