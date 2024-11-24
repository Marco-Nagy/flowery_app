import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flowery_e_commerce/core/styles/animated_image.dart';
import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/styles/fonts/my_fonts.dart';
import 'package:flowery_e_commerce/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../spacing.dart';

class AppLoader extends StatefulWidget {
  const AppLoader({Key? key}) : super(key: key);

  @override
  _AppLoaderState createState() => _AppLoaderState();
}

class _AppLoaderState extends State<AppLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset(
            Assets.imagesFloweryLoader,
            height: MediaQuery.of(context).size.height * .2,
            alignment: Alignment.bottomCenter,
            fit: BoxFit.scaleDown

          ),
          verticalSpacing(15),
          Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedTextKit(
              repeatForever: true,
              animatedTexts: [
                ScaleAnimatedText('Flowery',
                    textStyle: MyFonts.styleBold700_24.copyWith(
                        fontFamily: 'oronteus', color: MyColors.baseColor),
                    scalingFactor: 2,
                    textAlign: TextAlign.center),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
