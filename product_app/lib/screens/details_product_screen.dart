import 'package:flutter/material.dart';
import 'package:product_app/interface/input_decorations.dart';
import 'package:product_app/widgets/widgets.dart';

class DetailsProductScreen extends StatelessWidget {
  const DetailsProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Stack(
            children: [
              const ProductImage(),
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
                  onPressed: () {},
                  icon: const Icon(
                    Icons.camera,
                    size: 40,
                    color: Colors.black,
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
        onPressed: () {},
      ),
    );
  }
}

class _FormProduct extends StatelessWidget {
  const _FormProduct();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        decoration: _buildFormDecorations(),
        child: Form(
            child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecorations.authInputDecorations(
                hintText: 'Name of product',
                labelText: 'Name:',
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecorations.authInputDecorations(
                hintText: '\$150',
                labelText: 'Price:',
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SwitchListTile.adaptive(
              value: true,
              title: const Text('Avalaible'),
              activeColor: Colors.indigo,
              onChanged: (value) {},
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
