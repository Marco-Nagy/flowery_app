import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:flowery_e_commerce/core/utils/widgets/base/base_view.dart';
import 'package:flowery_e_commerce/features/cart/presentation/viewModel/cart_base_action.dart';
import 'package:flowery_e_commerce/features/cart/presentation/viewModel/cart_view_model_cubit.dart';
import 'package:flowery_e_commerce/features/cart/presentation/widgets/cart_icon_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/arrow_back_widget.dart';
import '../widgets/product_details_widget.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({super.key, required this.product});

  final dynamic product;

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  late Function(GlobalKey) addToCartAnimation;
  final GlobalKey widgetKey = GlobalKey();

  void listClick(GlobalKey widgetKey) async {
    CartViewModelCubit cartViewModelCubit = context.read<CartViewModelCubit>();

    await cartViewModelCubit.doAction(GetUserCartDataAction());
    addToCartAnimation(widgetKey);

    cartViewModelCubit.cartKey.currentState!
        .runCartAnimation(cartViewModelCubit.cartQuantityItems.toString());
  }

  @override
  void initState() {
    super.initState();
    CartViewModelCubit cartViewModelCubit = context.read<CartViewModelCubit>();

    // Initialize the cart count to 20
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      cartViewModelCubit.doAction(GetUserCartDataAction());
      // Check if cartQuantityItems is initialized
        cartViewModelCubit.cartKey.currentState!
            .runCartAnimation(cartViewModelCubit.cartQuantityItems.toString());

    });
  }

  @override
  Widget build(BuildContext context) {
    CartViewModelCubit cartViewModelCubit = context.read<CartViewModelCubit>();

    return AddToCartAnimation(
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
        body: Stack(
          children: [
            SingleChildScrollView(
              child: ProductDetailsWidget(
                product: widget.product,
                onClick: (widgetKey) => listClick(widgetKey),
              ),
            ),
            // Combine Positioned widgets into the same Stack
            Positioned(
              top: 30,
              left: 10,
              child: arrowBackWidget(context),
            ),
            Positioned(
              top: 30,
              right: 10,
              child: CartIconBadge(
                cartKey: cartViewModelCubit.cartKey,
              ),
            ),
          ],
        ),
      ),
    );
  }

}
