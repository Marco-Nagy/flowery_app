import 'package:flowery_e_commerce/core/utils/widgets/base/app_loader.dart';
import 'package:flowery_e_commerce/di/di.dart';
import 'package:flowery_e_commerce/features/cart/domain/entities/cart_entity.dart';
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
    return BlocBuilder<CartViewModelCubit, CartViewModelState>(
      builder: (context, state) {
        switch (state) {
          case AddProductToCartSuccess():
            break;
          case GetUserCartDataSuccess():
            return CartViewBody(
              cart: state.cartData,
            );
          case UpdateCartProductQuantitySuccess():
            cartViewModel.cartData =CartEntity(numOfCartItems: 0, cartList: [], totalPrice: 0, discount: 0, totalPriceAfterDiscount: 0);
            cartViewModel.cartData =state.cartData;

            return CartViewBody(
              cart: cartViewModel.cartData,
            );
          case RemoveProductFromCartSuccess():
          case ClearUserCartDataSuccess():
          case CartViewModelLoading():
            return const AppLoader();
          case CartViewModelError():
            break;
          case CartViewModelInitial():
          // TODO: Handle this case.
        }
        return Container();
      },
    );
  }
}
