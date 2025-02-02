import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/styles/fonts/my_fonts.dart';
import 'package:flowery_e_commerce/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/localization/lang_keys.dart';
import 'package:flowery_e_commerce/core/utils/extension/media_query_values.dart';
class EmptyCartScreen extends StatefulWidget {
  const EmptyCartScreen({super.key});

  @override
  EmptyCartScreenState createState() => EmptyCartScreenState();
}

class EmptyCartScreenState extends State<EmptyCartScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Lottie.asset(
                width: 300.w,
                height: 50.h,
                Assets.imagesFallingFlowersAnim,
                alignment: Alignment.bottomCenter,
                fit: BoxFit.fill,
              ),
            ),
            Lottie.asset(
              Assets.imagesEmptyFlowersCartAnim,
              alignment: Alignment.topLeft,
              fit: BoxFit.scaleDown,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 100.h,
                child: AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    ScaleAnimatedText(
                    context.translate(LangKeys.yourCartIsEmpty),
                      textStyle: MyFonts.styleBold700_24.copyWith(
                        fontFamily: 'oronteus',
                        color: MyColors.baseColor,
                      ),
                      scalingFactor: 1.5,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
