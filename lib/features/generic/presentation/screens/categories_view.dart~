import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:add_to_cart_animation/jump_animation_options.dart';
import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/utils/extension/mediaQueryValues.dart';
import 'package:flowery_e_commerce/core/utils/widgets/custom_appbar.dart';
import 'package:flowery_e_commerce/di/di.dart';
import 'package:flowery_e_commerce/features/cart/presentation/viewModel/cart_view_model_cubit.dart';
import 'package:flowery_e_commerce/features/categories/presentation/categories/viewModel/categories_action.dart';
import 'package:flowery_e_commerce/features/categories/presentation/categories/viewModel/categories_view_model_cubit.dart';
import 'package:flowery_e_commerce/features/categories/presentation/categories/widgets/filter_chip_button.dart';
import 'package:flowery_e_commerce/features/generic/presentation/generic_item_by_product/viewModel/generic_item_view_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/widgets/spacing.dart';
import '../../../../generic/presentation/generic_item_by_product/views/generic_item_screen.dart';
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
  CartViewModelCubit viewModelCubit = getIt.get<CartViewModelCubit>();

  void listClick(GlobalKey widgetKey) async {
    await addToCartAnimation(widgetKey);
    await viewModelCubit.addToCart();
    await viewModelCubit.cartKey.currentState!
        .runCartAnimation(viewModelCubit.cartQuantityItems.toString());
  }

  @override
  void initState() {
    super.initState();
    // Initialize the cart count to 20
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // viewModelCubit.cartQuantityItems = 20;
      viewModelCubit.updateCartCount();
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
          create: (context) => getIt.get<GenericItemViewModelCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt.get<GenericItemViewModelCubit>(),
        ),
      ],
      child: AddToCartAnimation(
        cartKey: viewModelCubit.cartKey,
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
              appBarTxt: '',
              context: context,
              showArrow: false,
              actions: [
                const SizedBox(width: 16),
                AddToCartIcon(
                  key: viewModelCubit.cartKey,
                  icon: const Icon(Icons.shopping_cart),
                  badgeOptions: const BadgeOptions(
                    active: true,
                    backgroundColor: Colors.red,
                  ),
                ),
                const SizedBox(
                  width: 16,
                )
              ]),
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
                      ],
                    ),
                  ),
                  verticalSpacing(16),
                  GenericItemScreen(
                      resourceName: 'categories', field: 'category',onClick:(widgetKey)=>listClick(widgetKey)),
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
