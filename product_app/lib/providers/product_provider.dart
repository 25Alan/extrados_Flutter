import 'package:flutter/material.dart';
import 'package:product_app/models/models.dart';

class ProductProvider extends ChangeNotifier {
  GlobalKey<FormState> keyForm = GlobalKey();
  Product product;

  ProductProvider(this.product);

  bool isFormValid() {
    return keyForm.currentState?.validate() ?? false;
  }

  updateAvailability(bool value) {
    product.available = value;
    notifyListeners();
  }
}
