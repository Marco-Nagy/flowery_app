import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import '../../../../core/styles/colors/my_colors.dart';
import '../../../../core/styles/fonts/my_fonts.dart';
import '../../../../core/utils/widgets/spacing.dart';
import '../../../../generated/assets.dart';

class AppLogoSection extends StatelessWidget {
  const AppLogoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FadeIn(
          duration: const Duration(milliseconds: 1000),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              Assets.imagesAboutAppImage,
              height: 120,
              width: 120,
            ),
          ),
        ),
        verticalSpacing(20),
        FadeInUp(
          duration: const Duration(milliseconds: 1200),
          child: Text(
            "Welcome to Flowery App",
            style: MyFonts.styleMedium500_20.copyWith(
              color: MyColors.black,
              letterSpacing: 1.2,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        verticalSpacing(15),
        FadeInUp(
          duration: const Duration(milliseconds: 1400),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Discover a wide variety of flowers for all occasions.",
              style: TextStyle(fontSize: 16, height: 1.8, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
