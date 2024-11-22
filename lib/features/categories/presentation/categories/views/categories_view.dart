import 'package:flowery_e_commerce/core/utils/extension/mediaQueryValues.dart';
import 'package:flowery_e_commerce/core/utils/widgets/base/base_view.dart';
import 'package:flowery_e_commerce/core/utils/widgets/spacing.dart';
import 'package:flowery_e_commerce/features/categories/presentation/categories/widgets/filter_chip_button.dart';
import 'package:flutter/material.dart';

import '../../../../generic/presentation/screens/catalog_generic_screen.dart';
import '../widgets/custom_filter_categories.dart';
import '../widgets/custom_search_categories.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: BaseView(
        child: Stack(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: const CustomSearchCategories(),
                    ),
                    horizontalSpacing(12),
                    Expanded(flex: 1, child: const CustomFilterCategories()),
                  ],
                ),
                verticalSpacing(16),
                CatalogGenericScreen(
                  resourceName: 'categories',
                ),
              ],
            ),
            Positioned(
                bottom: 12,
                left: context.width * 0.3,
                child: FilterChipButton(onPressed: () {}))
          ],
        ),
      ),
    );
  }
}
