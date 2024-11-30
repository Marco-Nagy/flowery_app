import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/styles/fonts/my_fonts.dart';
import 'package:flowery_e_commerce/generated/assets.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/widgets/spacing.dart';

class NoProductsWidget extends StatelessWidget {
  const NoProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(Assets.imagesDribbleFlowers, width: 150),
          verticalSpacing(16),
          Text(
            'No products available.',
            style: MyFonts.styleMedium500_18.copyWith(color: MyColors.black),
          ),
        ],
      ),
    );
  }
}
