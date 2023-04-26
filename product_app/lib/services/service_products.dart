import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:product_app/models/models.dart';
import 'package:http/http.dart' as http;

class ServiceProducts extends ChangeNotifier {
  final String _baseUrl = 'flutter-extrados-default-rtdb.firebaseio.com';
  final List<Product> products = [];

  bool isLoading = true;

  ServiceProducts() {
    loadProducts();
  }

  Future<List<Product>> loadProducts() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.https(_baseUrl, 'product.json');
    final response = await http.get(url);

    final Map<String, dynamic> productsMap = json.decode(response.body);
    productsMap.forEach((key, value) {
      final tempProduct = Product.fromMap(value);
      tempProduct.id = key;
      products.add(tempProduct);
    });

    isLoading = false;
    notifyListeners();

    return products;
  }
}
