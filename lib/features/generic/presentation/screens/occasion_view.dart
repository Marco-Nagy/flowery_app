import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/styles/fonts/my_fonts.dart';
import 'package:flowery_e_commerce/core/utils/widgets/custom_appbar.dart';
import 'package:flowery_e_commerce/di/di.dart';
import 'package:flowery_e_commerce/features/cart/presentation/viewModel/cart_view_model_cubit.dart';
import 'package:flowery_e_commerce/features/generic/presentation/generic_item_by_product/viewModel/generic_item_view_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/widgets/spacing.dart';
import '../generic_item_by_product/views/generic_item_screen.dart';

class OccasionView extends StatelessWidget {
   OccasionView({super.key});

  // final cartKey = GlobalKey<CartIconKey>();
  late Function(GlobalKey) addToCartAnimation;
   final cartKey = GlobalKey<CartIconKey>();
  CartViewModelCubit   viewModelCubit= getIt.get<CartViewModelCubit>();

  void listClick(GlobalKey widgetKey) async {
    await addToCartAnimation(widgetKey);
    await cartKey.currentState!.runCartAnimation(viewModelCubit.cartQuantityItems.toString());
  }

  @override
  Widget build(BuildContext context) {

    // Function(GlobalKey) onClick =
    // Key for Cart Icon
    return AddToCartAnimation(
      cartKey: cartKey,
      height: 30,
      width: 30,
      opacity: 0.85,
      dragAnimation: const DragToCartAnimationOptions(
        rotation: true,
      ),
      jumpAnimation: const JumpAnimationOptions(),
      createAddToCartAnimation: (runAddToCartAnimation) {
        addToCartAnimation = runAddToCartAnimation;


        // return (GlobalKey) => addToCartAnimation(GlobalKey(cartKey));
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: customAppBar(
            appBarTxt: 'Occasion',
            context: context,
            showArrow: true,
            actions: [
              const SizedBox(width: 16),
              AddToCartIcon(
                key: cartKey,
                icon: const Icon(Icons.shopping_cart),
                badgeOptions: const BadgeOptions(
                  active: true,
                  backgroundColor: Colors.red,
                ),
              ),
              const SizedBox(
                width: 16,
              )
            ]),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Text(
                'Bloom with our exquisite best sellers',
                style: MyFonts.styleMedium500_14.copyWith(color: MyColors.gray),
              ),
            ),

            verticalSpacing(20),
            // CatalogGenericScreen(resourceName: 'occasions',),
            GenericItemScreen(resourceName: 'occasions', field: 'occasion', onClick:(widgetKey)=>listClick(widgetKey))
          ],
        ),
      ),
    );

  }
}
