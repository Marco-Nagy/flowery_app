import 'package:flowery_e_commerce/core/styles/fonts/my_fonts.dart';
import 'package:flutter/material.dart';

import '../../../styles/colors/my_colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key, required this.appBarTxt, this.showArrow = false});

  final String appBarTxt;
  final bool? showArrow;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        showArrow == true
            ? GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: MyColors.black,
                ),
              )
            : const SizedBox(),
        Text(
          '${appBarTxt}',
          style: MyFonts.styleMedium500_20.copyWith(color: MyColors.black),
        ),
      ],
    );
  }
}
