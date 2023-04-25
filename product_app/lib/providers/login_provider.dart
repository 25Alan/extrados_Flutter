import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  GlobalKey<FormState> keyForm = GlobalKey();

  String email = '';
  String password = '';

  bool isFormValid() {
    print(keyForm.currentState?.validate());
    print('${email} - ${password}');
    return keyForm.currentState?.validate() ?? false;
  }
}
