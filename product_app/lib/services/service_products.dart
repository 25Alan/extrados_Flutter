import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:product_app/models/models.dart';
import 'package:http/http.dart' as http;

class ServiceProducts extends ChangeNotifier {
  final String _baseUrl = 'flutter-extrados-default-rtdb.firebaseio.com';
  final List<Product> products = [];
  late Product selectedProduct;

  bool isLoading = true;
  bool isSaving = false;

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

  Future saveOrCreate(Product product) async {
    isSaving = true;
    notifyListeners();

    if (product.id == null) {
    } else {
      await updateProduct(product);
    }

    isSaving = false;
    notifyListeners();
  }

  Future<String> updateProduct(Product product) async {
    final url = Uri.https(_baseUrl, 'product/${product.id}.json');
    final response = await http.put(url, body: product.toJson());
    final recordData = response.body;

    final index = products.indexWhere((element) => element.id == product.id);
    products[index] = product;

    return product.id!;
  }
}
