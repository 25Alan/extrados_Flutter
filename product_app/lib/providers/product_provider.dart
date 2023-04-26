import 'package:flutter/material.dart';
import 'package:product_app/models/models.dart';

class ProductFormProvider extends ChangeNotifier {
  GlobalKey<FormState> keyForm = GlobalKey();
  Product product;

  ProductFormProvider(this.product);

  bool isFormValid() {
    return keyForm.currentState?.validate() ?? false;
  }
}
