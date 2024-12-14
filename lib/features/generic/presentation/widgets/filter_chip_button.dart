import 'package:flowery_e_commerce/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/styles/colors/my_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class FilterChipButton extends StatelessWidget {
  const FilterChipButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      onPressed: onPressed,
      label:  Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const ImageIcon(
            AssetImage(Assets.imagesButtonFilter),
            size: 18,
            color: MyColors.white,
          ),
          const SizedBox(width: 8),
          Text(
          AppLocalizations.of(context)!.filter,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      backgroundColor: MyColors.baseColor,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: MyColors.baseColor),
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 4,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
    );
  }
}
