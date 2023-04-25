import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  GlobalKey<FormState> keyForm = GlobalKey();

  String email = '';
  String password = '';

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isFormValid() {
    print(keyForm.currentState?.validate());
    print('${email} - ${password}');
    return keyForm.currentState?.validate() ?? false;
  }
}
