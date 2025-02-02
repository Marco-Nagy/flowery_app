import 'package:flowery_e_commerce/core/routes/app_routes.dart';
import 'package:flowery_e_commerce/core/services/shared_preference/shared_pref_keys.dart';
import 'package:flowery_e_commerce/core/services/shared_preference/shared_preference_helper.dart';
import 'package:flowery_e_commerce/core/styles/fonts/my_fonts.dart';
import 'package:flowery_e_commerce/core/utils/extension/navigation.dart';
import 'package:flowery_e_commerce/core/utils/widgets/buttons/add_cart_button.dart';
import 'package:flowery_e_commerce/features/cart/presentation/viewModel/cart_base_action.dart';
import 'package:flowery_e_commerce/features/cart/presentation/viewModel/cart_view_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/localization/lang_keys.dart';
import 'package:flowery_e_commerce/core/utils/extension/media_query_values.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/styles/colors/my_colors.dart';
import '../../../../core/utils/widgets/spacing.dart';
import '../widgets/slider_image.dart';

class ProductDetailsWidget extends StatelessWidget {
   ProductDetailsWidget({super.key, this.product, required this.onClick});
  final dynamic product;
  final GlobalKey widgetKey = GlobalKey();

  final void Function(GlobalKey) onClick; // Key f
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
                      Text('${context.translate(LangKeys.status)}: ', style: MyFonts.styleMedium500_16),
                      Text(context.translate(LangKeys.inStock), style: MyFonts.styleRegular400_14),
                    ],
                  ),
                ],
              ),
              verticalSpacing(4.h),
              Text(context.translate(LangKeys.allPricesIncludeTax),
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
                context.translate(LangKeys.description),
                style: MyFonts.styleMedium500_16,
              ),
              verticalSpacing(8.h),
              Text(product.description ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: MyFonts.styleRegular400_14),
              verticalSpacing(24.h),
              Text(
                context.translate(LangKeys.bouquetInclude),
                style: MyFonts.styleMedium500_16,
              ),
              verticalSpacing(8.h),
              Text('${product.title}:${product.quantity}',
                  style: MyFonts.styleRegular400_14),
              verticalSpacing(4.h),
              Text(context.translate(LangKeys.whiteWrap), style: MyFonts.styleRegular400_14),
              verticalSpacing(24.h),
              AddCartButton(
                onTap: () {
                  onClick(widgetKey);
                  final token =  SharedPrefHelper().getString(key: SharedPrefKeys.tokenKey);
                  if (token != null) {
                    context.read<CartViewModelCubit>().doAction(AddToCartAction(product.id?.toString() ?? ''));
                  }else{
                    context.pushNamed(AppRoutes.login);
                  }
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
