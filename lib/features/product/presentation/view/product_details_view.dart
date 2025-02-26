import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:flowery_e_commerce/core/networking/common/regestet_context_module.dart';
import 'package:flowery_e_commerce/features/cart/presentation/viewModel/cart_base_action.dart';
import 'package:flowery_e_commerce/features/cart/presentation/viewModel/cart_view_model_cubit.dart';
import 'package:flowery_e_commerce/features/cart/presentation/widgets/cart_icon_badge.dart';
import 'package:flutter/material.dart';

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
  CartViewModelCubit cartViewModelCubit = getIt.get<CartViewModelCubit>();

  void listClick(GlobalKey widgetKey) async {
    await cartViewModelCubit
        .doAction(GetUserCartDataAction())
        .whenComplete(() async {
      await cartViewModelCubit.cartKey.currentState!.runCartAnimation(
          cartViewModelCubit.cartData!.numOfCartItems.toString());
    });
    addToCartAnimation(widgetKey);
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future getData() async {
      await cartViewModelCubit
          .doAction(GetUserCartDataAction())
          .whenComplete(() async {
        await cartViewModelCubit.cartKey.currentState!.runCartAnimation(
            cartViewModelCubit.cartData!.numOfCartItems.toString());
      });

  }

  @override
  Widget build(BuildContext context) {
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
