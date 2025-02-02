import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/styles/fonts/my_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flowery_e_commerce/core/utils/extension/media_query_values.dart';
import '../../../../../core/localization/lang_keys.dart';
Widget conditionText(BuildContext context) {
  return RichText(
    text: TextSpan(
      text:context.translate(LangKeys.creatingAccount),
      style:MyFonts.styleRegular400_12.copyWith(
        color: MyColors.black
      ),
      children: <TextSpan>[
        TextSpan(
          text:context.translate(LangKeys.termsAndConditions),
          style: MyFonts.styleSemiBold600_12.copyWith(
            decoration: TextDecoration.underline,

          )

        ),


      ],
    ),
  );
}