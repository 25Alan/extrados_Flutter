import 'package:flutter/material.dart';
import 'package:product_app/models/models.dart';

class ServiceProducts extends ChangeNotifier {
  final String _baseUrl = 'flutter-extrados-default-rtdb.firebaseio.com';

  final List<Product> products = [];
}
