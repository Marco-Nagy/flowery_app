import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../product/domain/entities/product_response_entity.dart';
import 'generic_build_item.dart';

class GenericBuilderWidget extends StatelessWidget {
  const GenericBuilderWidget(
      {super.key, required this.filteredProducts, this.controller});

  final ScrollController? controller;

  final List<ProductEntity> filteredProducts;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: controller,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 20,
        childAspectRatio: 3 / 4,
        mainAxisExtent: 270.h,
      ),
      itemCount: filteredProducts.length,
      itemBuilder: (context, index) {
        final product = filteredProducts[index];
        return GenericBuildItem(
          title: product.title ?? '',
          imageCover: product.imgCover ?? '',
          price: product.price?.toString() ?? '',
          priceAfterDiscount: product.priceAfterDiscount?.toString() ?? '',
        );
      },
    );
  }
}
