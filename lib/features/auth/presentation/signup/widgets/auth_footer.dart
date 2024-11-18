import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/styles/fonts/my_fonts.dart';
import 'package:flutter/material.dart';

class AuthFooter extends StatelessWidget {
  const AuthFooter({super.key, required this.question, required this.txt,required this.onPressed});
  final dynamic question, txt;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          question,
          style: MyFonts.styleRegular400_16
        ),
        TextButton(
          onPressed: onPressed,

          child: Text(
            txt,
            style: MyFonts.styleRegular400_16.copyWith(
              color: MyColors.baseColor,
              decoration: TextDecoration.underline,
              decorationColor: MyColors.baseColor,

            ),
          ),
        ),
      ],
    );
  }
}
