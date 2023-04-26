import 'package:flutter/material.dart';

import 'package:product_app/models/models.dart';

class CardProduct extends StatelessWidget {
  const CardProduct({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Container(
        margin: const EdgeInsets.only(top: 30, bottom: 50),
        width: double.infinity,
        height: 400,
        decoration: _borderCard(),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            _BackgroundCard(
              urlImage: product.picture,
            ),
            _DetailsProduct(
              nameProduct: product.name,
              idProduct: product.id!,
            ),
            Positioned(
              top: 0,
              right: 0,
              child: _PriceProduct(
                priceProduct: product.price,
              ),
            ),
            if (!product.available)
              const Positioned(
                top: 0,
                left: 0,
                child: _NotAvalaible(),
              )
          ],
        ),
      ),
    );
  }

  BoxDecoration _borderCard() => BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 5),
            )
          ]);
}

class _NotAvalaible extends StatelessWidget {
  const _NotAvalaible();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.yellow[800],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomRight: Radius.circular(25),
        ),
      ),
      child: const FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'Not Avalaible',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}

class _PriceProduct extends StatelessWidget {
  const _PriceProduct({required this.priceProduct});
  final double priceProduct;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 100,
      height: 70,
      decoration: const BoxDecoration(
        color: Colors.indigo,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(25),
        ),
      ),
      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            '\$$priceProduct',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}

class _DetailsProduct extends StatelessWidget {
  const _DetailsProduct({
    required this.nameProduct,
    required this.idProduct,
  });
  final String nameProduct;
  final String idProduct;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 60),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: double.infinity,
        height: 70,
        decoration: _boxDecorationsDetails(),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            nameProduct,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            idProduct,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.white,
            ),
          )
        ]),
      ),
    );
  }

  BoxDecoration _boxDecorationsDetails() => const BoxDecoration(
        color: Colors.indigo,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          topRight: Radius.circular(25),
        ),
      );
}

class _BackgroundCard extends StatelessWidget {
  const _BackgroundCard({this.urlImage});
  final String? urlImage;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        width: double.infinity,
        height: 400,
        child: urlImage == null
            ? const Image(
                image: AssetImage('assets/no-image.png'),
                fit: BoxFit.cover,
              )
            : FadeInImage(
                placeholder: const AssetImage('assets/jar-loading.gif'),
                image: NetworkImage(urlImage!),
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
