import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:product_app/interface/input_decorations.dart';
import 'package:product_app/providers/product_provider.dart';
import 'package:product_app/services/services.dart';
import 'package:product_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class DetailsProductScreen extends StatelessWidget {
  const DetailsProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productServices = Provider.of<ServiceProducts>(context);

    return ChangeNotifierProvider(
      create: (_) => ProductProvider(productServices.selectedProduct),
      child: _ProductDetailsBody(productServices: productServices),
    );
  }
}

class _ProductDetailsBody extends StatelessWidget {
  const _ProductDetailsBody({
    super.key,
    required this.productServices,
  });

  final ServiceProducts productServices;

  @override
  Widget build(BuildContext context) {
    final productForm = Provider.of<ProductProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Stack(
            children: [
              ProductImage(
                urlImage: productServices.selectedProduct.picture,
              ),
              Positioned(
                top: 60,
                left: 20,
                child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 40,
                    color: Colors.black,
                  ),
                ),
              ),
              Positioned(
                top: 60,
                right: 20,
                child: IconButton(
                  onPressed: () async {
                    final ImagePicker picker = ImagePicker();
                    final XFile? image =
                        await picker.pickImage(source: ImageSource.camera);
                  },
                  icon: const Icon(
                    Icons.camera,
                    size: 40,
                    color: Colors.black,
                  ),
                ),
              ),
              Positioned(
                top: 120,
                right: 20,
                child: IconButton(
                  onPressed: () async {
                    final ImagePicker picker = ImagePicker();
                    final XFile? image =
                        await picker.pickImage(source: ImageSource.gallery);
                    print(image?.path);
                  },
                  icon: const Icon(
                    Icons.file_present,
                    size: 40,
                    color: Color.fromRGBO(0, 0, 0, 1),
                  ),
                ),
              ),
            ],
          ),
          const _FormProduct(),
          const SizedBox(
            height: 100,
          ),
        ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save),
        onPressed: () async {
          if (!productForm.isFormValid()) return;

          await productServices.saveOrCreate(productForm.product);
        },
      ),
    );
  }
}

class _FormProduct extends StatelessWidget {
  const _FormProduct();

  @override
  Widget build(BuildContext context) {
    final productForm = Provider.of<ProductProvider>(context);
    final product = productForm.product;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        decoration: _buildFormDecorations(),
        child: Form(
            key: productForm.keyForm,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  initialValue: product.name,
                  onChanged: (value) => product.name = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Required name';
                    return null;
                  },
                  decoration: InputDecorations.authInputDecorations(
                    hintText: 'Name of product',
                    labelText: 'Name:',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'^(\d+)?\.?\d{0,2}'))
                  ],
                  initialValue: '\$ ${product.price}',
                  onChanged: (value) => {
                    double.tryParse(value) == null
                        ? product.price = 0
                        : product.price = double.parse(value)
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecorations.authInputDecorations(
                    hintText: '\$',
                    labelText: 'Price:',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SwitchListTile.adaptive(
                  value: product.available,
                  title: const Text('Avalaible'),
                  activeColor: Colors.indigo,
                  onChanged: productForm.updateAvailability,
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            )),
      ),
    );
  }

  BoxDecoration _buildFormDecorations() => BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(25),
            bottomLeft: Radius.circular(25),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              offset: const Offset(0, 5),
              blurRadius: 5,
            )
          ]);
}
