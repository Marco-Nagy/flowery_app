import 'package:flowery_e_commerce/core/utils/extension/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/styles/colors/my_colors.dart';
import '../../../../core/styles/fonts/my_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomSearchWidget extends StatelessWidget {
  const CustomSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(AppRoutes.searchView);
      },
      child: Container(
        height: 48.h,
        decoration: BoxDecoration(
          border: Border.all(color: MyColors.placeHolder),
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            const Icon(
              Icons.search,
              color: MyColors.placeHolder,
            ),
            const SizedBox(width: 8),
            Text(
              AppLocalizations.of(context)!.search,
              style: MyFonts.styleMedium500_14.copyWith(
                color: MyColors.placeHolder,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
