import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/styles/fonts/my_fonts.dart';
import 'package:flowery_e_commerce/core/utils/widgets/custom_appbar.dart';
import 'package:flowery_e_commerce/di/di.dart';
import 'package:flowery_e_commerce/features/best_seller/presentation/cubit/most_selling_cubit.dart';
import 'package:flowery_e_commerce/features/cart/presentation/viewModel/cart_view_model_cubit.dart';
import 'package:flowery_e_commerce/features/cart/presentation/widgets/cart_icon_badge.dart';
import 'package:flowery_e_commerce/features/generic/presentation/widgets/build_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/widgets/spacing.dart';

class MostSellingScreen extends StatefulWidget {
  const MostSellingScreen({super.key});

  @override
  State<MostSellingScreen> createState() => _MostSellingScreenState();
}

class _MostSellingScreenState extends State<MostSellingScreen> {
  MostSellerCubit mostSellerCubit = getIt.get<MostSellerCubit>()
    ..getMostSellers();

   late Function(GlobalKey) addToCartAnimation;
  final cartKey = GlobalKey<CartIconKey>();
  CartViewModelCubit cartViewModelCubit = getIt.get<CartViewModelCubit>();

  void listClick(GlobalKey widgetKey) async {
    await addToCartAnimation(widgetKey);
    await cartViewModelCubit.addToCart();
    await cartViewModelCubit.cartKey.currentState!
        .runCartAnimation(cartViewModelCubit.cartQuantityItems.toString());
  }

  @override
  void initState() {
    super.initState();
    // Initialize the cart count to latest count
    WidgetsBinding.instance.addPostFrameCallback((_) {
      cartViewModelCubit.updateCartCount();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => mostSellerCubit,
      child: AddToCartAnimation(
        cartKey: cartViewModelCubit.cartKey,
        height: 30,
        width: 30,
        opacity: 0.85,
        dragAnimation: const DragToCartAnimationOptions(
          rotation: true,
        ),
        jumpAnimation: const JumpAnimationOptions(),
        createAddToCartAnimation: (runAddToCartAnimation) {
          addToCartAnimation = runAddToCartAnimation;
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: customAppBar(
            appBarTxt: 'Best seller',
            context: context,
            showArrow: true,
              actions: [
                const SizedBox(width: 16),
                CartIconBadge(cartKey: cartViewModelCubit.cartKey, ),
                const SizedBox(
                  width: 16,
                )
              ]),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Text('Bloom with our exquisite best sellers',style:MyFonts.styleMedium500_14.copyWith(
                    color: MyColors.grey,
                  ) ,),
                ),
                verticalSpacing(20),

                BuildItem(onClick:(widgetKey)=>listClick(widgetKey)),
              ],
            ),
          ),
        ),
      ),
    );
            }
}

