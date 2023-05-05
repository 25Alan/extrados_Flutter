import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:product_app/models/models.dart';
import 'package:http/http.dart' as http;

class ServiceProducts extends ChangeNotifier {
  final storage = const FlutterSecureStorage();
  final String _baseUrl = 'flutter-extrados-default-rtdb.firebaseio.com';
  final List<Product> products = [];
  late Product selectedProduct;
  File? newPicture;

  bool isLoading = true;
  bool isSaving = false;

  ServiceProducts() {
    loadProducts();
  }

  Future<List<Product>> loadProducts() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.https(_baseUrl, 'product.json',
        {'auth': await storage.read(key: 'token') ?? ''});
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
      await newProduct(product);
    } else {
      await updateProduct(product);
    }

    isSaving = false;
    notifyListeners();
  }

  Future<String> updateProduct(Product product) async {
    final url = Uri.https(_baseUrl, 'product/${product.id}.json',
        {'auth': await storage.read(key: 'token') ?? ''});
    final response = await http.put(url, body: product.toJson());
    final recordData = response.body;

    final index = products.indexWhere((element) => element.id == product.id);
    products[index] = product;

    return product.id!;
  }

  Future<String> newProduct(Product product) async {
    final url = Uri.https(_baseUrl, 'product.json');
    // product.picture = '';
    final response = await http.post(url, body: product.toJson());
    final decodeData = json.decode(response.body);

    product.id = decodeData['name'];

    products.add(product);

    return product.id!;
  }

  void updatePictureCardProduct(String path) {
    selectedProduct.picture = path;
    newPicture = File.fromUri(Uri(path: path));

    notifyListeners();
  }

  Future<String?> uploadImage() async {
    if (newPicture == null) return null;

    isSaving = true;
    notifyListeners();

    final url = Uri.parse(
        'https://api.cloudinary.com/v1_1/dwu49y0wo/image/upload?upload_preset=ywqrgvs0');

    final imageUploadRequest = http.MultipartRequest('POST', url);
    final finalPath =
        await http.MultipartFile.fromPath('file', newPicture!.path);
    imageUploadRequest.files.add(finalPath);
    final streamResponse = await imageUploadRequest.send();
    final res = await http.Response.fromStream(streamResponse);

    if (res.statusCode != 200 && res.statusCode != 201) {
      // print('fallido - upload');
      // print(res.body);
      return null;
    }

    newPicture = null;
    final data = json.decode(res.body);
    return data['secure_url'];
  }
}
