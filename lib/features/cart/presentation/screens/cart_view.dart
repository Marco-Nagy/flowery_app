import 'package:flowery_e_commerce/core/utils/widgets/base/app_loader.dart';
import 'package:flowery_e_commerce/core/utils/widgets/base/snack_bar.dart';
import 'package:flowery_e_commerce/features/cart/presentation/viewModel/cart_view_model_cubit.dart';
import 'package:flowery_e_commerce/features/cart/presentation/widgets/cart_view_body.dart';
import 'package:flowery_e_commerce/features/cart/presentation/widgets/empty_cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CartViewModelCubit cartViewModel = context.read<CartViewModelCubit>();

    return BlocConsumer<CartViewModelCubit, CartViewModelState>(

      builder: (context, state) {

        switch (state) {
          case GetUserCartDataSuccess():
            return state.cartData.cartList.isNotEmpty? CartViewBody(
              cart: state.cartData,
            ):const EmptyCartScreen();          case UpdateCartProductQuantitySuccess():
            break;
          case RemoveProductFromCartSuccess():
            return cartViewModel.cartData!.cartList.isNotEmpty? CartViewBody(
              cart: cartViewModel.cartData!,
            ):const EmptyCartScreen();
          case AddProductToCartSuccess():
            break;
          case ClearUserCartDataSuccess():
          case CartViewModelLoading():
            return const AppLoader();
          case CartViewModelError():
            break;
          case CartViewModelInitial():
        }
        return  CartViewBody(
          cart: context.read<CartViewModelCubit>().cartData!,
        );
      }, listener: (BuildContext context, CartViewModelState state) {
        if (state is CartViewModelError) {
          return aweSnackBar(
              msg: state.errorModel.error!,
              context: context,
              type: MessageTypeConst.failure, title: 'Error');
        }
      },
    );
  }
}
