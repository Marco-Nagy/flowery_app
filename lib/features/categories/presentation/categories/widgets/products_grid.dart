import 'package:flowery_e_commerce/core/routes/app_routes.dart';
import 'package:flowery_e_commerce/core/utils/extension/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../products/viewModel/products_view_model_cubit.dart';
import '../../products/widgets/product_card.dart';
import '../../../../generic/presentation/generic_item_by_product/widget/no_products_widget.dart';

class ProductsGrid extends StatelessWidget {
  final String? selectedCategoryId;

  const ProductsGrid({Key? key, this.selectedCategoryId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsViewModelCubit, ProductsViewModelState>(
      builder: (context, state) {
        if (state is GetProductsViewModelLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetProductsViewModelSuccess) {
          final products = selectedCategoryId == null
              ? state.data.products
              : state.data.products
                  ?.where((product) => product?.category == selectedCategoryId)
                  .toList();

          if (products == null || products.isEmpty) {
            return const NoProductsWidget();
          }

          return GridView.builder(
            padding: EdgeInsets.zero,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.7,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return GestureDetector(
                onTap: () => context.pushNamed(AppRoutes.productsDetails),
                child: ProductCard(
                  name: product?.title ?? '',
                  image: product?.imgCover ?? '',
                  price: product?.price ?? 0,
                  priceAfterDiscount: product?.priceAfterDiscount ?? 0,
                ),
              );
            },
          );
        } else if (state is GetProductsViewModelError) {
          return Center(child: Text(state.error.error.toString()));
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
