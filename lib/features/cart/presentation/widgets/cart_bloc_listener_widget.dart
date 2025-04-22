import 'package:flowery_store/core/localization/lang_keys.dart';
import 'package:flowery_store/core/utils/extension/media_query_values.dart';
import 'package:flowery_store/core/utils/widgets/base/snack_bar.dart';
import 'package:flowery_store/features/cart/presentation/viewModel/cart_view_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBlocListenerWidget extends StatelessWidget {
  const CartBlocListenerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    CartViewModelCubit cartViewModelCubit = context.read<CartViewModelCubit>();
    return BlocListener<CartViewModelCubit, CartViewModelState>(
      listener: (context, state) async {
        switch (state) {
          case AddProductToCartSuccess():
            await cartViewModelCubit.cartKey.currentState!
                .runCartAnimation(state.numOfCartItems.toString());
            break;
          case GetUserCartDataSuccess():
            cartViewModelCubit.cartQuantityItems = state.cartData.numOfCartItems;
            break;
          case UpdateCartProductQuantitySuccess():
            cartViewModelCubit.cartQuantityItems = state.cartData.numOfCartItems;
            break;
          case RemoveProductFromCartSuccess():
          case ClearUserCartDataSuccess():
          case CartViewModelInitial():
          case CartViewModelLoading():
            break;
          case CartViewModelError():
            aweSnackBar(
              title: context.translate(LangKeys.error),
                msg: state.errorModel.error!, context: context, type: MessageTypeConst.failure);
            break;
        }
      },
      child: const SizedBox(),
    );
  }
}
