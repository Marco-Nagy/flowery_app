import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:flowery_e_commerce/di/di.dart';
import 'package:flowery_e_commerce/features/cart/presentation/viewModel/cart_view_model_cubit.dart';
import 'package:flowery_e_commerce/features/generic/presentation/generic_item_by_product/viewModel/generic_item_view_model_cubit.dart';
import 'package:flutter/material.dart';

class AddToCartAnimationWidget extends StatefulWidget {
  final Widget child;

  AddToCartAnimationWidget(
     {Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<AddToCartAnimationWidget> createState() => _AddToCartAnimationWidgetState();
}

class _AddToCartAnimationWidgetState extends State<AddToCartAnimationWidget> {
  // final cartKey = GlobalKey<CartIconKey>();
  late Function(GlobalKey) addToCartAnimation;
  CartViewModelCubit   viewModelCubit= getIt.get<CartViewModelCubit>();

  @override
  Widget build(BuildContext context) {

    return AddToCartAnimation(
        // To send the library the location of the Cart icon
        cartKey: viewModelCubit.cartKey,
        height: 30,
        width: 30,
        opacity: 0.85,
        dragAnimation: const DragToCartAnimationOptions(
        rotation: true,
    ),
    jumpAnimation: const JumpAnimationOptions(),
    createAddToCartAnimation: (runAddToCartAnimation) {
    // You can run the animation by addToCartAnimationMethod, just pass trough the the global key of  the image as parameter
         addToCartAnimation = runAddToCartAnimation;
         viewModelCubit.addToCartAnimation=runAddToCartAnimation;
        },
        child: widget.child);
  }
}
