import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/styles/fonts/my_fonts.dart';
import 'package:flowery_e_commerce/core/utils/widgets/base/base_view.dart';
import 'package:flowery_e_commerce/features/categories/presentation/categories/views/categories_view.dart';
import 'package:flutter/material.dart';

class CategoriesTab extends StatelessWidget {
  const CategoriesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(child: CategoriesView());
  }
}
