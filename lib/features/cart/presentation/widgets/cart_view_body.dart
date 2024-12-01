import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/styles/fonts/my_fonts.dart';
import 'package:flowery_e_commerce/core/utils/extension/media_query_values.dart';
import 'package:flowery_e_commerce/core/utils/widgets/base/app_loader.dart';
import 'package:flowery_e_commerce/core/utils/widgets/custom_appbar.dart';
import 'package:flowery_e_commerce/features/cart/domain/entities/cart_entity.dart';
import 'package:flowery_e_commerce/features/cart/presentation/widgets/cart_item.dart';
import 'package:flowery_e_commerce/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key, required this.cart});
final CartEntity cart;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        appBarTxt: 'Cart ( ${cart.numOfCartItems}) ',
        showArrow: true,
        context: context,
      ),
      body: Column(
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
                  'Deliver to 2XVP+XC - Sheikh Zayed ',
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
             child:cart.cartList.isEmpty?AppLoader(): ListView.builder(
               shrinkWrap: true,
               itemCount: cart.cartList.length,
               itemBuilder: (context, index) {
               return CartItem(product: cart.cartList[index],);

             },),
           ),
          SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                 children: [
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                     Text(
                       'Sub Total ',
                       style: MyFonts.styleRegular400_16
                           .copyWith(color: MyColors.gray),
                     ),
                     Text(
                       '${cart.totalPrice} \$',
                       style: MyFonts.styleRegular400_16
                           .copyWith(color: MyColors.gray),
                     ),
                   ],),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                     Text(
                       'Delivery fee ',
                       style: MyFonts.styleRegular400_16
                           .copyWith(color: MyColors.gray),
                     ),
                     Text(
                       '${cart.discount} \$',
                       style: MyFonts.styleRegular400_16
                           .copyWith(color: MyColors.gray),
                     ),

                   ],),
                   const Divider(color: MyColors.white70,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text(
                         'Total ',
                         style: MyFonts.styleMedium500_18
                             .copyWith(color: MyColors.black),
                       ),
                       Text(
                         '${cart.totalPriceAfterDiscount} \$',
                         style: MyFonts.styleMedium500_18
                             .copyWith(color: MyColors.black),
                       ),

                     ],),
                 ],
                ),
              )),
        ],
      ),
    );
  }
}
