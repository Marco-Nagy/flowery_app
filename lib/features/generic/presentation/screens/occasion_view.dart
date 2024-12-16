import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/styles/fonts/my_fonts.dart';
import 'package:flowery_e_commerce/core/utils/widgets/custom_appbar.dart';
import 'package:flowery_e_commerce/features/cart/presentation/viewModel/cart_base_action.dart';
import 'package:flowery_e_commerce/features/cart/presentation/viewModel/cart_view_model_cubit.dart';
import 'package:flowery_e_commerce/features/cart/presentation/widgets/cart_icon_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../core/utils/widgets/spacing.dart';
import '../generic_item_by_product/views/generic_item_screen.dart';

class OccasionView extends StatefulWidget {
  const OccasionView({super.key});

  @override
  State<OccasionView> createState() => _OccasionViewState();
}

class _OccasionViewState extends State<OccasionView> {
  late Function(GlobalKey) addToCartAnimation;


  void listClick(GlobalKey widgetKey) async {
    CartViewModelCubit cartViewModelCubit = context.read<CartViewModelCubit>();

    cartViewModelCubit.doAction(GetUserCartDataAction());

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
      cartViewModelCubit.cartKey.currentState!
          .runCartAnimation(cartViewModelCubit.cartQuantityItems.toString());

    });
  }

  @override
  Widget build(BuildContext context) {
    CartViewModelCubit cartViewModelCubit = context.read<CartViewModelCubit>();

    // Function(GlobalKey) onClick =
    // Key for Cart Icon
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

        // return (GlobalKey) => addToCartAnimation(GlobalKey(cartKey));
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: customAppBar(
            appBarTxt:  AppLocalizations.of(context)!.occasion,
            context: context,
            showArrow: true,
            actions: [
              const SizedBox(width: 16),
              CartIconBadge(
                cartKey: cartViewModelCubit.cartKey,
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
                AppLocalizations.of(context)!.best_sellers_desc,
                style: MyFonts.styleMedium500_14.copyWith(color: MyColors.gray),
              ),
            ),

            verticalSpacing(20),
            // CatalogGenericScreen(resourceName: 'occasions',),
            GenericItemScreen(
                resourceName: 'occasions',
                field: 'occasion',
                onClick: (widgetKey) => listClick(widgetKey))
          ],
        ),
      ),
    );
  }
}
