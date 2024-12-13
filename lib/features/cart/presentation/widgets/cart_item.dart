import 'package:auto_size_text/auto_size_text.dart';
import 'package:flowery_e_commerce/features/cart/domain/entities/cart_response_entity.dart';
import 'package:flowery_e_commerce/features/cart/presentation/viewModel/cart_base_action.dart';
import 'package:flowery_e_commerce/features/cart/presentation/viewModel/cart_view_model_cubit.dart';
import 'package:flowery_e_commerce/features/cart/presentation/widgets/plus_minus_buttons.dart';
import 'package:flowery_e_commerce/features/generic/presentation/widgets/cached_network_widget.dart';
import 'package:flowery_e_commerce/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/colors/my_colors.dart';
import '../../../../core/styles/fonts/my_fonts.dart';
import '../../../../core/utils/widgets/spacing.dart';

class CartItem extends StatefulWidget {
  const CartItem({super.key, required this.product,});
 final CartProductEntity product;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return  Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: const EdgeInsets.all(8),
      elevation: 5.0,
      child: Container(
        height: 120.h,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: MyColors.white70),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 101.h,
              width: 96.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8)
              ),
              child: CachedNetworkWidget(
                  imageUrl: widget.product.imgCover.toString(),
              ),
            ),
            horizontalSpacing(8.w),
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText(
                              widget.product.title.toString(),
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.fade,
                              maxLines: 1,
                              style: MyFonts.styleMedium500_16.copyWith(color: MyColors.black),
                            ),
                            AutoSizeText(
                              '${widget.product.quantity} ${widget.product.title}',
                              overflow: TextOverflow.fade,
                              maxLines: 1,
                              style: MyFonts.styleRegular400_13.copyWith(color: MyColors.gray),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: () {
                              context.read<CartViewModelCubit>().doAction(RemoveFromCartAction(widget.product.id.toString()));
                            },
                            child: Image.asset(
                              Assets.imagesDelete,
                              height: 24.h,
                              width: 24.w,
                              color: MyColors.baseColor,
                              alignment: Alignment.centerRight,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(

                    children: [
                      Expanded(
                        child: AutoSizeText(
                          'EGP ${widget.product.price}',
                          style: MyFonts.styleMedium500_16.copyWith(color: MyColors.black),
                        ),
                      ),
                      PlusMinusButtons(addQuantity: () {

                            context.read<CartViewModelCubit>().doAction(
                                UpdateQuantityAction(
                                    widget.product.id.toString(),
                                    (widget.product.quantity+1)));
                          }, deleteQuantity: () {

                            context.read<CartViewModelCubit>().doAction(
                                UpdateQuantityAction(
                                    widget.product.id.toString(),
                                    (widget.product.quantity-1)));
                          }, text: widget.product.quantity.toString())
                    ],
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
