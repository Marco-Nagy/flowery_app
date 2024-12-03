import 'package:flowery_e_commerce/core/utils/widgets/base/app_loader.dart';
import 'package:flowery_e_commerce/core/utils/widgets/base/snack_bar.dart';
import 'package:flowery_e_commerce/di/di.dart';
import 'package:flowery_e_commerce/features/cart/presentation/viewModel/cart_view_model_cubit.dart';
import 'package:flowery_e_commerce/features/cart/presentation/widgets/cart_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  CartViewModelCubit cartViewModel = getIt.get<CartViewModelCubit>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartViewModelCubit, CartViewModelState>(
      builder: (context, state) {
        switch (state) {
          case GetUserCartDataSuccess():
            break;
          case UpdateCartProductQuantitySuccess():
            break;
          case RemoveProductFromCartSuccess():
            return CartViewBody(
              cart: state.cartData,
            );
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
