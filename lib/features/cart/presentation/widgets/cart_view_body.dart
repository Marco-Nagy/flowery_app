import 'package:animate_do/animate_do.dart';
import 'package:flowery_e_commerce/core/routes/app_routes.dart';
import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/styles/fonts/my_fonts.dart';
import 'package:flowery_e_commerce/core/utils/extension/navigation.dart';
import 'package:flowery_e_commerce/core/utils/widgets/buttons/carved_button.dart';
import 'package:flowery_e_commerce/core/utils/widgets/custom_appbar.dart';
import 'package:flowery_e_commerce/core/utils/widgets/spacing.dart';
import 'package:flowery_e_commerce/features/cart/domain/entities/cart_entity.dart';
import 'package:flowery_e_commerce/features/cart/presentation/widgets/cart_item.dart';
import 'package:flowery_e_commerce/features/cart/presentation/widgets/cart_total_amount.dart';
import 'package:flowery_e_commerce/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'empty_cart_screen.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key, required this.cart, required this.backButtonVisible});
final CartEntity cart;
final  bool backButtonVisible;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(
        appBarTxt:cart.numOfCartItems>0? '${AppLocalizations.of(context)!.cart} (${cart.numOfCartItems} ${AppLocalizations.of(context)!.items}) ':'',
        showArrow: backButtonVisible,
        context: context,
      ),
      body: cart!=null&&cart.cartList.isNotEmpty? Column(
        children: [
          Container(
            margin: EdgeInsets.all(15.sp),
            child: Row(
              children: [
                Image.asset(
                  Assets.imagesLocationOn,
                  height: 20.h,
                  width: 20.w,
                ),
                SizedBox(
                  width: 2.w,
                ),
                Text(
                 AppLocalizations.of(context)!.deliver_sheikh_zayed ,
                  style: MyFonts.styleMedium500_14
                      .copyWith(color: MyColors.blackBase),
                ),
                SizedBox(
                  width: 2.w,
                ),
                Image.asset(
                  Assets.imagesArrowDownIos,
                  height: 16.h,
                  width: 16.w,
                ),
              ],
            ),
          ),
           Expanded(
            child: SizedBox(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: cart.cartList.length,
                itemBuilder: (context, index) {
                  return FadeInLeft(
                      curve: Curves.linear,
                      duration: Duration(milliseconds: 100 * (index + 5)),
                      child: CartItem(
                        product: cart.cartList[index],
                      ));
                },),
             ),
           ),
          CartTotalAmount(cart: cart),
          verticalSpacing(16),
          CurvedButton(title:AppLocalizations.of(context)!.checkout,
            onTap: () => context.pushNamed(AppRoutes.checkoutScreen,
              arguments: cart),
            color: MyColors.baseColor,),
          verticalSpacing(16),
        ],
      ): const EmptyCartScreen(),
    );
  }
}
