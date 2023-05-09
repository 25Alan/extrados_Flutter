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
                    color: Color.fromARGB(255, 0, 255, 1),
                  ),
                ),
              ),
              Positioned(
                top: 60,
                right: 20,
                child: IconButton(
                  onPressed: () async {
                    XFile? image = await ImagePicker()
                        .pickImage(source: ImageSource.camera);
                    PickedFile? picker =
                        image != null ? PickedFile(image.path) : null;
                    /* final picker = new ImagePicker();
                        final PickedFile? pickedFile =
                            await picker.pickImage(source: ImageSource.gallery);*/

                    if (picker == null) {
                      return;
                    }

                    productServices.updatePictureCardProduct(picker.path);
                  },
                  icon: const Icon(
                    Icons.camera,
                    size: 40,
                    color: Color.fromARGB(255, 10, 254, 1),
                  ),
                ),
              ),
              Positioned(
                top: 130,
                right: 20,
                child: IconButton(
                  onPressed: () async {
                    XFile? image = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);
                    PickedFile? picker =
                        image != null ? PickedFile(image.path) : null;
                    /* final picker = new ImagePicker();
                        final PickedFile? pickedFile =
                            await picker.pickImage(source: ImageSource.gallery);*/

                    if (picker == null) {
                      return;
                    }

                    productServices.updatePictureCardProduct(picker.path);
                  },
                  icon: const Icon(
                    Icons.file_download,
                    size: 40,
                    color: Color.fromARGB(255, 10, 254, 1),
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
        onPressed: productServices.isSaving
            ? null
            : () async {
                if (!productForm.isFormValid()) return;

                final String? imageUrl = await productServices.uploadImage();

                if (imageUrl != null) productForm.product.picture = imageUrl;

                await productServices.saveOrCreate(productForm.product);
                ServiceNotifiers.showSnackBar('[update or creation confirmed]');
              },
        child: productServices.isSaving
            ? const CircularProgressIndicator(
                color: Colors.black,
              )
            : const Icon(Icons.save),
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
