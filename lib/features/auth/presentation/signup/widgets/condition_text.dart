import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/styles/fonts/my_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Widget conditionText(BuildContext context) {
  return RichText(
    text: TextSpan(
      text:AppLocalizations.of(context)!.creating_account,
      style:MyFonts.styleRegular400_12.copyWith(
        color: MyColors.black
      ),
      children: <TextSpan>[
        TextSpan(
          text:AppLocalizations.of(context)!.terms_and_conditions,
          style: MyFonts.styleSemiBold600_12.copyWith(
            decoration: TextDecoration.underline,

          )

        ),


      ],
    ),
  );
}