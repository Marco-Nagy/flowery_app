import 'package:flowery_e_commerce/core/utils/extension/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/routes/app_routes.dart';
import '../../../../product/domain/entities/product_response_entity.dart';
import 'generic_build_item.dart';

class GenericBuilderWidget extends StatelessWidget {
  const GenericBuilderWidget(
      {super.key,
      required this.filteredProducts,
      this.controller,
      required this.onClick});

  final ScrollController? controller;

  final List<ProductEntity> filteredProducts;
  final void Function(GlobalKey) onClick;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: controller,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(top: 0, bottom: 10, left: 10, right: 10),
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
        return GestureDetector(
          onTap: () => context.pushNamed(AppRoutes.productsDetailsView,
              arguments: product),
          child: GenericBuildItem(
            product: product,
            onClick: onClick,
          ),
        );
      },
    );
  }
}
