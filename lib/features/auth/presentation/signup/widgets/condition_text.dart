import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/styles/fonts/my_fonts.dart';
import 'package:flutter/cupertino.dart';

Widget conditionText() {
  return RichText(
    text: TextSpan(
      text: 'Creating an account, you agree to our ',
      style:MyFonts.styleRegular400_12.copyWith(
        color: MyColors.black
      ),
      children: <TextSpan>[
        TextSpan(
          text: 'Terms&Conditions',
          style: MyFonts.styleSemiBold600_12.copyWith(
            decoration: TextDecoration.underline,

          )

        ),


      ],
    ),
  );
}