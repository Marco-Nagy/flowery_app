import 'package:flowery_e_commerce/core/styles/fonts/my_fonts.dart';
import 'package:flowery_e_commerce/core/utils/widgets/buttons/add_cart_button.dart';
import 'package:flowery_e_commerce/di/di.dart';
import 'package:flowery_e_commerce/features/cart/presentation/viewModel/cart_base_action.dart';
import 'package:flowery_e_commerce/features/cart/presentation/viewModel/cart_view_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/styles/colors/my_colors.dart';
import '../../../../core/utils/widgets/spacing.dart';
import '../widgets/slider_image.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProductDetailsWidget extends StatelessWidget {
  const ProductDetailsWidget({super.key, this.product});
  final dynamic product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SliderImage(
          imageUrls: product.images ?? [],
        ),
        verticalSpacing(16.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'EGP ${product.price}',
                    style: MyFonts.styleBold700_20,
                  ),
                  Row(
                    children: [
                      Text('${AppLocalizations.of(context)!.status}: ', style: MyFonts.styleMedium500_16),
                      Text(AppLocalizations.of(context)!.in_stock, style: MyFonts.styleRegular400_14),
                    ],
                  ),
                ],
              ),
              verticalSpacing(4.h),
              Text(AppLocalizations.of(context)!.all_prices_include_tax,
                  style: MyFonts.styleRegular400_13.copyWith(
                    color: MyColors.grey,
                  )),
              verticalSpacing(8.h),
              Text(
                '${product.quantity} ${product.title}',
                style: MyFonts.styleMedium500_16,
              ),
              verticalSpacing(24.h),
              Text(
                AppLocalizations.of(context)!.description,
                style: MyFonts.styleMedium500_16,
              ),
              verticalSpacing(8.h),
              Text(product.description ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: MyFonts.styleRegular400_14),
              verticalSpacing(24.h),
              Text(
                AppLocalizations.of(context)!.bouquet_include,
                style: MyFonts.styleMedium500_16,
              ),
              verticalSpacing(8.h),
              Text('${product.title}:${product.quantity}',
                  style: MyFonts.styleRegular400_14),
              verticalSpacing(4.h),
              Text(AppLocalizations.of(context)!.white_wrap, style: MyFonts.styleRegular400_14),
              verticalSpacing(24.h),
              AddCartButton(
                onTap: () {
                  getIt.get<CartViewModelCubit>().doAction(AddToCartAction(product.id));
                },
                height: 48.h,
                showRow: false,
              ),
              verticalSpacing(12.h),
            ],
          ),
        ),
      ],
    );
  }
}
