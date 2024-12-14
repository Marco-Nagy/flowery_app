import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flowery_e_commerce/core/utils/extension/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/styles/colors/my_colors.dart';
import '../../../../../core/styles/fonts/my_fonts.dart';
import '../../../../../core/utils/widgets/buttons/add_cart_button.dart';
import '../../../../../core/utils/widgets/spacing.dart';
import '../../../../../generated/assets.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.name,
    required this.image,
    required this.price,
    required this.priceAfterDiscount,
  });

  final String name;
  final int price;
  final int priceAfterDiscount;
  final String image;

  @override
  Widget build(BuildContext context) {
    final discountPercentage =
        ((price - priceAfterDiscount) / price * 100).round();

    return SizedBox(
      width: context.width * 0.45,
      height: context.height * 0.35,
      child: InkWell(
        borderRadius: BorderRadius.circular(16.0),
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(color: MyColors.placeHolder),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: CachedNetworkImage(
                  imageUrl: image,
                  width: double.infinity,
                  height: context.height * 0.15,
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      Center(child: Lottie.asset(Assets.imagesLoading)),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              verticalSpacing(8.h),
              AutoSizeText(
                name,
                maxLines: 1,
                textAlign: TextAlign.center,
                style: MyFonts.styleRegular400_14.copyWith(
                  color: MyColors.black,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              verticalSpacing(11.h),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        "EGP $priceAfterDiscount",
                        style: MyFonts.styleMedium500_14.copyWith(
                          color: MyColors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    horizontalSpacing(10.w),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        "$price",
                        style: MyFonts.styleRegular400_12.copyWith(
                          color: MyColors.gray,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ),
                    horizontalSpacing(10.w),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        "$discountPercentage%",
                        style: MyFonts.styleMedium500_14.copyWith(
                          color: MyColors.green,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpacing(8.h),
              AddCartButton(onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
