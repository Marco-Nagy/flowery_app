import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:flowery_e_commerce/core/utils/extension/media_query_values.dart';
import 'package:flowery_e_commerce/di/di.dart';
import 'package:flowery_e_commerce/features/cart/presentation/viewModel/cart_base_action.dart';
import 'package:flowery_e_commerce/features/cart/presentation/viewModel/cart_view_model_cubit.dart';
import 'package:flowery_e_commerce/features/cart/presentation/widgets/cart_icon_badge.dart';
import 'package:flowery_e_commerce/features/categories/presentation/categories/viewModel/categories_view_model_cubit.dart';
import 'package:flowery_e_commerce/features/generic/presentation/generic_item_by_product/viewModel/generic_item_action.dart';
import 'package:flowery_e_commerce/features/generic/presentation/generic_item_by_product/viewModel/generic_item_view_model_cubit.dart';
import 'package:flowery_e_commerce/features/generic/presentation/generic_item_by_product/views/generic_item_screen.dart';
import 'package:flowery_e_commerce/features/generic/presentation/widgets/filter_chip_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/widgets/spacing.dart';
import '../widgets/custom_filter_categories.dart';
import '../widgets/custom_search_categories.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  late Function(GlobalKey) addToCartAnimation;
  final cartKey = GlobalKey<CartIconKey>();
  CartViewModelCubit cartViewModelCubit = getIt.get<CartViewModelCubit>();

  void listClick(GlobalKey widgetKey) async {
    await addToCartAnimation(widgetKey);
    // cartViewModelCubit.updateCartCount();
    await cartViewModelCubit.cartKey.currentState!
        .runCartAnimation(cartViewModelCubit.cartQuantityItems.toString());
    cartViewModelCubit.doAction(GetUserCartDataAction());
  }

  @override
  void initState() {
    super.initState();
    // Initialize the cart count to 20
    WidgetsBinding.instance.addPostFrameCallback((_) async {
     await cartViewModelCubit.doAction(GetUserCartDataAction());
      // cartViewModelCubit.updateCartCount();

    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt.get<CategoriesViewModelCubit>(),
        ),
        BlocProvider(
          create: (context) => cartViewModelCubit..doAction(GetUserCartDataAction()),
        ),

        BlocProvider(
          create: (context) =>  getIt.get<GenericItemViewModelCubit>()
            ..doAction(GetItemAction('categories'))
            ..doAction(GetProductAction()),
        ),
      ],
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

          // return (GlobalKey) => addToCartAnimation(GlobalKey(cartKey));
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              Column(
                children: [
                  Padding(
                    padding:
                    const EdgeInsets.only(top: 50, left: 16, right: 16),
                    child: Row(
                      children: [
                        const Expanded(
                            flex: 3, child: CustomSearchCategories()),
                        horizontalSpacing(12),
                        const Expanded(
                            flex: 1, child: CustomFilterCategories()),
                        CartIconBadge(cartKey: cartViewModelCubit.cartKey,),
                      ],
                    ),
                  ),
                  verticalSpacing(16),
                  GenericItemScreen(
                    resourceName: 'categories',
                    field: 'category',
                    onClick: (widgetKey) => listClick(widgetKey),
                  ),
                ],
              ),
              Positioned(
                  bottom: 12,
                  left: context.width * 0.35,
                  child: FilterChipButton(onPressed: () {}))
            ],
          ),
        ),
      ),
    );
  }
}