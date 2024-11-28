import 'package:flutter/material.dart';

import '../widgets/arrow_back_widget.dart';
import '../widgets/product_details_widget.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.product});

  final dynamic product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(children: [
          ProductDetailsWidget(product: product),
          ArrowBackWidget(context),
        ]),
      ),
    );
  }
}
