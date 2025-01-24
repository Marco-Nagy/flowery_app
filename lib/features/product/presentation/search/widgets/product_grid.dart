import 'package:flowery_e_commerce/features/categories/presentation/products/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ProductGrid extends StatelessWidget {
  final List products;

  const ProductGrid({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12.h,
        crossAxisSpacing: 12.w,
        childAspectRatio: 0.7,
      ),
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductCard(
          name: product?.title ?? '',
          image: product?.imgCover ?? '',
          price: product?.price ?? 0,
          priceAfterDiscount: product?.priceAfterDiscount ?? 0,
        );
      },
    );
  }
}
