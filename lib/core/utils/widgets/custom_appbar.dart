import 'package:flowery_e_commerce/core/styles/fonts/my_fonts.dart';
import 'package:flutter/material.dart';

import '../../styles/colors/my_colors.dart';


AppBar customAppBar({
  required String appBarTxt,
  bool showArrow = false,
  VoidCallback? navigation,
  required BuildContext context,
  List<Widget>? actions
}) {
  return AppBar(
    backgroundColor: Colors.white,
    automaticallyImplyLeading: false,
    title:  Row(
      children: [
        showArrow == true
            ? GestureDetector(
                onTap: () {
                  if (navigation != null) {
                    navigation();
                  } else {
                    Navigator.pop(context);
                  }
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: MyColors.black,
                ),
              )
            : const SizedBox(),
        Text(
          appBarTxt,
          style: MyFonts.styleMedium500_20

        ),
      ],
      ),
      elevation: 0.0,
      centerTitle: true,
      actions: actions
  );
}