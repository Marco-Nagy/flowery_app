import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/styles/fonts/my_fonts.dart';
import 'package:flutter/material.dart';


class CurvedButton extends StatelessWidget {
  const CurvedButton({
    super.key,
    required this.color,
    required this.title,
    required this.onTap,
    this.height,
    this.width,
    this.colorBorderSide,
    this.textColor,
  });

  final Color color;
  final String title;
  final VoidCallback onTap;
  final double? height;
  final double? width;
  final Color? colorBorderSide;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height??50,
      width: width??double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 24),
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: colorBorderSide ?? Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: Text(
          title,
          style: MyFonts.styleMedium500_16
              .copyWith(color: textColor ?? MyColors.white),
        ),
      ),
    );
  }
}
