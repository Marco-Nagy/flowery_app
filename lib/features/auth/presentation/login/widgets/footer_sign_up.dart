import 'package:flowery_e_commerce/core/utils/extension/navigation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flowery_e_commerce/core/utils/extension/media_query_values.dart';
import '../../../../../core/localization/lang_keys.dart';
import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/styles/colors/my_colors.dart';
import '../../../../../core/styles/fonts/my_fonts.dart';

class FooterSignUp extends StatelessWidget {
  const FooterSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: context.translate(LangKeys.notHaveAnAccount),
              style: MyFonts.styleRegular400_16.copyWith(color: MyColors.black),
            ),
            TextSpan(
              text: context.translate(LangKeys.signUp),
              style: MyFonts.styleRegular400_16.copyWith(
                  color: MyColors.baseColor,
                  decoration: TextDecoration.underline),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  context.pushNamed(AppRoutes.register);
                },
            ),
          ],
        ),
      ),
    );
  }
}
