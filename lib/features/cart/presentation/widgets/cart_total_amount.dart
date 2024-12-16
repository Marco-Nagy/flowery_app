import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/styles/fonts/my_fonts.dart';
import 'package:flowery_e_commerce/features/cart/domain/entities/cart_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CartTotalAmount extends StatelessWidget {
  final CartEntity cart;
  const CartTotalAmount({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    return        SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.sub_total,
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
                    AppLocalizations.of(context)!.delivery_fee,
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
                  AppLocalizations.of(context)!.total,
                    style: MyFonts.styleMedium500_18
                        .copyWith(color: MyColors.black),
                  ),
                  Text(
                    '${cart.totalPrice} \$',
                    style: MyFonts.styleMedium500_18
                        .copyWith(color: MyColors.black),
                  ),

                ],),


            ],
          ),
        ));
  }
}
