import 'package:flowery_e_commerce/core/utils/widgets/base/app_loader.dart';
import 'package:flowery_e_commerce/core/utils/widgets/base/snack_bar.dart';
import 'package:flowery_e_commerce/features/cart/presentation/viewModel/cart_view_model_cubit.dart';
import 'package:flowery_e_commerce/features/cart/presentation/widgets/cart_view_body.dart';
import 'package:flowery_e_commerce/features/cart/presentation/widgets/empty_cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CartView extends StatelessWidget {
  const CartView({super.key, required this.backButtonVisible});

  final bool backButtonVisible;

  @override
  Widget build(BuildContext context) {
    CartViewModelCubit cartViewModel = context.read<CartViewModelCubit>();

    return BlocConsumer<CartViewModelCubit, CartViewModelState>(
      builder: (context, state) {
        return cartViewModel.cartData!= null? CartViewBody(
          backButtonVisible: backButtonVisible,
          cart: cartViewModel.cartData!,
        ): const EmptyCartScreen();
      },
      listener: (BuildContext context, CartViewModelState state) {
        if (state is CartViewModelError) {
          return aweSnackBar(
              msg: state.errorModel.error!,
              context: context,
              type: MessageTypeConst.failure,
              title: AppLocalizations.of(context)!.error);
        }
      },
    );
  }
}
