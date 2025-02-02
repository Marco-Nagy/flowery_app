import 'package:flowery_e_commerce/core/localization/lang_keys.dart';
import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/styles/fonts/my_fonts.dart';
import 'package:flowery_e_commerce/core/utils/extension/media_query_values.dart';
import 'package:flowery_e_commerce/core/utils/widgets/buttons/carved_button.dart';
import 'package:flowery_e_commerce/core/utils/widgets/custom_appbar.dart';
import 'package:flowery_e_commerce/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PlaceOrderSuccess extends StatelessWidget {
  final String orderId;

  const PlaceOrderSuccess({Key? key, required this.orderId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: customAppBar(
          appBarTxt: context.translate(LangKeys.trackOrder),
          context: context,
          showArrow: true),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 50.h,
          children: [
            SvgPicture.asset(
              Assets.imagesSuccessImg,
              width: 150.w,
              height: 150.h,
              fit: BoxFit.fill,
            ),
            SizedBox(
                width: 200.w,
                child: Text(
                  context.translate(LangKeys.orderPlacedSuccessfully),
                  style: MyFonts.styleBold700_24,
                  textAlign: TextAlign.center,
                )),
            CurvedButton(
              title:context.translate(LangKeys.trackOrder) ,
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
