import 'package:flowery_e_commerce/core/routes/app_routes.dart';
import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/styles/fonts/my_fonts.dart';
import 'package:flowery_e_commerce/core/utils/extension/media_query_values.dart';
import 'package:flowery_e_commerce/core/utils/extension/navigation.dart';
import 'package:flutter/material.dart';
import '../../../../core/localization/lang_keys.dart';
class ChangeText extends StatelessWidget {
  const ChangeText({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(AppRoutes.resetPasswordProfileView);
      },
      child: Text(
        context.translate(LangKeys.change),
        style: MyFonts.styleMedium500_14.copyWith(color: MyColors.baseColor),
      ),
    );
  }
}
