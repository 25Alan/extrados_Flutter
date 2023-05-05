import 'package:flutter/material.dart';
import 'package:product_app/models/models.dart';
import 'package:product_app/screens/screens.dart';
import 'package:product_app/services/services.dart';
import 'package:product_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productsServices = Provider.of<ServiceProducts>(context);
    final authS = Provider.of<ServiceAuth>(context, listen: false);

    if (productsServices.isLoading) return const LoadScreen();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          IconButton(
              onPressed: () async {
                await authS.logout();
                Navigator.pushReplacementNamed(context, 'login');
              },
              icon: const Icon(Icons.logout_sharp))
        ],
      ),
      body: ListView.builder(
        itemCount: productsServices.products.length,
        itemBuilder: (BuildContext context, int index) => GestureDetector(
          onTap: () {
            productsServices.selectedProduct =
                productsServices.products[index].copy();
            Navigator.pushNamed(context, 'product');
          },
          child: CardProduct(
            product: productsServices.products[index],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(175, 21, 21, 1),
        onPressed: () {
          productsServices.selectedProduct =
              Product(available: false, name: '', price: 00.00);
          Navigator.pushNamed(context, 'product');
        },
        child: const Icon(Icons.add, size: 40.0),
      ),
    );
  }
}
