import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/utils/extension/mediaQueryValues.dart';
import 'package:flowery_e_commerce/core/utils/screens/no_network_screen.dart';
import 'package:flowery_e_commerce/core/utils/widgets/base/app_loader.dart';
import 'package:flowery_e_commerce/core/utils/widgets/base/base_view.dart';
import 'package:flowery_e_commerce/features/categories/presentation/categories/widgets/filter_chip_button.dart';
import 'package:flowery_e_commerce/features/categories/presentation/products/viewModel/products_view_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/widgets/spacing.dart';
import '../../../../../di/di.dart';
import '../../../../generic/presentation/generic_item_by_product/views/generic_item_screen.dart';
import '../../products/viewModel/get_products_actions.dart';
import '../viewModel/categories_action.dart';
import '../viewModel/categories_view_model_cubit.dart';
import '../widgets/categories_tab_bar.dart';
import '../widgets/custom_filter_categories.dart';
import '../widgets/custom_search_categories.dart';
import '../widgets/filter_chip_button_widget.dart';
import '../widgets/products_grid.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 16, right: 16),
                child: Row(
                  children: [
                    const Expanded(flex: 3, child: CustomSearchCategories()),
                    horizontalSpacing(12),
                    const Expanded(flex: 1, child: CustomFilterCategories()),
                  ],
                ),
              ),
              verticalSpacing(16),
              GenericItemScreen(resourceName: 'categories', field: 'category'),
            ],
          ),
          Positioned(
              bottom: 12,
              left: context.width * 0.35,
              child: FilterChipButton(onPressed: () {}))
        ],
      ),
    );
  }
}
